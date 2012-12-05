<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String memberID = (String)session.getAttribute("id");
	boolean login = memberID == null ? false : true;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>안녕하세요 여행가방입니다.</title>

<link href="css/mainsub.css" rel="stylesheet">
<link href="css/result.css" rel="stylesheet">
<div id="logo">
        	<a href="home.jsp" id="home"><img src="img/logo.jpg" alt="여행가방"></a>
</div>
<link rel="stylesheet" type="text/css" href="http://opentutorials.org/static/css/style.css?seed=2" />

<link rel="stylesheet" type="text/css" href="http://opentutorials.org/static/css/common.css?seed=2" />
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}
</style>
</head>
<body>
<div id="wrap">
	<div class="personal">
				<% 
				if(login) {
				%>
				<div class="g_navbar">
					<b><%=memberID %>님 환영합니다.</b>|
					<a href="logout.jsp" id="logout">로그아웃</a>|
					<a href="myBag.jsp">내 가방</a>|
					<a href="list.jsp">게시판</a>
				</div>>
				<%
				}
				else {
					%>
					<a href="login.jsp" id="login">로그인</a>
					<a href="join.jsp" id="join">회원가입</a>
				<%
				}
				%>
	</div>
		 <div id="bg">
        	  <img src="img/contents_bg.jpg" alt="여행가방">
	   	   	<div id="body"> 
		   	 	<div id="main_content">   	    
	      			<div id="search">
		        		
		        		<form action="SearchResult_control.jsp?action=station" method="post" class="search_box">
	           				<select class="select_box">
		            	 	   	<option value="line1">지하철역</option>		            	        
		                	</select>            
		       				<input type="text" name="station" size="30" placeholder="구로역인 경우 '구로'만 입력" class="text">
		    	   	        <input type="submit" value=" " class="submit">
				        </form>
				        
				        
				        <form action="SearchResult_control.jsp?action=category" method="post" class="search_box">
	           				<select class="select_box">
		            	 	   	<option value="line1">테마</option>		            	        
		                	</select>            
		       				<input type="text" name="category" size="34" placeholder="ex)고궁,공원,유원지" class="text">
		    	   	        <input type="submit" value=" " class="submit">
				        </form>
			        </div>  
			    </div>  	    
	    	</div> 

    	</div> 
</div> 	   	
</body>
<jsp:include page = "share/footer.jsp" />
</html>	