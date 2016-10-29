<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modifyPage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<h2>Welcom to Login in</h2><br>
  		<form action="teacherJSP/modifyOneGrade.jsp" name="login" method="POST">
  		<%
 		 	String gradeId = request.getParameter("id");
 		 	out.print(gradeId);
  			session.setAttribute("gradeId", gradeId);
  		 %>
   	 		<input type="text" name="grade" placeholder="Grade" class="form-control"></br>
	 		<input type="submit" class="btn btn-lg btn-primary btn-block" value="Sign in">
   	 	</form>
  </body>
</html>
