<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../css/element_style.css" />
<title>Add RoomType</title>
</head>
<body>
<%@ include file="mhead.jsp" %>
<form action = "../../RoomTypeServlet" method = "post">
<div style="margin-top: 100px; margin-left: 150px; margin-right: 150px;">
	<table class="table table-bordered table-hover" style="text-align:center">
		<tr>
			<td>房间类型：</td>
			<td><input type="text" name="room_type" class="form-control" style="margin-left: 300px; width: 200px;"/></td>
		</tr>
		<tr>
			<td>价格：</td>
			<td><input type="text" name="room_price" class="form-control" style="margin-left: 300px; width: 200px;"/></td>
		</tr>
		<tr>
			<td>余量：</td>
			<td><input type="text" name="room_rest" class="form-control" style="margin-left: 300px; width: 200px;"/> </td>
		</tr>
	</table>
	<div style="float:right">
		<input type="reset" value="清空" class="btn btn-default" style="margin-top: -5px; height: 30px; width: 100px;">
		<button type="submit" name="addButton" class="managerBtn">
			<span class="glyphicon glyphicon-plus"></span> 添加
		</button>
	</div>
</div>
</form>

<%	String errorInfo = (String)request.getAttribute("addRoomTypeInfo");
	if (errorInfo != null) {
	%>	
	<script language="javascript">
		alert("<%=errorInfo%>");
	</script>
<%
	}
	session.removeAttribute("addRoomTypeInfo");
%>
</body>
</html>