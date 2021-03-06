<%@page import="com.model.stuInfo"%>
<%@page import="com.model.teaInfo"%>
<%@page import="com.model.classInfo"%>
<%@page import="com.model.stuGradeInfo"%>
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
    
    <title>My JSP 'modifyClassGrade.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">

  </head>
  
  
  <body>
  <jsp:useBean id="studentSer" class="com.service.stuInfoService"></jsp:useBean>
  <jsp:useBean id="teacherSer" class="com.service.teacherService"></jsp:useBean>
	<%
		userTable user = (userTable) session.getAttribute("user");
		List grades = teacherSer.showGrade(user.getUsername());
		Iterator iter = grades.iterator();
	%>
	<table class="table">
		<tr>
			<td>成绩单号</td>
			<td>课程单号</td>
			<td>课程名称</td>
			<td>学分</td>
			<td>课时</td>
			<td>学生id</td>
			<td>学生姓名</td>
			<td>成绩</td>
			<td></td>
		</tr>
		<%
			int i = 0;
			while (iter.hasNext()) {
				stuGradeInfo g = (stuGradeInfo) iter.next();
				classInfo c = teacherSer.getClassInfo(g.getClassid());
				stuInfo s = teacherSer.getStuInfo(g.getStudentid());
		%>
		<tr <%if (i % 2 == 0) {%> bgcolor="#F0F8FF" <%}%>>
			<td><%=g.getId()%></td>
			<td><%=c.getId()%></td>
			<td><%=c.getName()%></td>
			<td><%=c.getWeight()%></td>
			<td><%=c.getTime()%></td>
			<td><%=s.getId()%></td>
			<td><%=s.getName()%></td>
			<td><%=g.getGrade()%></td>
			<td><a href="teacherJSP/modifyPage.jsp?id=<%=g.getId()%>">修改成绩</a></td>
		</tr>
		<%
			i++;
			}
		%>

	</table>
  </body>
</html>
