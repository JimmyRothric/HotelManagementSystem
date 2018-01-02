<%@page import="dao.RoomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/element_style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="mhead.jsp" %>
<%
	RoomDao dao = new RoomDao();
	pageContext.setAttribute("roomList", dao.displayAll());
%>
<div style="margin-top: 100px; margin-left: 150px; margin-right: 150px;">
<table class="table table-bordered table-hover" style="text-align:center">
	<tr>
		<td>房间号</td>
		<td>房型</td>
		<td>楼层</td>
		<td>朝向</td>
		<td>描述</td>
		<td>状态</td>
	</tr>
<c:forEach var="r" varStatus="i" items="${roomList}">
	<tr>
		<td>${r.id}</td>
		<td>${r.type}</td>
		<td>${r.floor}</td>
		<td>${r.orientation}</td>
		<td>${r.description}</td>
		<td>${r.state}</td>
	</tr>
</c:forEach>
</table>
</div>
</body>
</html>