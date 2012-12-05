<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">

<title>회원가입</title>

<link rel="stylesheet" type="text/css"
	href="http://opentutorials.org/static/css/style.css?seed=3" />

<link rel="stylesheet" type="text/css"
	href="http://opentutorials.org/static/css/common.css?seed=3" />
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
	if(document.join.nickname.value == "") {
		alert("Nickname value is empty.");
		document.join.nickname.focus();
		return false;
	}
	if(document.join.id.value == "") {	
		alert("ID value is empty.");
		document.join.id.focus();
		return false;
	}
	if(document.join.password.value == "") {
		alert("Password value is empty.");
		document.join.password.focus();
		return false;
	}
	if(document.join.password2.value == "") {
		alert("Password value is empty.");
		document.join.password2.focus();
		return false;
	}
	if(document.join.password.value != document.join.password2.value) {
		alert("Password value and Password value 2 is not equal.");
		document.join.password.focus();
		return false;
	}
	return true;
}
</script>
</head>

<body id="auth_register" class="auth">
	<div class="wrap">
		<div id="nest">
			<div class="logo">
			  회원가입
			</div>
			<div class="feedback"></div>
			<p>
			<form name="join" method="post" onsubmit="return Check();" action="confirmjoin.jsp" accept-charset="utf-8">
				<p>
					<label for="login_id">E-mail</label> <input type="text" id="nickname" name="nickname" value="" />
				</p>
				<p>
					<label for="email">이름</label> <input type="text" id="id" name="id" value="" />
				</p>
				<p>
					<label for="password">비밀번호</label> <input type="password" id="password" name="password" value="" />
				</p>
				<p>
					<label for="password2">비밀번호 확인</label> <input type="password" id="password2" name="password2" value="" />
				</p>
				<p class="submit_nest">
					<input class="button" type="submit" value="회원가입" />
				</P>
				</form>
		</div>
	</div>
</body>
</html>	
			