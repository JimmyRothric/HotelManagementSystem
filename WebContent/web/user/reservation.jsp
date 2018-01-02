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
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Reservation</title>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation"> 
<div class="container-fluid"> 
    <div class="navbar-header" style="margin-top:-14px"> 
        <a class="navbar-brand" href="../main.jsp"><img src="../../img/logo-S.png"/></a> 
    </div> 
    <div>
    <form class="navbar-form navbar-right">
		<div id="head" class="btn-group">
			<button type="button" class="btn btn-default btn-sm" onclick="window.location.href='/HotelManagementSystem/web/user/personal_homepage.jsp'">
		  	<span class="glyphicon glyphicon-user"></span> ${account.name}
			</button>
			<button type="button" class="btn btn-warning btn-sm" onclick="window.location.href='/HotelManagementSystem/web/login.jsp?logout=true'">
				注销
			</button>
		</div>
	</form>
    </div>
</div>
</nav>
<form action="../../ReservationServlet" method="post">
<div style="margin-top: 100px; margin-left: 150px; margin-right: 150px;">
<div class="container">
	<h3>确认订单</h3><br/>
	<div class="row">
		<div class="col-md-2">
			<div class="row">
				入住时间<br/>
				<input type="date" name="checkin" value=${checkin} readonly="true"><br/>
				离店时间<br/>
				<input type="date" name="checkout" value=${checkout} readonly="true"><br/>
				房间类型<br/>
				<input type="text" name="room_type" class="form-control" style="width: 150px; text-align:center;" value=<%=request.getParameter("type")%> readonly="true"></p>
			</div>
		</div>
		<div class="col-md-2">
			<div class="row">
				<c:if test = "${account.group ne 'User'}"> 
					证件号：<input type="text" name="user_id" class="form-control"/><br/>
					姓名：<input type="text" name="user_name" class="form-control"/><br/>
				</c:if>
			</div>
		</div>
		<div class="col-md-2">
			其他要求<br/>
			<input type="radio" name="floor" value="高楼层" checked>高楼层<br/>
			<input type="radio" name="floor" value="低楼层">低楼层</p>
			<input type="radio" name="orientation" value="朝南" checked>朝南<br/>
			<input type="radio" name="orientation" value="不朝南">不朝南<br/>
			备注
			<input type="text" name="demand" class="form-control" style="width: 200px;"/></p>
			<button class="reserveBtn" style="vertical-align:middle; width: 150px; height: 35px; padding-top: 5px;"><span>提交</span></button>
		</div>
	</div>
</div>

<!-- <div style="text-align:center">
		入住时间<input type="date" name="checkin" value=${checkin} readonly="true">
		离店时间<input type="date" name="checkout" value=${checkout} readonly="true">
		房间类型：<input type="text" name="room_type" class="form-control" style="width: 150px; text-align:center;" value=<%=request.getParameter("type")%> readonly="true"></p>
		<c:if test = "${account.group ne 'User'}"> 
			证件号：<input type="text" name="user_id" class="form-control"/><br/>
			姓名：<input type="text" name="user_name" class="form-control"/><br/>
		</c:if>
	
		其他要求：<br/>
		<input type="radio" name="floor" value="高楼层" checked>高楼层<br/>
		<input type="radio" name="floor" value="低楼层">低楼层</p>
		<input type="radio" name="orientation" value="朝南" checked>朝南<br/>
		<input type="radio" name="orientation" value="不朝南">不朝南<br/>
		备注：<input type="text" name="demand" class="form-control" style="width: 200px;"/></p>
		<button class="reserveBtn" style="vertical-align:middle"><span>提交</span></button>
	</div> -->	
</div>

</form>
</body>
</html>