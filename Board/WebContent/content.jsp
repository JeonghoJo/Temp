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
String memberID = (String)session.getAttribute("id");

Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

ConnectionManager ctm = new ConnectionManager();

try{
	conn =  ctm.getConnection();

	Class.forName("com.mysql.jdbc.Driver");
	
int num = Integer.parseInt(request.getParameter("num"));
String sql="select * from board where num=?";
pstmt=conn.prepareStatement(sql);
pstmt.setInt(1,num);
rs=pstmt.executeQuery();
	while(rs.next()){
		//int num = rs.getInt("num");
		String subject= rs.getString("subject");
		String email= rs.getString("email");
		String passwd= rs.getString("passwd");
		String content= rs.getString("content");
		String date = rs.getString("date");

%>

<body>
<center><b>글내용 보기</b><br>
<form>
<table width="500" border="1" cellspacing="0" cellpadding="0">
<tr height="30">
<td align="center" width="125">글번호</td>
<td align="center" width="125">
<%=num%></td>
<td align="center" width="125">작성날짜</td>
<td align="center" width="125"><%=date%></td>
</tr>
<tr height="30">
<td align="center" width="125">글제목</td>
<td align="center" width="375" align="center" colspan="3">
<%=subject%></td>
</tr>
<tr>
<td align="center" width="125">글내용</td>
<td align="left" width="375" colspan="3"><pre><%=content%>
</pre></td>
</tr>
<tr height="30">
<td colspan="4" align="right">
<%
if(memberID.equals(email)) {
%>
<input type="button" value="글수정" onclick="document.location.href='update.jsp?num=<%=num%>'">
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="글삭제" onclick="document.location.href='deleteForm.jsp?num=<%=num%>'">
&nbsp;&nbsp;&nbsp;&nbsp;
<%
} 
%>
<input type="button" value="글목록"
onclick="document.location.href='list.jsp'">
</td>
</tr>
</table>
<% }
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(rs != null)try{rs.close();}catch(SQLException sqle){}
	if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
	if(conn != null)try{conn.close();}catch(SQLException sqle){}
}
%>
</form>
</body>
<jsp:include page = "share/footer.jsp" />
</html>