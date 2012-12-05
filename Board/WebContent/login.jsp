<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">

<title>로그인</title>

<link rel="stylesheet" type="text/css" href="http://opentutorials.org/static/css/style.css?seed=3" />

<link rel="stylesheet" type="text/css" href="http://opentutorials.org/static/css/common.css?seed=3" />
<link href="css/base.css" rel="stylesheet">
<link href="css/mainsub.css" rel="stylesheet">
	<div id="logo">
        	<a href="home.jsp" id="home"><img src="img/logo.jpg" alt="여행가방"></a>
	</div>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}
</style>

<script type="text/javascript">
function Check()
{
	if(document.login.id.value == "") {	
		alert("ID value is empty.");
		document.login.id.focus();
		return false;
	}
	if(document.login.password.value == "") {
		alert("Password value is empty.");
		document.login.password.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body id="auth_login" class="auth">
	<div class="wrap">
		<div id="nest">
			<div class="feedback"></div>
			<form name="login" method="post" onsubmit="return Check();" action="confirmlogin.jsp" accept-charset="utf-8">
				<p>
					<label for="email">E-mail</label><input type="text" id="id" name="id" value="" />
				</p>
				<p>
					<label for="password">Password</label><input type="password" id="password" name="password" value="" />
				</p>
				<p class="submit_nest">
					<input class="button" type="submit" value="로그인" />
				</P>
			</form>
		</div>
	</div>
</body>
</html>
