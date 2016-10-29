<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modifyPassword.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">

  </head>
  
  <body>
  
	
	<form action="deanJSP/changePassword.jsp" name="login" method="POST" style="position:absolute;left:400px;top:120px;width:250px;height:auto">
		<h2>修改密码</h2>
		<input type="password" name="oldpassword" placeholder="Old Password" class="form-control">
		<input type="password" name="password" placeholder="Password" class="form-control">
		<input type="submit" class="btn btn-lg btn-primary btn-block" value="确定">
	</form>
  </body>
</html>
