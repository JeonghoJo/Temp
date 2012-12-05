<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "java.sql.*"%>
<%@ page import= "test.*"%>
<%
int num = Integer.parseInt(request.getParameter("num"));
%>
<!DOCTYPE html>
<head>
<title>내 가방</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">

</head>
<body>
<center><b>이미지 삭제</b>
<br>
<form method="POST" name="delForm" action="myBagdeleteAction.jsp?num=<%=num%>" >
<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
<tr height="30">
<td align="center">
<b>정말로 삭제하시겠습니까?</b></td>
</tr>
<tr height="30">
<td align="center">
<input type="submit" value="이미지 삭제">
<input type="button" value="내 가방" 
onclick="document.location.href='myBag.jsp'">
</td>
</tr>
</table>
</form>
</body>
<jsp:include page = "share/footer.jsp" />
</html>