<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%@ page import= "java.sql.*"%>
<%@ page import= "test.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>여행가방에 오신 것을 환영합니다.</title>
</head>
<body>
<% 
	request.setCharacterEncoding("euc-kr");
	String param_nick = request.getParameter("nickname");
	String param_id = request.getParameter("id");
	String param_pw = request.getParameter("password");
%>

<%
    Connection con = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
           
    ConnectionManager ctm = new ConnectionManager();
    	

    try {
    	con = ctm.getConnection();
    	
    	Class.forName("com.mysql.jdbc.Driver");
    	
        String query = "insert into members(email, name, password) values(?, ?, ?);";
    	pstmt = con.prepareStatement( query );
    	pstmt.setString(1, request.getParameter("nickname"));
    	pstmt.setString(2, request.getParameter("id"));
    	pstmt.setString(3, request.getParameter("password"));
    	pstmt.executeUpdate( );
    }
    catch(Exception e) {
    	out.println("error!<hr>");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if(stmt != null) stmt.close();
        if(con != null) con.close();
        if(pstmt != null) pstmt.close();
    }
    
    response.sendRedirect("home.jsp");
%>
</body>
</html>