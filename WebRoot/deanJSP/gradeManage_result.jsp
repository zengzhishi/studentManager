<%@page import="com.model.checkClass"%>
<%@page import="com.model.stuGradeInfo"%>
<%@page import="com.model.classInfo"%>
<%@page import="com.model.teaInfo"%>
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
    
    <title>My JSP 'gradeManage_result.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">

  </head>
  
  <body>
    <jsp:useBean id="deanSer" class="com.service.deanService"></jsp:useBean>
    <jsp:useBean id="classId" class="com.model.checkClass"></jsp:useBean>
    <div class="main">
  		<h2>成绩管理</h2>
  		<form action="deanJSP/gradeManage_result.jsp" name="login" method="POST" style="position:absolute;left:0px;top:50px;width:250px">
   	 		<input type="text" name="classId" placeholder="课程" class="form-control">
	 		<input type="submit" class="btn btn-lg btn-primary btn-block" value="查询" style="position:absolute;left:250px;top:0px;width:70px;height:35px">
   	 	</form>
  	</div>
    
	<%
	List grades = null;
	Iterator iter = null;
	%>
		<jsp:setProperty property="*" name="classId"/>
	<%
	if(classId != null){
		grades = deanSer.sortGradesByOrder(classId.getClassId(), stuGradeInfo.DESC);
		iter = grades.iterator();	
	
	%>
	<table class="table">
		<tr>
			<td>成绩单号</td>
			<td>课程编号</td>
			<td>课程名称</td>
			<td>任课老师id</td>
			<td>任课老师名称</td>
			<td>学生id</td>
			<td>学生名称</td>
			<td>成绩</td>
			<td></td>
			<td></td>
		</tr>
		<%
			int i = 0;
			while (iter.hasNext()) {
				stuGradeInfo grade = (stuGradeInfo) iter.next();
				stuInfo student = deanSer.getStuInfo(grade.getStudentid());
				teaInfo teacher = deanSer.getTeaInfo(grade.getTeacherid());
				classInfo cla = deanSer.getclassInfo(grade.getClassid());
		%>
		<tr <%if (i % 2 == 0) {%> bgcolor="#F0F8FF" <%}%>>
			<td><%=grade.getId()%></td>
			<td><%=cla.getId()%></td>
			<td><%=cla.getName()%></td>
			<td><%=teacher.getId()%></td>
			<td><%=teacher.getName()%></td>
			<td><%=student.getId()%></td>
			<td><%=student.getName()%></td>
			<td><%=grade.getGrade()%></td>
			<td><a href="deanJSP/deleteOneGrade.jsp?id=<%=grade.getId()%>" onclick="return confirm('确定删除吗？')">删除</a></td>
			<td><a href="teacherJSP/modifyPage.jsp?id=<%=grade.getId()%>" >修改</a></td>
		</tr>
		<%
			i++;
			}
			double average = deanSer.getAverage(grades);
			out.print("平均成绩"+new java.text.DecimalFormat("#.00").format(average));
		}else{
		%>
		<jsp:forward page="deanJSP/gradeManage.jsp"></jsp:forward>
		<%
		}
		 %>

	</table>
  </body>
</html>
