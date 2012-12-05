<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR" %>
<%@ page import= "java.sql.*"%>
<%@ page import= "test.*"%>

<% request.setCharacterEncoding("euc-kr"); %>
<%


Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
String str="";

ConnectionManager ctm = new ConnectionManager();

try{
	conn =  ctm.getConnection();

	Class.forName("com.mysql.jdbc.Driver");
		
	int num = Integer.parseInt(request.getParameter("num"));
	
	String sql= "select * from bags where num=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,num);
	rs=pstmt.executeQuery();
	if(rs.next()){
		int rNum = rs.getInt("num");
		if(rNum == num){
			sql="delete from bags where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();

		}else{
			out.println("해당 이미지가 존재하지 않습니다.");
			}
	}
	

}catch(Exception e){
	e.printStackTrace();
	
}finally{

	if(rs != null) try{rs.close();}catch(SQLException sqle){}
	if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
	if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}

	response.sendRedirect("myBag.jsp");
	%>