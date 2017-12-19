<%@page import="data.RoomType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.RoomTypeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="css/element_style.css" />

<title>Reservation</title>
</head>
<body>
<form action="ReservationServlet" method="post">
入住时间<input type="date" name="checkin" value=${checkin} readonly="true">
离店时间<input type="date" name="checkout" value=${checkout} readonly="true">
房间类型：<input type = "text" name = "room_type" value = <%=request.getParameter("type")%> readonly = "true">

<button class="reserveBtn" style="vertical-align:middle"><span>预订</span></button>
</form>
</body>
</html>