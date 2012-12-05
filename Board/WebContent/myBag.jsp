<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import= "java.sql.*"%>
<%@ page import= "java.util.*" %>
<%@ page import= "test.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<head>

<meta charset="UTF-8">
<title>내 가방</title>
<link href="css/main.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">
	<div id="logo">
		<a href="home.jsp">	
    	    <img src="img/logo.jpg" alt="여행가방">
    	</a>
	</div>
	<div id="sign_out">
	        <a href="logout.jsp" id="logout">로그아웃</a>  |   
    	    <a href="#">내 가방</a>		 |
    	    <a href="list.jsp">게시판</a>
	</div>
</head>
<body>
	<center>
		<h1>내 가방</h1>
	</center>
	<div id="bag_content">
		<ul>
			<div id="bag_img">
<%
String memberID = (String)session.getAttribute("id");

Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

ConnectionManager ctm = new ConnectionManager();

try{
	conn =  ctm.getConnection();
	
	String sql = "select * from bags order by num ";
	
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();

	while(rs.next()){
		String bagemail = rs.getString("email");
		if(memberID.equals(bagemail)){
		int num = rs.getInt("num");
		String img_id= rs.getString("img_id");
		String img_name= rs.getString("img_name");
%>
				<li>
					<img src="<%=(img_id.indexOf("javascript") > -1 ? "": img_id ) %>" alt="여행지 이미지" width="200px" height="200px">
					<p><b><a href="SearchResultbag.jsp?img_name=<%=img_name%>"><%=img_name%></a></b></p>
					<div id="bag_delete">
						<br/><input type="button" value="이미지삭제" onclick="document.location.href='myBagdeleteForm.jsp?num=<%=num%>'">
					</div>
				</li>	
<% 	}
	} 
}catch(Exception e){
	//e.printStackTrace();
	out.println(e);
}finally{
	ctm.close( rs,pstmt,conn);
}
%>
			</div>
		</ul>
	</div>
</body>
<jsp:include page = "share/footer.jsp" />
</html>