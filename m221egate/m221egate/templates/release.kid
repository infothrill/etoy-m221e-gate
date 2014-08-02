<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:py="http://purl.org/kid/ns#"
    py:extends="'master.kid'">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" py:replace="''"/>
<title>Crossing the Deadline - MISSION ETERNITY  / gate-to-eternity</title>
</head>
<body>
<h2>BEWARE:<br/>
<tt>&quot;${name}&quot;</tt> WILL BE<br/><tt>${scrambled_name}</tt><br/>AND WILL NEVER GO AWAY AGAIN</h2>

<p>In the next step, the file <tt>&quot;${name}&quot;</tt> will be released
into the unknown, a global and vast digital infosphere. It will become part of ETERNITY.
You will loose control over this data's destiny by proceeding. Survival of the data
will depend on a couple of key factors, including, but not limited to 
<ul>
<li>availability of digital communication, the absence of nuclear wars, major meteorite impacts and lethal pandemics</li>
<li>maintenance of the ANGEL APPLICATION by etoy and its contributors</li>
<li>an active community of the living and the dead</li>
</ul>
</p>

<span py:if="ext_check">
<h2>Warning</h2>
<p>You uploaded a file that has no
<a href="http://en.wikipedia.org/wiki/Filename_extension">filename extension</a>.
Is the file of type <tt>${ext_computed}</tt>? If not, please rename the file
locally on your computer, and <a href="javascript:history.back()">upload it again</a>.
Otherwise, if you are sure the extension <tt>${ext_computed}</tt> is correct,
you may proceed with the disengagement of the file.</p></span>

<form name="release_form_letgo" method="GET" action="${tg.url('/letgo')}">
	<input type="hidden" name="id" value="${id}"/>
	<input type="hidden" name="chksm" value="${chksm}"/>
    <input type="submit" value="LET GO" class="go" />
</form>
<form name="release_form_control" method="GET" action="${tg.url('/')}">
    <input type="submit" value="MAINTAIN CONTROL" class="go" />
</form>
</body></html>