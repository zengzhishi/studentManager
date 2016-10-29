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
    
    <title>My JSP 'changePassword.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <jsp:useBean id="userService" class="com.service.userService"></jsp:useBean>
  <jsp:useBean id="chPassword" class="com.model.changUserTable"></jsp:useBean>
  <jsp:setProperty property="*" name="chPassword" />
  <body>
  	<%
		userTable user = (userTable) session.getAttribute("user");
		userTable checkUser = new userTable();
		checkUser.setUsername(user.getUsername());
		checkUser.setPassword(chPassword.getOldpassword());
		out.print(chPassword.getPassword());
		String returnType = userService.valiUser(checkUser);
		if(returnType.equals("dean")){
			boolean result = userService.changePassword(user, chPassword.getPassword());
			if(result) out.print("修改成功");
			else out.print("修改失败1");
		}else{
			out.print("修改失败");
		}
	 %>
  </body>
</html>
