<%@page import="com.model.userTable"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	userTable user = (userTable) session.getAttribute("user");
	if (user == null) {
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>