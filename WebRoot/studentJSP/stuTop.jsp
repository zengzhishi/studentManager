<%@page import="com.model.userTable"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'stuTop.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
	

  </head>
  
  <body>
  	<img src="image/logo.png" style="position:absolute;left:0px">
  	<ul class="nav nav-pills detail" style="position:absolute;top:60px;right:0px">
  		
      <%userTable user = (userTable) session.getAttribute("user"); %>
      <li class="active"><a href="#">Welcome（<%=user.getUsername() %>）</a></li>
      <li class="active"><a href="#">学生</a></li>
    </ul>
  </body>
</html>
