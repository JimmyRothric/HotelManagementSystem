<%@page import="data.RoomType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.RoomTypeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="../../css/element_style.css" />

<title>Reservation</title>
</head>
<body>
<form action="../../ReservationServlet" method="post">
<div style="float:right">
<button onclick="this.form.action='displayroom.jsp';this.form.submit()">返回</button>
</div>
<div style="text-align:center">
入住时间<input type="date" name="checkin" value=${checkin} readonly="true">
离店时间<input type="date" name="checkout" value=${checkout} readonly="true">
房间类型：<input type="text" name="room_type" value =<%=request.getParameter("type")%> readonly="true"></p>
<c:if test = "${account.group ne 'User'}"> 
证件号：<input type="text" name="user_id"/><br/>
</c:if>

其他要求：<br/>
<input type="radio" name="floor" value="高楼层" checked>高楼层<br/>
<input type="radio" name="floor" value="低楼层">低楼层</p>
<input type="radio" name="orientation" value="朝南" checked>朝南<br/>
<input type="radio" name="orientation" value="不朝南">不朝南<br/>
<input type="text" name="demand"/></p>
<button class="reserveBtn" style="vertical-align:middle"><span>提交</span></button>
</div>
</form>
</body>
</html>