<%@page import="dao.RoomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/element_style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
function changeSt(){
	var t=prompt("状态修改为? E=空房 F=正在居住 N=待分配 R=保留 B=故障");
	document.getElementById("str").value = t;
}


</script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="mhead.jsp" %>
<%
	RoomDao dao = new RoomDao();
	pageContext.setAttribute("roomList", dao.displayAll());
%>
<div style="margin-top: 100px; margin-left: 150px; margin-right: 150px;">
<form action = "../../RoomServlet" method = "post">	
<input id="str" type="hidden" name= "c_state">
	<table class="table table-bordered table-hover" style="text-align:center">

	<thead>
		<tr>
			<td>房间号</td>
			<td>房型</td>
			<td>楼层</td>
			<td>朝向</td>
			<td>描述</td>
			<td>状态</td>
			<td>功能</td>
		</tr>
	</thead>
	<c:forEach var="r" varStatus="i" items="${roomList}">
	<tbody>
		<tr>
			<td>${r.id}</td>
			<td>${r.type}</td>
			<td>${r.floor}</td>
			<td>${r.orientation}</td>
			<td>${r.description}</td>
			<td>${r.state}</td>
			<td><input type = "submit" name = "changeBtn" value = "修改状态" onclick="changeSt();this.form.action='../../RoomServlet?rid=${r.id}';this.form.submit()"></td>
		</tr>
	</tbody>
	</c:forEach>
</table>
</form>
</div>
</body>
</html>