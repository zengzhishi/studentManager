<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modifyClass.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	
	

  </head>
  
  <body style="position:absolute;left:400px;top:120px;width:250px;height:auto">
  	<a href="inputclassinfo.jsp" target="deanJSP/deanmain_right"><input type="button" class="btn btn-lg btn-primary btn-block" value="添加修改课程"/></a>
  	<a href="deleteclassinfo.jsp" target="deanJSP/deanmain_right"><input type="button" class="btn btn-lg btn-primary btn-block" value="删除课程"/></a>
  </body>
</html>
