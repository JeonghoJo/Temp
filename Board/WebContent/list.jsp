<%@ page language="java" contentType="text/html; charset= EUC-KR" 
pageEncoding="EUC-KR" %>
<%@ page import= "java.sql.*"%>
<%@ page import= "java.util.*" %>
<%@ page import= "test.*"%>
<%@ page import= "java.text.SimpleDateFormat"%>

<%
String memberID = (String)session.getAttribute("id");
boolean login = memberID == null ? false : true;
%>

<!DOCTYPE html>
<head>
	<title>게시판</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/base.css" rel="stylesheet">
	<div id="logo">
		<a href="home.jsp">
        <img src="img/logo.jpg" alt="여행가방">
        </a>
  	</div>
  	<%
  	if(login){
  	%>
	<div id="sign_out">
	        <a href="logout.jsp" id="logout">로그아웃</a>  |   
    	    <a href="myBag.jsp">내 가방</a>		 
	</div>
</head>
<body>
	
	<center>
		<h2>여행가방 게시판</h2>
	</center>
	<table width="800">
	<tr>
	<td align="right">
	<a href="writeForm.jsp">글쓰기</a>
	</td>
	</table>
	<table border="1" width="600" cellpadding="0" cellspacing="0" align="center">

		<tr height="30" >
		<td align="center" width="50">번 호</td>
		<td align="center" width="250">제 목</td>
		<td align="center" width="200">작성자</td>	
		<td align="center" width="100">작성날짜</td>
		</tr>
<%
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

ConnectionManager ctm = new ConnectionManager();

//페이지 설정
	int pageNo = 1;
	
	try {
		pageNo = Integer.parseInt(request.getParameter("page"));
	} catch (NumberFormatException ex) {}
	
	int numInPage = 10;							// 한페이지에 출력할 아이템 개수
	int startPos = (pageNo - 1) * numInPage; 	// 몇 번째 아이템 부터 이 페이지에?
	int numItems, numPages;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm:ss");

try{

	conn =  ctm.getConnection();
	
	String sql = "SELECT COUNT(*) FROM board";
	// users 테이블: user 수 페이지수 개산
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	rs.next();
	numItems = rs.getInt(1);
	numPages = (int) Math.ceil((double)numItems / (double)numInPage);
		
	sql="select * from board order by num desc limit " + startPos + "," + numInPage;
	
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		int num = rs.getInt("num");
		String subject= rs.getString("subject");
		String email= rs.getString("email");
		String date= rs.getString("date");
		date = date.substring(0,10); //10개씩 끊어오기 날짜.
		%>

		<tr>
		<td align="center" width="30"><%=num%></td>
		<td align="center" width="250"><a href="content.jsp?num=<%=num%>"><%=subject%></a></td>
		<td align="center" width="200"><%=email%></td>
		<td align="center" width="100"><%=date%></td>
		</tr>
<% }
	%>
	</table>
	<div class="pagination pagination-centered">
      <ul>
      	<%
      	// 페이지 네비게이션을 위한 준비
      	int startPageNo, endPageNo;
      	int delta = 5;
      	startPageNo = (pageNo <= delta) ? 1: pageNo - delta;
      	endPageNo = startPageNo + (delta * 2) + 1;
      	
      	if (endPageNo > numPages) {
      		endPageNo = numPages;
      	}
      	
      	// 이전 페이지로
      	if (pageNo <= 1) { 
      	%>
        	<li class="disabled"><a href="#">&laquo;</a></li>
        <% 
      	} else {
        %>
        	<li><a href="list.jsp?page=<%= pageNo - 1%>">&laquo;</a></li>
        <%
        } 
      	
      	// 페이지 목록 출력 (현재-delta ~ 현재+delta까지)
        String className = "";
        for(int i = startPageNo; i <= endPageNo; i++) {
        	className = (i == pageNo) ? "active" : "";
        	out.println("<li class='" + className + "'>");
        	out.println("<a href='list.jsp?page=" + i + "'>" + i + "</a>");
        	out.println("</li>");
        }
        
        // 다음 페이지로
      	if (pageNo >= numPages) { 
      	%>
        	<li class="disabled"><a href="#">&raquo;</a></li>
        <% 
      	} else {
        %>
        	<li><a href="list.jsp?page=<%= pageNo + 1%>">&raquo;</a></li>
        <%
        } 
        %>
     </ul>
    </div> 
	<%
}catch(Exception e){
	//e.printStackTrace();

	out.println(e);
}finally{

	ctm.close( rs,pstmt,conn);
	
}
  	}
  	else{
%>			<div id="sign_out">
					<a href="login.jsp" id="login">로그인</a>|
					<a href="join.jsp" id="join">회원가입</a>
			</div>
<%} %>
</body>
<jsp:include page = "share/footer.jsp" />
</html>