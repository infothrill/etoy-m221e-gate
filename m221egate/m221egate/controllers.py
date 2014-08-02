import os
import shutil
import logging
from urllib import quote_plus

import cherrypy
from turbogears import controllers, expose, flash, redirect, url

from forms import pilotMenu
from m221e import listOfPilots

from scramble import m221estreamchecksum, generateFilename, hasExtension, getExtension, parseScrambledName

log = logging.getLogger("m221egate.controllers")

# TODO: cleanup left-overs in /uploads/ directory - turbogears scheduler?

MAX_UPLOAD_SIZE = 1024 * 1024 * 10 # 10 MiB # TODO
ETERNITY_FS = "/home/pol/eternityfs/"

def restartSession(msg = ''):
    text = "Invalid input"
    if len(msg) > 0:
        text += " (%s)" % msg
    flash(text)
    redirect("/")

def getUploadDir():
    UPLOAD_DIR = os.path.join(os.getcwd(), cherrypy.config.get("gate.uploaddir", "./uploads/"))
    if not os.path.exists(UPLOAD_DIR):
        os.makedirs(UPLOAD_DIR)
    return UPLOAD_DIR

class Root(controllers.RootController):
    @expose(template="m221egate.templates.welcome")
    def default(self, *args, **kw):
        return self.index()

    @expose(template="m221egate.templates.welcome")
    def index(self):
        # Session variable initialization (or recall if exists)
        cherrypy.session['uploadcount'] = cherrypy.session.get('uploadcount', 0)

        #cherrypy.session['count'] = cherrypy.session['count'] + 1
        return dict(pilotlist = pilotMenu(listOfPilots(), url('/')))

    @expose(template="m221egate.templates.choosefile")
    def capsule(self, id = None):
        if not id is None:
            id = id.upper()
        if id is not None and id in [ p[1] for p in listOfPilots() ]:
            cherrypy.session['id'] = id # store in session
            return dict( id = id )
        else:
            redirect("/")

    @expose()
    def upload(self, id, upload_file):
        """
        the actual upload hapens here. result is always a redirect, either
        presenting the upload form again or falling back to the entry page.
        """
        id = id.upper()
        # cheap ass protection against bots that don't have a cookie/session:
        if not id == cherrypy.session.get('id'):
            restartSession("upload / id")

        checksum = ''
        if len(upload_file.file.read(1)) < 1:
            flash("You must chose a file to continue!")
            redirect("/capsule", id = id)
        else:
            upload_file.file.seek(0)

        try:
            log.debug("upload file was sent with mimetype: %s", upload_file.type)
            checksum = m221estreamchecksum(upload_file.file)
            scrambled_name = generateFilename(id, upload_file.filename, checksum, upload_file.type)
            log.debug("scrambled name is: %s", scrambled_name)
            upload_file.file.seek(0)
            target_file_name = os.path.join(getUploadDir(), scrambled_name)
            f = open(target_file_name, 'wb')
            f.write(upload_file.file.read())
            f.close()
            #print os.path.getsize(target_file_name)
        except IOError, e:
            log.error("File upload error", exc_info = e)
            flash("File upload error: %r" % e)
            redirect("/capsule", id = id)
        except Exception, e:
            log.error("File upload error", exc_info = e)
            flash("File upload error: %r" % e)
            redirect("/capsule", id = id)
        
        if not hasExtension(upload_file.filename):
            cherrypy.session['ext_check'] =  True
            cherrypy.session['ext_computed'] = getExtension(upload_file.filename, upload_file.type) 
        else:
            cherrypy.session['ext_check'] =  False

        cherrypy.session['client_fname'] =  upload_file.filename
        cherrypy.session['client_mimetype'] =  upload_file.type
        cherrypy.session['checksum'] =  checksum
        cherrypy.session['scrambled_name'] = scrambled_name
        cherrypy.session['queue_absfilename'] = target_file_name
        redirect("/release", id = id)

    @expose(template="m221egate.templates.release")
    def release(self, id):
        """
        this method shows a last warning before commiting data to eternity
        """
        id = id.upper()
        if not id == cherrypy.session.get('id'):
            restartSession("Session invalid (id). Enable cookies, please.")
        try:
            assert not cherrypy.session.get('client_fname') is None
            assert not cherrypy.session.get('client_mimetype') is None
            assert not cherrypy.session.get('checksum') is None
            assert not cherrypy.session.get('scrambled_name') is None
            assert not cherrypy.session.get('queue_absfilename') is None
        except AssertionError:
            restartSession("assertion test failed on session data")

        return dict( id = id,
                     chksm = cherrypy.session['checksum'],
                     name = cherrypy.session['client_fname'],
                     ext_check = cherrypy.session.get('ext_check', False),
                     ext_computed = cherrypy.session.get('ext_computed', ''),
                     scrambled_name = cherrypy.session.get('scrambled_name'),
                     )
    
    @expose(template="m221egate.templates.letgo")
    def letgo(self, id, chksm):
        """
        this is the method DOING the actual release. When successful,
        redirects to the trace page. Otherwise, error.
        """
        id = id.upper()
        chksm = chksm.lower()
        if not id == cherrypy.session.get('id'):
            restartSession("Session invalid (id). Enable cookies, please.")
        scrambled_name = cherrypy.session.get('scrambled_name')
        # verify that the currently queued file has the same ID:
        (_chksm, _id, _ext) = parseScrambledName(scrambled_name)
        if (not _id == id) or (not _chksm == chksm):
            restartSession("Session invalid (id/chksum). Enable cookies, please.")
        # ACTUAL RELEASE STARTS HERE
        try:
            capsuledir = os.path.join(ETERNITY_FS, id)
            targetfname = os.path.join(capsuledir, scrambled_name)
            srcfname = cherrypy.session.get('queue_absfilename')
            assert os.path.isdir(capsuledir), "Dir %s does not exist" % (capsuledir)
            assert os.path.isfile(srcfname), "src file %s does not exist" % (srcfname)
            if os.path.isfile(targetfname):
                pass # nothing to do ;-)
            else:
                try:
                    shutil.copy(srcfname, targetfname)
                except Exception, e:
                    log.error("Error copying file %s to %s", srcfname, targetfname, exc_info = e)
                    os.unlink(targetfname)
            name = cherrypy.session.get('client_fname')
        except Exception, e:
            log.error("An error occured during letgo", exc_info = e)
            restartSession("Error during letgo phase")
        
        redirect("/trace", t = scrambled_name, n = name)

    @expose(template="m221egate.templates.trace")
    def trace(self, t, n):
        """
        special page for perma-linking to previously published content.
        Has no idea about original filename, date published etc.
        Can only be used to tell the same m221e story over and over,
        providing additional hints about the file. 
        """
        # check if the scrambled name is in the session, if yes, it means user
        # just uploaded exactly this file.
        # if not, he is coming back or a different user visits the permalink.
        # Also, remove the session data, it is now not needed anymore!
        name = n
        chksm = ''
        id = ''
        ext = ''
        wasJustUploaded = False
        if not cherrypy.session.get('scrambled_name', '') == '':
            # use just uploaded it!
            scrambled_name = cherrypy.session.get('scrambled_name')
            chksm = cherrypy.session.get('checksum')
            id = cherrypy.session.get('id')
            (_chksm, _id, ext) = parseScrambledName(scrambled_name)
            if (not _id == id) or (not _chksm == chksm):
                raise ValueError, "Hm, sths wrong..."
            wasJustUploaded = True
        else:
            scrambled_name = t
            try:
                (chksm, id, ext) = parseScrambledName(scrambled_name)
            except ValueError, e:
                log.error("Trace param %r is invalid", t)
                redirect("/")
        
        # delete session information, if present:
        keys = ['scrambled_name', 'id', 'client_fname', 'queue_absfilename',
                'ext_check', 'ext_computed', 'checksum', 'client_mimetype']
        for k in keys:
            if k in cherrypy.session:
                del cherrypy.session[k]
        #compute URL for social web:
        host = "http://www.missioneternity.org"
        bkurl = host + url("/trace", t = scrambled_name, n = name)
        bkurl = bkurl.replace("&", "%26")
        bkurl = bkurl.replace("?", "%3f")
        title = quote_plus(name + " released to eternity")
        description = quote_plus(name + " has become " + scrambled_name + " for eternity")
        return dict(
                    id = id,
                    chksm = chksm,
                    ext = ext,
                    scrambledname = scrambled_name,
                    name = name,
                    url = bkurl,
                    title = title,
                    description = description,
                    wasJustUploaded = wasJustUploaded,
                    )
