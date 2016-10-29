<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'deanmain_left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">

  </head>
  <jsp:include page="../islogin.jsp"></jsp:include>
  <body>
  	<img src="image/lock.jpg" class="img-circle" style="position:absolute; top:40px; left: 10px; width:100px; height:auto">
  	<a href="deanJSP/modifyPassword.jsp" target="deanJSP/deanmain_right" style="position:absolute; top:130px; left: 30px">密码修改</a>
  	  	<img src="image/label1.jpg" class="img-circle" style="position:absolute; top:170px; left: 10px; width:100px; height:auto">
  	<a href="deanJSP/modifyClass.jsp" target="deanJSP/deanmain_right" style="position:absolute; top:270px; left: 30px">课程管理</a>
  	  	<img src="image/label3.jpg" class="img-circle" style="position:absolute; top:20px; left: 130px; width:100px; height:auto">
  	<a href="deanJSP/gradeManage.jsp" target="deanJSP/deanmain_right" style="position:absolute; top:130px; left: 140px">课程成绩管理</a>
  	  	<img src="image/quit.jpg" class="img-circle" style="position:absolute; top:170px; left: 130px; width:100px; height:auto">
  	<a href="exit.jsp" target="main" style="position:absolute; top:270px; left: 160px">退出</a>
  </body>
</html>
