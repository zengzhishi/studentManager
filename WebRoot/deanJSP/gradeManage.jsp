<%@page import="com.model.classInfo"%>
<%@page import="com.model.teaInfo"%>
<%@page import="com.model.stuInfo"%>
<%@page import="com.model.stuGradeInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'gradeManage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">

  </head>
  
  <body>
  	<div class="main">
  		<h2>成绩管理</h2>
  		<form action="deanJSP/gradeManage_result.jsp" name="login" method="POST">
   	 		<input type="text" name="classId" placeholder="课程id" class="form-control" style="position:absolute;left:0px;top:50px;width:250px;height:auto">
	 		<input type="submit" class="btn btn-lg btn-primary btn-block" value="查询" style="position:absolute;left:250px;top:50px;width:70px;height:35px">
   	 	</form>
  	</div>
  	
  </body>
</html>
