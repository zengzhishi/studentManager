<%@page import="com.model.classInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'deleteclassinfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">


  </head>
  
  <body>
  <jsp:useBean id="managerSer" class="com.service.managerService"></jsp:useBean>
	<%
		List classes = managerSer.queryAllclass();
		Iterator iter = classes.iterator();
	%>
	<table class="table">
		<tr>
			<td>id</td>
			<td>课程名</td>
			<td>学分</td>
			<td>课时</td>
			<td></td>
		</tr>
		<%
			int i = 0;
			while (iter.hasNext()) {
				classInfo cla = (classInfo) iter.next();
		%>
		<tr <%if (i % 2 == 0) {%> bgcolor="#F0F8FF" <%}%>>
			<td><%=cla.getId()%></td>
			<td><%=cla.getName()%></td>
			<td><%=cla.getWeight()%></td>
			<td><%=cla.getTime()%></td>
			<td><a href="deleteOnecla.jsp?id=<%=cla.getId()%>" onclick="return confirm('确定删除吗？')">删除</a></td>
		</tr>
		<%
			i++;
			}
		%>

	</table>
  </body>
</html>
