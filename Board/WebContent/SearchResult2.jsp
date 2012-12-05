<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="wp.resultboard.*" import="java.util.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
ResultBean rb = new ResultBean();
ArrayList<Result> datas = rb.getLocationList((String)request.getAttribute("location"));

%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
	for(Result result : datas)
	{
%>
<table border="1">
  <tr >
    <td rowspan="4"><%=result.getPicture() %></td>
    <td><%=result.getDestination() %></td>
  </tr>
  <tr>
    <td>장소 : <%=result.getDestination()%>역 | 소요시간 : <%=result.getDistance() %>분 | 테마 | <%=result.getCategory() %></td>
  </tr>
  <tr>
    <td><%=result.getDiscription() %></td>
  </tr>
  <tr>
    <td><a href="<%=result.getHomepage()%>">관련 사이트로 이동</a></td>
  </tr>
</table>
<%
	}
%>
</body>
</html>