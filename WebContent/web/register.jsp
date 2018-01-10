<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/element_style.css" />
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<title>Register</title>
</head>
<body style="background-image: url(../img/grey-bg.png); background-repeat: repeat-x;">
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="background-color: #000000;"> 
<div class="container-fluid"> 
    <div class="navbar-header" style="padding-left: 3%"> 
        <a class="navbar-brand" href="/HotelManagementSystem/web/main.jsp" style="padding-top: 3%">
        	<img src="/HotelManagementSystem/img/logo-S.png" alt="logo"/>
        </a> 
    </div> 
    <div>
   		<form class="navbar-form navbar-right">
			<button type="button" class="btn btn-default btn-sm" onclick="window.location.href='/HotelManagementSystem/web/login.jsp'">
				<span class="glyphicon glyphicon-log-in"></span> 登录
			</button>
		</form>
	</div>
</div>
</nav>
<form action="../RegisterServlet" method="post">

<!--  
<div style="float:left;">
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>   
	<div class="carousel-inner">
		<div class="item active">
			<img src="../img/hotel-1.jpg" alt="First slide">
		</div>
		<div class="item">
			<img src="../img/hotel-2.jpg" alt="Second slide">
		</div>
		<div class="item">
			<img src="../img/hotel-3.jpg" alt="Third slide">
		</div>
	</div>
	<a class="carousel-control left" href="#myCarousel" 
	   data-slide="prev">&lsaquo;</a>
	<a class="carousel-control right" href="#myCarousel" 
	   data-slide="next">&rsaquo;</a>
</div>
-->


<div style="position: relative; top: 50px">
<div class="container">
	<div class="row" style="padding-left: 6%">
		<div class="col-md-4">
		</div>
		<div class="col-md-3" style="height: 475px; width: 300px; background-image: url('/HotelManagementSystem/img/login.png');">
			<div style="text-align: center; padding-top: 2%;">
				<!-- LOGO -->
				<img src="../img/logo-M.png" alt="logo" class="img-circle"/>
			</div>
			<div style="padding-top: 20%">
				<input type="text" class="form-control" name="username" placeholder="身份证号" required autofocus/><br/>
				<input type="text" class="form-control" name="name" placeholder="姓名" required autofocus/><br/>
				<input type="password" class="form-control" name="password0" placeholder="密码" required autofocus/><br/>
				<input type="password" class="form-control" name="password1" placeholder="确认密码" required autofocus/><br/>
				<button type="submit" class="btn .btn-default col-md-12" style="height: 40px; font-size: 16px; color: white; background-color: #e7b94b; margin-left: 0%" >
		   			注册
		   		</button>
	   		</div>
		</div>
		<div class="col-md-4">
		</div>
	</div>
</div>
</div>
</form>
<%@ include file="errorinfo.html" %>
</body>
</html>