<%@ page language= "java" contentType="text/html; charset=EUC-KR"
pageEncoding= "EUC-KR"%>
<!DOCTYPE html>
<head>
<title>�Խ���</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">

<script language="Javascript">
function chk(){
	if(document.writeform.subject.value==""){
	  alert("������ �Է��Ͻʽÿ�.");
	  document.writeform.subject.focus();
	  return false;
	}
	
	if(document.writeform.content.value==""){
	  alert("������ �Է��Ͻʽÿ�.");
	  document.writeform.content.focus();
	  return false;
	}
        
	if(document.writeform.passwd.value==""){
	  alert(" ��й�ȣ�� �Է��Ͻʽÿ�.");
	  document.writeform.passwd.focus();
	  return false;
	}
 }    
</script>
</head>

<body>
<center><b>�۾���</b><br>
<form method= "post" name="writeform" action="writeAction.jsp" onsubmit="return chk()">
<table width="400" cellspacing="0" cellpadding="0" align="center" border="1">
<tr>
<td align="right" colspan="2">
</td>
</tr>
<tr>
<td width="70" align="center">����</td>
<td width="330">
<input type="text" size="40" maxlength="50" name="subject"></td>
</tr>
<tr>
<td width="70" align="center">����</td>
<td width="330">
<textarea name="content" rows="13" cols="40"></textarea></td>
</tr>
<tr>
<td width="70" align="center">��й�ȣ</td>
<td width="330">
<input type="password" size="8" maxlength="12" name="passwd"></td>
</tr>
<tr>
<td colspan= 2 align="center">
<input type="submit" value="�۾���">
<input type="reset" value="�ٽ��ۼ�">
<input type="button" value="��Ϻ���" OnClick="window.location='list.jsp'">
</td></tr></table>
</form>
</body>
<jsp:include page = "share/footer.jsp" />
</html>