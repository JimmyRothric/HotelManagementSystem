<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/element_style.css" />
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<title>Register</title>
</head>
<body background="../img/grey-bg.png">
<nav class="navbar navbar-inverse" role="navigation" style="background-color: #000000;"> 
<div class="container-fluid"> 
    <div class="navbar-header" style="margin-top:-5px"> 
        <a class="navbar-brand" href="/HotelManagementSystem/web/main.jsp"><img src="/HotelManagementSystem/img/logo-S.png"/></a> 
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


<div style="margin-left: 15%">
<div class="container">
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-4" style="height: 475px; background-image: url('/HotelManagementSystem/img/login.png');">
			<div style="margin-top: 5px; margin-left: 115px;">
				<!-- LOGO -->
				<img src="../img/logo-M.png" alt="logo" class="img-circle"/>
			</div>
			<div style="margin-top: 60px">
				<input type="text" class="form-control" name="username" placeholder="身份证号" required autofocus/><br/>
				<input type="text" class="form-control" name="name" placeholder="姓名" required autofocus/><br/>
				<input type="password" class="form-control" name="password0" placeholder="密码" required autofocus/><br/>
				<input type="password" class="form-control" name="password1" placeholder="确认密码" required autofocus/><br/>
				<button type="submit" class="searchBtn" style="height: 40px; width: 332px; margin-left: 0px; padding-top: 7px;" >
		   			注册
		   		</button>
	   		</div>
		</div>
		<div class="col-md-3">
		</div>
	</div>
</div>
</div>
</form>
<%@ include file="errorinfo.html" %>
</body>
</html>