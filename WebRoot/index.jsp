<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
  </head>
  
  <body>
  	<img src="image/logo.png">
  	<div>
  		<img src="image/thumb (1).jpg" class="LoginImg" style="position:absolute; left:300px; top:200px">
  		<img src="image/thumb (2).jpg" class="LoginImg" style="position:absolute; left:430px; top:200px">
  		<img src="image/thumb.jpg" class="LoginImg" style="position:absolute; left:300px; top:330px">
  		<img src="image/u=971154089,3960288404&fm=23&gp=0.jpg" class="LoginImg" style="position:absolute; left:430px; top:330px">
  	</div>
  	<div class="main">
  		 <h2>Welcom to Login in</h2><br>
  		<form action="validate.jsp" name="login" method="POST">
   	 		<input type="text" name="username" placeholder="Username" class="form-control"></br>
   	 		<input type="password" name="password" placeholder="Password" class="form-control"></br>
	 		<input type="submit" class="btn btn-lg btn-primary btn-block" value="Sign in">
   	 	</form>
  	</div>
   	
   	
  </body>
</html>
