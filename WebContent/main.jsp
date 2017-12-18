<%@page import="data.RoomType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.RoomTypeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trump Hotel</title>
</head>
<body>
<form action="QueryServlet" method="post">
入住时间<input type="date" name="checkin" min="2017-12-04">
离店时间<input type="date" name="checkout" min="2017-12-04">
<br/>
<input type = "submit" name = "searchButton" value = "查询">
<br/>
</form>
</body>
</html>