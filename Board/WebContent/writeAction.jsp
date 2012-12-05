<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR" %>
<%@ page import= "java.sql.*"%>
<%@ page import= "test.*"%>

<% request.setCharacterEncoding("euc-kr"); %>

<%
String email = (String)session.getAttribute("id");

String subject = request.getParameter("subject");
String content = request.getParameter("content");
String passwd = request.getParameter("passwd");

Connection conn=null;

PreparedStatement pstmt=null;
String str="";
ConnectionManager ctm = new ConnectionManager();

try{
	conn = ctm.getConnection();

	Class.forName("com.mysql.jdbc.Driver");
	
	String sql= "insert into board(email,subject,passwd,content,date) values(?,?,?,?,curdate())";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,email);
	pstmt.setString(2,subject);
	pstmt.setString(3,passwd);
	pstmt.setString(4,content);
	pstmt.executeUpdate();

}catch(Exception e){
	e.printStackTrace();
	
}finally{

	if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
	if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}

	response.sendRedirect("list.jsp");
	%>

	