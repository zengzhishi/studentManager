<%@page import="com.model.teaInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'deleteteainfo.jsp' starting page</title>
    
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
		List teas = managerSer.queryAllTea();
		Iterator iter = teas.iterator();
	%>
	<table class="table">
		<tr>
			<td>id</td>
			<td>姓名</td>
			<td>学院</td>
			<td></td>
		</tr>
		<%
			int i = 0;
			while (iter.hasNext()) {
				teaInfo teacher = (teaInfo) iter.next();
		%>
		<tr <%if (i % 2 == 0) {%> bgcolor="#F0F8FF" <%}%>>
			<td><%=teacher.getId()%></td>
			<td><%=teacher.getName()%></td>
			<td><%=teacher.getDepartment()%></td>
			<td><a href="deleteOneTea.jsp?id=<%=teacher.getId()%>" onclick="return confirm('确定删除吗？')">删除</a></td>
		</tr>
		<%
			i++;
			}
		%>

	</table>
  </body>
</html>
