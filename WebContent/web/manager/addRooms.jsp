<%@page import="java.util.ArrayList"%>
<%@page import="dao.RoomTypeDao"%>
<%@page import="dao.RoomDao"%>
<%@page import="data.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../css/element_style.css" />
<meta http-equiv="Content-Typt/html; charset=UTF-8">
<title>Room Management</title>
</head>
<body>
<%@ include file="mhead.jsp" %>
<form action = "../../RoomServlet" method = "post">

<div style="margin-top: 100px; margin-left: 150px; margin-right: 150px;">
	<table class="table table-bordered table-hover" style="text-align:center">
		<tr>
			<td>房号</td>
			<td><input type="text" name="room_id" class="form-control" style="margin-left: 300px; width: 200px;"/></td>
		</tr>
		<tr>
			<td>房间类型</td>
			<td>
			<select name="room_type" class="form-control" style="margin-left: 300px; width: 200px;">
			<%
				RoomTypeDao rtd = new RoomTypeDao();
				ArrayList<RoomType> rtList = rtd.getRoomTypes();
				if (rtList != null){
					for (int i = 0; i < rtList.size(); i++){
						String type = rtList.get(i).getType();
						out.print("<option value=\""+ type +"\">"+ type +"</option>");
					}
				}
			%>
			</select>
			</td>
		</tr>
		<tr>
			<td>楼层</td>
			<td><input type="text" name="room_floor" class="form-control" style="margin-left: 300px; width: 200px;"/> </td>
		</tr>
		<tr>
			<td>朝向</td>
			<td><input type="text" name="room_ort" class="form-control" style="margin-left: 300px; width: 200px;"/></td>
		</tr>
		<tr>
			<td>描述</td>
			<td><input type="text" name="room_dspt" class="form-control" style="margin-left: 300px; width: 200px;"/></td>
		</tr>
	</table>
	<div style="float:right">
		<input type="reset" value="清空" class="btn btn-default" style="margin-top: -5px; height: 30px; width: 100px;">
		<button type="submit" name="addButton" class="managerBtn">
			<span class="glyphicon glyphicon-plus"></span> 添加
		</button>
	</div>

<%	String errorInfo = (String)request.getAttribute("addRoomInfo");
	if (errorInfo != null) {
	%>	
	<script language="javascript">
		alert("<%=errorInfo%>");
	</script>
<%
	}
	session.removeAttribute("addRoomInfo");
%>

</div>
</form>
</body>
</html>