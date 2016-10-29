<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'inputclassinfo.jsp' starting page</title>
    
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
  <center>
  		<form action="inputclassinfo_result.jsp" method="post">
  			<table>
  				<tr>
  					<tr>
					<td align="center" colspan=2>课程信息录入</td>
				</tr>
				<tr>
					<td>课程编号：</td>
					<td><input type="text" size=13 name="id" class="form-control"></td>
				</tr>
				<tr>
					<td>课程名称：</td>
					<td><input type="text" size=20 name="name" class="form-control"></td>
				</tr>
				<tr>
					<td>学分：</td>
					<td><input type="text" size=10 name="weight" class="form-control"></td>
				</tr>
				<tr>
					<td>学时：</td>
					<td><input type="text" size=10 name="time" class="form-control"></td>
				</tr>
				<tr ><td align="center" colspan="2" ><input type="submit"  value="提交" class="btn btn-lg btn-primary btn-block">&nbsp;<input
				type="reset"  value="重置" class="btn btn-lg btn-primary btn-block"></td></tr>	
  			</table>
  		</form>
  </center>
  </body>
</html>
