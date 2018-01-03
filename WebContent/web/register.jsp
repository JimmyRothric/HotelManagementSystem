<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/element_style.css" />
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<title>Register</title>
</head>
<body>
<form action="../RegisterServlet" method="post">
<div id="back" style="float:right; margin-top:-100px;">
<button class="btn btn-link" onclick="this.form.action='login.jsp';this.form.submit()">返回登录页面</button>
</div>
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
<div class="container-fluid" style="margin-top: 50px; margin-left: 50px; margin-right: 50px;">
	<div class="row-fluid">
		<div class="col-md-8">
			
		</div>
		<div class="col-md-4">
		   	<div class="col-md-4">
		       	<input type="text" class="form-control" name="username" placeholder="身份证号" required autofocus/>
		   	</div>
		   	<div class="col-md-4"></div>
		   	<div class="col-md-4">
		       	<input type="text" class="form-control" name="name" placeholder="姓名" required autofocus/>
		   	</div>
		   	<div class="col-md-4"></div>
		   	<div class="col-md-4">
		       	<input type="password" class="form-control" name="password0" placeholder="密码" required autofocus/>
		   	</div>
		   	<div class="col-md-4"></div>
		   	<div class="col-md-4">
		       	<input type="password" class="form-control" name="password1" placeholder="确认密码" required autofocus/>
		   	</div>
		   	<div class="col-md-4"></div>
		   	<div class="col-md-4">
		       	<input type="submit" class="btn btn-primary col-md-8" value="注册  "/></td>
		   	</div>
		</div>
	</div>
</div>
</form>

<%	
	String registerInfo = (String)request.getAttribute("registerError");
	if (registerInfo != null) {
	%>	
	<script language="javascript">
		alert("<%=registerInfo%>");
	</script>
<%
	}
	request.removeAttribute("registerError");
%>
</body>
</html>