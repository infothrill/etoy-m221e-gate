<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?python import sitetemplate ?>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:py="http://purl.org/kid/ns#"
    py:extends="sitetemplate">
<head py:match="item.tag=='{http://www.w3.org/1999/xhtml}head'" py:attrs="item.items()">
    <meta content="text/html; charset=UTF-8" http-equiv="content-type" py:replace="''"/>
    <title py:replace="''">Your title goes here</title>
    <meta py:replace="item[:]" name="description" content="master template"/>
    <meta http-equiv="imagetoolbar" content="no" />
    <link rel="openid.server" href="http://www.missioneternity.org/admin/webinc/openid/" />
    <link type="text/css" href="http://www.missioneternity.org/themes/m221e/css/gate.css" rel="stylesheet" media="screen" />
    <link type="text/css" href="http://www.missioneternity.org/themes/m221e/css/print.css" rel="stylesheet" media="print" />
    <link rel="shortcut icon" href="http://www.missioneternity.org//themes/m221e/buttons/m221e-favicon.ico" type="image/x-icon" />
    <script type="text/javascript" src="http://www.missioneternity.org/webinc/js/m221e.js"></script>
</head>

<body py:match="item.tag=='{http://www.w3.org/1999/xhtml}body'" py:attrs="item.items()">
	<div class="rechts-logo">
		<img src="http://www.missioneternity.org/themes/m221e/images/m221e-logo2-o.gif" alt="mission eternity"/>
	</div>
    <div py:if="tg.config('identity.on') and not defined('logging_in')" id="pageLogin">
        <span py:if="tg.identity.anonymous">
            <a href="${tg.url('/login')}">Login</a>
        </span>
        <span py:if="not tg.identity.anonymous">
            Welcome ${tg.identity.user.display_name or tg.identity.user.user_name}.
            <a href="${tg.url('/logout')}">Logout</a>
        </span>
    </div>

    <div id="content">
        <div id="status_block" class="flash" py:if="value_of('tg_flash', None)" py:content="tg_flash"></div>
        <div py:replace="[item.text]+item[:]">page content</div>
    </div>
	
    <div id="footer" style="text-align:center;">
    The gate is currently in beta test phase. All uploads you perform will
    go to a temporary queue that is processed by etoy.AGENTS.
    </div>
<!--[if IE 6]>
<script type="text/javascript"> 
	/*Load jQuery if not already loaded*/ if(typeof jQuery == 'undefined'){ document.write("<script type=\"text/javascript\"   src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js\"></"+"script>"); var __noconflict = true; } 
	var IE6UPDATE_OPTIONS = {
		icons_path: "http://static.ie6update.com/hosted/ie6update/images/",
		url: "http://www.getfirefox.com/"
  	}
</script>
<script type="text/javascript" src="http://static.ie6update.com/hosted/ie6update/ie6update.js"></script>
<![endif]-->
</body>

</html>
