<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?python from urllib import urlencode ?> 
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:py="http://purl.org/kid/ns#"
    py:extends="'master.kid'">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" py:replace="''"/>
<title>"${name}" released to eternity / Crossing the Deadline - MISSION ETERNITY</title>
</head>
<body>
<h1>"<tt>${name}</tt>" has become</h1>
<pre>${scrambledname}</pre>
<p>
The file has been transferred to the <a href="http://missioneternity.org/data-storage/">ANGEL NETWORK</a>,
a peer-to-peer system consisting of hundreds of ANGELS/computers - each one helping to preserve the data.
</p>
<p>The replication process of the data has started. The file will be spread
accross multiple nodes in the next hours/days. See <a href="http://missioneternity.org/mission-status/">MISSION STATUS</a>
for data survival information.</p>

<h3>
Help preserve memory: <a href="http://missioneternity.org/angels/become-a-mission-eternity-angel/">become an ANGEL</a>
and <a href="http://missioneternity.org/angel-application/">download the ANGEL APPLICATION</a>
</h3>
<br/>
<h3>DO YOU LIKE THIS EXPERIENCE? </h3>
<p>share: 
<a href="mailto:somebody?subject=${name} released to eternity&amp;body=${url}"><img src="${tg.url('/static/images/email.png')}" border="0" width="16" height="16" alt="Email" title="Email"/></a>
<a href="javascript:window.print()"><img src="${tg.url('/static/images/print.png')}" border="0" width="16" height="16" alt="Print" title="Print"/></a>
<a href="http://delicious.com/save" onclick="window.open('http://delicious.com/save?v=5&amp;noui&amp;jump=close&amp;url='+encodeURIComponent(location.href)+'&amp;title='+encodeURIComponent(document.title), 'delicious','toolbar=no,width=550,height=550'); return false;"><img src="http://static.delicious.com/img/delicious.gif" height="16" width="16" alt="Delicious" title="Delicious" border="0"/></a>
<a href="http://digg.com/submit?url=${url}&amp;title=${title}&amp;bodytext=${description}" target="_blank"><img src="http://digg.com/img/badges/16x16-digg-guy.png" width="16" height="16" alt="Digg!" title="Digg" border="0"/></a>
<a href="http://www.reddit.com/submit?url=${url}&amp;title=${title}" target="_blank"><img src="http://www.reddit.com/static/spreddit4.gif" alt="reddit" border="0"  title="Reddit"/></a>
<a href="http://www.twitter.com/home?status=${url}" target="_blank"><img src="http://www.twitter.com/favicon.ico" border="0" width="16" height="16" alt="Twitter" title="Twitter"/></a>
<a href="http://slashdot.org/slashdot-it.pl?op=basic&amp;url=${url}" target="_blank"><img src="http://images.slashdot.org/favicon.ico" alt="Slashdot" border="0" height="16" width="16" title="Slashdot"/></a>
<a href="http://technorati.com/faves?add=${url}" target="_blank"><img border="0" alt="Technorati" src="${tg.url('/static/images/technorati.png')}" title="Technorati"/></a>
<a href="http://friendfeed.com/?url=${url}&amp;title=${title}" target="_blank"><img src="http://friendfeed.com/favicon.ico" alt="Friendfeed" border="0" title="Friendfeed"/></a>
<a href="http://www.facebook.com/share.php?u=${url}&amp;t=${title}" target="_blank"><img src="http://www.facebook.com/favicon.ico" border="0" width="16" height="16" alt="Facebook" title="Facebook"/></a>
<a href="http://www.stumbleupon.com/submit?url=${url}&amp;title=${title}" target="_blank"><img border="0" src="http://cdn.stumble-upon.com/images/16x16_su_solid.gif" alt="stumble upon" title="StumbleUpon"/></a>
<a href="http://www.google.com/bookmarks/mark?op=add&amp;bkmk=${url}&amp;title=${title}" target="_blank"><img src="http://www.google.de/favicon.ico" border="0" alt="Google Bookmark" title="GoogleBookmark"/></a>
<a href="http://linkarena.com/bookmarks/addlink/?url=${url}&amp;title=${title}" target="_blank"><img src="http://linkarena.com/linkarena.ico" style="border: 0;width:16px;height:16px;" alt="linkarena" title="Linkarena"/></a>
<a href="http://www.myspace.com/index.cfm?fuseaction=postto&amp;u=${url}&amp;t=${title}" target="_blank"><img src="http://www.myspace.com/favicon.ico" border="0" alt="Myspace" title="Myspace"/></a>
<a href="http://www.studivz.net/Suggest/Selection/?u=${url}&amp;desc=${title}" target="_blank"><img src="http://www.studivz.net/favicon.ico" border="0" alt="studiVZ" title="StudiVZ"/></a>
<a href="http://www.mister-wong.de/index.php?action=addurl&amp;bm_url=${url}&amp;bm_description=${title}" target="_blank"><img src="http://www.mister-wong.de/favicon.ico" alt="Mister Wong" width="16" height="16" border="0" title="MisterWong"/></a>
<a href="http://www.diigo.com/post?url=${url}&amp;title=${title}" target="_blank"><img style="border:none" src="http://www.diigo.com/images/ii_blue.gif" alt="diigo" title="Diigo"/></a>
<a href="http://www.mixx.com/submit?${url}" target="_blank"><img src="http://www.mixx.com/images/buttons/mixx-button4.png" alt="Mixx!" border="0"  title="Mixx"/></a> 
<a href="https://favorites.live.com/quickadd.aspx?url=${url}&amp;title=${title}" target="_blank"><img border="0" alt="live" src="${tg.url('/static/images/live.png')}" title="Live"/></a>
<a href="http://www.simpy.com/simpy/LinkAdd.do?href=${url}&amp;title=${title}" target="_blank"><img src="http://www.simpy.com/favicon.ico" alt="Simpify!" style="border-width: 0px;" title="Simpy"/></a> 
</p>

<br/>

<p>
<a href="http://www.missioneternity.org/pilots/">Discover more PILOT traces</a> - <a href="${tg.url('/')}">Upload more memory</a>
</p>

<span py:if="wasJustUploaded">
<h2>Thank you for flying etoy</h2>
<p><a href="http://www.etoy.com/">etoy.CORPORATION</a> rejects passive culture
tourists who do not share the risk and passion for radical contemporary art
(as usual: etoy wants your knowledge, soul and capital). In return for your
<a href="http://www.etoy.com/fundamentals/etoy-share/">investment</a>, MISSION
ETERNITY CONTENT enters the public domain (<a href="http://missioneternity.org/licenses/">licenses</a>) and all code is
100% open source - a fair deal and a reasonable alternative to the established
art market.</p>
<p>It is a pleasure doing business with you!</p>
</span>

</body>
</html>