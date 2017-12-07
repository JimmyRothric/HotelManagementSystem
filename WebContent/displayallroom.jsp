<%@ page import="data.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="css/element_style.css" />

<title>Details</title>
</head>
<body>
<% 	
	RoomDao dao = new RoomDao();
	ArrayList<Room> allRoomList = new ArrayList<Room>();
	allRoomList = dao.displayAll();
	int i = 0;
	if (allRoomList != null) {
%>
<table border="0" cellspacing="0px" class="td">
	<tr>
		<td>Room_ID</td>
		<td>Room_Type</td>
		<td>Floor</td>
		<td>Orientation</td>
		<td>Description</td>
		<td></td>
	</tr>
<% 	
		for (Room r:allRoomList) {
			
%>
	<tr>
		<td><%=r.getId() %></td>
		<td><%=r.getType() %></td>	
		<td><%=r.getFloor() %></td>	
		<td><%=r.getOrientation() %></td>
		<td><%=r.getDescription() %></td>
		<td><input type="submit" name="reserveBtn" value="预订 "/></td>		
	</tr>
<%			
			i++;
		}
%>
</table>
<%
	}
%>
</body>
</html>