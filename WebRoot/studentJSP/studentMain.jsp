<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'studentMain.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<jsp:include page="../islogin.jsp"></jsp:include>
<frameset rows="18%,*">
	<frame src="studentJSP/stuTop.jsp">
	<frameset cols="16%,*">
		<frame src="studentJSP/stuMain_left.jsp">
		<frame src="studentJSP/stuMain_right.jsp"
			name="studentJSP/stuMain_right">
	</frameset>
</frameset>
<body>
</body>
</html>
