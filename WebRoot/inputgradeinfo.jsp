<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'inputgradeinfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">

  </head>
  <center>
  		<form action="inputgradeinfo_result.jsp" method="post">
  			<table>
  				<tr>
  					<tr>
					<td align="center" colspan=2>学生成绩录入</td>
				</tr>
				<tr>
					<td>成绩单号：</td>
					<td><input type="text" size=13 name="id" class="form-control"></td>
				</tr>
				<tr>
					<td>课程编号：</td>
					<td><input type="text" size=13 name="classid" class="form-control"></td>
				</tr>
				<tr>
					<td>老师编号：</td>
					<td><input type="text" size=13 name="teacherid" class="form-control"></td>
				</tr>
				<tr>
					<td>学生编号：</td>
					<td><input type="text" size=13 name="studentid" class="form-control"></td>
				</tr>
				<tr>
					<td>成绩：</td>
					<td><input type="text" size=13 name="grade" class="form-control"></td>
				</tr>
				<tr ><td align="center" colspan="2" ><input type="submit"  value="提交" class="btn btn-lg btn-primary">&nbsp;&nbsp; <input
				type="reset"  value="重置" class="btn btn-lg btn-primary"></td></tr>	
  			</table>
  		</form>
  </center>
  <body>
  
  </body>
</html>
