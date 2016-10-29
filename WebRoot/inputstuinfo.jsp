<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'inputstuinfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">

  </head>
  <jsp:include page="islogin.jsp"></jsp:include>
  <script type="text/javascript" src="${pageContext.request.contextPath }/Js/My97DatePicker/WdatePicker.js"></script>  
  <body>
  <center>
		<form action="inputstuinfo_result.jsp" method="post">
			<table>
				<tr>
					<td align="center" colspan=2>学生信息录入</td>
				</tr>
				<tr>
					<td>学号：</td>
					<td><input type="text" size=13 name="id" class="form-control"></td>
				</tr>
				<tr>
					<td>姓名：</td>
					<td><input type="text" size=20 name="name" class="form-control"></td>
				</tr>
				<tr>
					<td>性别</td>
					<td><input type="radio" name="sex" checked value="1">男&nbsp;&nbsp;
						<input type="radio" name="sex" value="0">女</td>
				</tr>
				<tr>
					<td>出生日期：</td>
					<td><input type="text" name="date" style="width:90%" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></td>
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
				<tr>
					<td>所学专业：</td>
					<td><select name="specialty" class="form-control">
							<option selected>软件工程-大型主机</option>
							<option>软件工程-网络安全</option>
							<option>软件工程-嵌入式系统</option>
							<option>计算机科学与技术</option>
							<option>通信工程</option>
							<option>电气工程</option>
					</select></td>
				</tr>
				<tr ><td align="center" colspan="2" ><input type="submit"  value="提交" class="btn btn-lg btn-primary">&nbsp;&nbsp; <input
				type="reset"  value="重置" class="btn btn-lg btn-primary"></td></tr>				
			</table>
			
		</form>
	</center>
  </body>
</html>
