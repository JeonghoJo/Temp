<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="wp.resultboard.*" import="java.util.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "sb" class="wp.resultboard.ResultBean"/>
<jsp:useBean id = "search" class="wp.resultboard.Result"/>
<jsp:setProperty name="search" property="*"/>

<%
	String action = request.getParameter("action");
	if(action.equals("list"))
	{
		response.sendRedirect("SearchResult.jsp");
	}
	else if(action.equals("station"))
	{
		String location = (String)request.getParameter("station");
		request.setAttribute("location",location);
		System.out.println(location);
		pageContext.forward("SearchResult2.jsp");
		
	}
	else if(action.equals("category"))
	{
		String theme = (String)request.getParameter("category");
		request.setAttribute("theme",theme);
		
		pageContext.forward("SearchResult.jsp");
	}
	else
	{
		out.println("<script>alert('action 파라미터를 확인!')</script>");
	}
	

%>