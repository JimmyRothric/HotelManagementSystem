
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../css/element_style.css" />
<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
<script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>  
<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<%
	String logout = request.getParameter("logout");
	if (logout != null && logout.equals("true")){
		//session.removeAttribute("account");
		Enumeration<String> e = session.getAttributeNames();
		while (e.hasMoreElements()){
			session.removeAttribute(e.nextElement());
		}
		
	}
%>
<title>Login</title>
</head>
<body background="../img/grey-bg.png">
<nav class="navbar navbar-inverse" role="navigation" style="background-color: #000000;"> 
<div class="container-fluid"> 
    <div class="navbar-header" style="margin-top:-5px"> 
        <a class="navbar-brand" href="/HotelManagementSystem/web/main.jsp"><img src="/HotelManagementSystem/img/logo-S.png"/></a> 
    </div> 
</div>
</nav>
<form action="../LoginServlet" method="post">
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
				
				<input type="text" class="form-control" name="username" placeholder="请输入身份证号" required autofocus/><br/>
				<input type="password" class="form-control" name="password" placeholder="请输入密码" required autofocus/><br/>
				<button type="button" class="btn .btn-default col-md-12" style="color: white; margin-left: 0px" onclick="this.form.action='register.jsp';this.form.submit()">
		   			注册
		   		</button>
		   		<button type="submit" class="searchBtn" style="height: 40px; width: 332px; margin-left: 0px; padding-top: 7px;">
		   			登录
		   		</button>
	   		</div>
		</div>
		<div class="col-md-3">
		</div>
	</div>
</div>
<%	String errorInfo = (String)session.getAttribute("loginError");
	if (errorInfo != null) {
	%>	
	<script language="javascript">
		alert("<%=errorInfo%>");
	</script>
<%
	}
	session.removeAttribute("loginError");
%>
</form>
</body>
</html>