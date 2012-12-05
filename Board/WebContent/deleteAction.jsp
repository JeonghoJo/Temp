<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR" %>
<%@ page import= "java.sql.*"%>
<%@ page import= "test.*"%>

<% request.setCharacterEncoding("euc-kr"); %>
<%

String passwd = request.getParameter("passwd");
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
String str="";

ConnectionManager ctm = new ConnectionManager();

try{
	conn =  ctm.getConnection();

	Class.forName("com.mysql.jdbc.Driver");
		
	int num = Integer.parseInt(request.getParameter("num"));
	String sql= "select passwd from board where num=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,num);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String rPasswd=rs.getString("passwd");
		if(passwd.equals(rPasswd)){
			sql="delete from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();

		}else{
			out.println("비밀번호가 틀렸습니다.");
			}
	}
	

}catch(Exception e){
	e.printStackTrace();
	
}finally{

	if(rs != null) try{rs.close();}catch(SQLException sqle){}
	if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
	if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}

	response.sendRedirect("list.jsp");
	%>


