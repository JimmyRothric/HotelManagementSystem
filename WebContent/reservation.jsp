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
入住时间<input type="date" name="checkin" min="2017-12-04">
离店时间<input type="date" name="checkout" min="2017-12-04">
房间类型${type}

<button class="reserveBtn" style="vertical-align:middle"><span>预订</span></button>
</form>
</body>
</html>