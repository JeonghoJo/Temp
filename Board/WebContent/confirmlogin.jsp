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
	String param_id = request.getParameter("id");
	String param_pw = request.getParameter("password");
%>

<%
    Connection con = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    ConnectionManager ctm = new ConnectionManager();

    try {
        
        con = ctm.getConnection();
        
        Class.forName("com.mysql.jdbc.Driver");
        String query = "select * from members where email='"+param_id+"' and password='"+param_pw+"';";
        String id, pw;
    	stmt = con.createStatement();
    	rs = stmt.executeQuery(query);
    	if(rs.next())
    	{
    		session.setAttribute("id", param_id);
    		response.sendRedirect("home.jsp");
    	}
    	else
    	{
    		response.sendRedirect("login.jsp");
    	}
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
        if(rs != null) rs.close();
    }
%>
</body>
</html>