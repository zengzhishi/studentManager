<%@page import="com.model.stuGradeInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'inputgradeinfo_result.jsp' starting page</title>
    
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
    <%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="stuGradeInfo" class="com.model.stuGradeInfo"></jsp:useBean>
	<jsp:useBean id="managerServer" class="com.service.managerService"></jsp:useBean>
	<jsp:setProperty property="*" name="stuGradeInfo" />
	<%
		String checkmassage = managerServer.checkExist(stuGradeInfo);
		if(checkmassage.equals("can")){
			if(managerServer.modifyGrade(stuGradeInfo))
				out.print("Modify success!");
			else
				out.print("Modify fail!");		
		}else{
			out.print(checkmassage);
		}
	%>
  </body>
</html>
