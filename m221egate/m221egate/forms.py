'''
Created on Aug 29, 2009

@author: pkremer
'''

from turbogears.widgets import JumpMenu

def idtoUrl(id, baseurl = '/'):
    return baseurl + "capsule?id=%s" %id

def pilotMenu(pilots, baseurl = '/'):
    opts = [ (baseurl, "PILOT") ]
    for (name, id) in pilots:
        opts.append( (idtoUrl(id, baseurl), name) )
    widget = JumpMenu("pilotjumpmenu", options = opts)
    return widget
