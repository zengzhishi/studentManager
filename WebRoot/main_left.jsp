<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main_left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">


  </head>
  <jsp:include page="islogin.jsp"></jsp:include>
  <body>
  <img src="image/stu.jpg" class="img-circle" style="position:absolute; top:2px; left: 6px; width:100px; height:auto">
  	<a href="inputstuinfo.jsp" target="main_right" style="position:absolute; top:100px; left: 6px; width:100px; height:auto">录入与修改</a>
  	<a href="deletestuinfo.jsp" target="main_right" style="position:absolute; top:120px; left: 6px; width:100px; height:auto">查看与删除</a>
  	<img src="image/tea.jpg" class="img-circle" style="position:absolute; top:2px; left: 130px; width:100px; height:auto">
  	<a href="inputteainfo.jsp" target="main_right" style="position:absolute; top:100px; left: 130px; width:100px; height:auto">信息录入与修改</a>
  	<a href="deleteteainfo.jsp" target="main_right" style="position:absolute; top:120px; left: 130px; width:100px; height:auto">信息查看与删除</a>
  	<img src="image/label1.jpg" class="img-circle" style="position:absolute; top:150px; left: 6px; width:100px; height:auto">
  	<a href="inputclassinfo.jsp" target="main_right" style="position:absolute; top:240px; left: 6px; width:100px; height:auto">录入与修改</a>
  	<a href="deleteclassinfo.jsp" target="main_right" style="position:absolute; top:260px; left: 6px; width:100px; height:auto">查看与删除</a>
  	<img src="image/mana.jpg" class="img-circle" style="position:absolute; top:150px; left: 130px; width:100px; height:auto">
  	<a href="inputdeaninfo.jsp" target="main_right" style="position:absolute; top:240px; left: 130px; width:100px; height:auto">信息录入与修改</a>
  	<a href="deletedeaninfo.jsp" target="main_right" style="position:absolute; top:260px; left: 130px; width:100px; height:auto">信息查看与删除</a>
  	<img src="image/label3.jpg" class="img-circle" style="position:absolute; top:300px; left: 6px; width:100px; height:auto">
  	<a href="inputgradeinfo.jsp" target="main_right" style="position:absolute; top:400px; left: 6px; width:100px; height:auto">学生成绩录入与修改</a>
  	<img src="image/quit.jpg" class="img-circle" style="position:absolute; top:300px; left: 130px; width:100px; height:auto">
  	<a href="exit.jsp" target="main" style="position:absolute; top:410px; left: 130px; width:100px; height:auto">退出</a>
  	
  	
  </body>
</html>
