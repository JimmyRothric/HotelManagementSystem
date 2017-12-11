<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add RoomType</title>
</head>
<body>
<form action = "RoomTypeServlet" method = "post">
<table>
	<tr>
		<td>房间类型：</td>
		<td><input type="text" name="room_type"/></td>
	</tr>
	<tr>
		<td>价格：</td>
		<td><input type="text" name="room_price"/></td>
	</tr>
	<tr>
		<td>余量：</td>
		<td><input type="password" name="room_rest"/> </td>
	</tr>
</table>
<input type ="submit" name = "addButton" value = "添加" style="font-size:20px">
<input type ="reset" value = "清空" style="font-size:20px">
</form>
</body>
</html>