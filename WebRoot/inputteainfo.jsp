<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'inputteainfo.jsp' starting page</title>
    
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
  		<form action="inputteainfo_result.jsp" method="post">
  			<table>
  				<tr>
  					<td align="center" colspan=2>老师信息录入</td>
  				</tr>
  				<tr>
  					<td>职工编号:</td>
  					<td><input type="text" size=13 name="id" class="form-control"></td>
  				</tr>
  				<tr>
  					<td>姓名:</td>
  					<td><input type="text" size=20 name="name" class="form-control"></td>
  				</tr>
  				<tr>
					<td>学院</td>
					<td><select name="department" class="form-control">
							<option selected>信息与软件工程学院</option>
							<option>物理电子工程学院</option>
							<option>光电学院</option>
							<option>微电子与固体物理学院</option>
						</select></td>
				</tr>
				<tr ><td align="center" colspan="2" ><input type="submit"  value="提交" class="btn btn-lg btn-primary">&nbsp;&nbsp; <input
				type="reset"  value="重置" class="btn btn-lg btn-primary"></td></tr>
  			</table>
  		</form>
  </center>
  </body>
</html>
