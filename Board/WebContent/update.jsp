<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR" %>
<%@ page import= "java.sql.*"%>
<%@ page import= "test.*"%>
<!DOCTYPE html>
<head>
<title>게시판</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">

</head>

<%
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

ConnectionManager ctm = new ConnectionManager();


try{
	
	conn = ctm.getConnection();
	
	int num = Integer.parseInt(request.getParameter("num"));
	String sql="select * from board where num=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,num);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String subject= rs.getString("subject");
		String email= rs.getString("email");
		String passwd= rs.getString("passwd");
		String content= rs.getString("content");

%>

<body>
<center><b>글수정</b>
<br>
<form method="post" action="updateAction.jsp?num=<%=num%>">
<table width="400" border="1" cellspacing="0" cellpadding="0"
align="center">
<tr>
<td width="70" align="center">글제목</td>
<td align="left" width="330">
<input type="text" size="40" maxlength="50" name="subject" value="<%=subject%>">
</td>
</tr>
<tr>
<td width="70" align="center">Email</td>
<td align="left" width="330"><%=email%>
<!-- <input type="text" size="40" maxlength="30" name="email" value="">-->
</td>
</tr>
<tr>
<td width="70" align="center">글내용</td>
<td align="left" width="330">
<textarea name="content" rows="13" cols="40" ><%=content%> </textarea>
</td>
</tr>
<td width="70" align="center">비밀번호</td>
<td align="left" width="330">
<input type="password" size="8" maxlength="12" name="passwd">
</td>
</tr>
<tr>
<td colspan=2 align="center">
<input type="submit" value="글수정">
<input type="reset" value="다시작성">
<input type="button" value="목록보기"
onclick="document.location.href='list.jsp'">
</td>
</tr>
</table>
</form>
	<% }
}catch(Exception e){
	//e.printStackTrace();
	out.println(e);
}finally{
	ctm.close(rs, pstmt, conn);
}
%>
</body>
<jsp:include page = "share/footer.jsp" />
</html>