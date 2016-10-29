<%@page import="com.model.stuInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'deletestuinfo.jsp' starting page</title>
    
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
  <jsp:useBean id="managerSer" class="com.service.managerService"></jsp:useBean>
	<%
		List stus = managerSer.queryAllStu();
		Iterator iter = stus.iterator();
	%>
	<table class="table">
		<tr>
			<td>id</td>
			<td>姓名</td>
			<td>性别</td>
			<td>出生日期</td>
			<td>学院</td>
			<td>所在专业</td>
			<td></td>
		</tr>
		<%
			int i = 0;
			while (iter.hasNext()) {
				stuInfo student = (stuInfo) iter.next();
		%>
		<tr <%if (i % 2 == 0) {%> bgcolor="#F0F8FF" <%}%>>
			<td><%=student.getId()%></td>
			<td><%=student.getName()%></td>
			<td>
				<%
					if (student.getSex() == 1)
							out.print("男");
						else
							out.print("女");
				%>
			</td>
			<td><%=student.getDate()%></td>
			<td><%=student.getDepartment()%></td>
			<td><%=student.getSpecialty()%></td>
			<td><a href="deleteOneStu.jsp?id=<%=student.getId()%>" onclick="return confirm('确定删除吗？')">删除</a></td>
		</tr>
		<%
			i++;
			}
		%>

	</table>
  </body>
</html>
