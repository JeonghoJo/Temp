<%@ page language= "java" contentType="text/html; charset=EUC-KR"
pageEncoding= "EUC-KR"%>
<!DOCTYPE html>
<head>
<title>게시판</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">

<script language="Javascript">
function chk(){
	if(document.writeform.subject.value==""){
	  alert("제목을 입력하십시요.");
	  document.writeform.subject.focus();
	  return false;
	}
	
	if(document.writeform.content.value==""){
	  alert("내용을 입력하십시요.");
	  document.writeform.content.focus();
	  return false;
	}
        
	if(document.writeform.passwd.value==""){
	  alert(" 비밀번호를 입력하십시요.");
	  document.writeform.passwd.focus();
	  return false;
	}
 }    
</script>
</head>

<body>
<center><b>글쓰기</b><br>
<form method= "post" name="writeform" action="writeAction.jsp" onsubmit="return chk()">
<table width="400" cellspacing="0" cellpadding="0" align="center" border="1">
<tr>
<td align="right" colspan="2">
</td>
</tr>
<tr>
<td width="70" align="center">제목</td>
<td width="330">
<input type="text" size="40" maxlength="50" name="subject"></td>
</tr>
<tr>
<td width="70" align="center">내용</td>
<td width="330">
<textarea name="content" rows="13" cols="40"></textarea></td>
</tr>
<tr>
<td width="70" align="center">비밀번호</td>
<td width="330">
<input type="password" size="8" maxlength="12" name="passwd"></td>
</tr>
<tr>
<td colspan= 2 align="center">
<input type="submit" value="글쓰기">
<input type="reset" value="다시작성">
<input type="button" value="목록보기" OnClick="window.location='list.jsp'">
</td></tr></table>
</form>
</body>
<jsp:include page = "share/footer.jsp" />
</html>