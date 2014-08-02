<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:py="http://purl.org/kid/ns#"
    py:extends="'master.kid'">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" py:replace="''"/>
<title>Crossing the Deadline - MISSION ETERNITY  / gate-to-eternity</title>
</head>
<body>
<h1>choose a memory trace for ARCANUM CAPSULE of</h1>
<h1><tt>BEING ${id}</tt></h1>
<p>Any data you chose will be preserved for eternity inside the
<a href="http://missioneternity.org/arcanum-capsule/">ARCANUM CAPSULE</a>
of the chosen <a href="http://missioneternity.org/pilots/">PILOT</a>, in this case
the BEING identfied by the ARCANUM CAPSULE ID <tt>${id}</tt>.
<br/>
Tips before choosing a file:
<ul>
<li><a href="http://www.google.com/search?q=${id}">Search the net</a> for data related to this BEING</li>
<li>Choose a file that SHARES MEANING via an emotional link between you, the trace and the BEING</li>
<li>check copyrights: for any copyrighted material, etoy will have to disable access for the negligible period of a few decades before expiry of that right. Eternity wins anyway, so go ahead and upload!</li>
</ul>
</p>
<p>Choose a file from your personal computer:</p>
<form action="${tg.url('/upload')}" method="POST" enctype="multipart/form-data">
    <input type="hidden" name="id" py:attrs="value=id"/>
    <input type="file" name="upload_file" id="upload_file"/><br/><br/><br/>
    <input type="submit" name="submit_upload" value="Upload..."/>
</form>
<br/><br/><br/>
</body>
</html>