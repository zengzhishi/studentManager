<%@page import="com.model.userTable"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'validate.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<jsp:useBean id="user" class="com.model.userTable"></jsp:useBean>
<jsp:useBean id="userService" class="com.service.userService"></jsp:useBean>
<jsp:setProperty property="*" name="user" />
<body>
	<%
		String returnType = userService.valiUser(user);
		user.setType(returnType);//修改为完整的
		if (returnType.equals("manager")) {
			session.setAttribute("user", user);
	%>
	<jsp:forward page="main.jsp"></jsp:forward>
	<%
		} else if (returnType.equals("student")) {
			session.setAttribute("user", user); 
    %>  
        <jsp:forward page="studentJSP/studentMain.jsp"/>  
	<%
		} else if (returnType.equals("teacher")) {
		session.setAttribute("user", user); 
    %>  
        <jsp:forward page="teacherJSP/teacherMain.jsp"/>  
	<%
		} else if (returnType.equals("dean")) {
		session.setAttribute("user", user);
		%>
		<jsp:forward page="deanJSP/deanMain.jsp"></jsp:forward>
		<% 
		} else {
	%>
	<jsp:forward page="index.jsp"></jsp:forward>
	<%
		}
	%>
</body>
</html>
