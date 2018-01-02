<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../css/element_style.css" />
<script src="../js/bootstrap.min.js"></script>
<%
	String logout = request.getParameter("logout");
	if (logout != null && logout.equals("true")){
		session.removeAttribute("account");
	}
%>
<title>Login</title>
</head>
<body>
<body background="../img/login.jpg">
<form action="../LoginServlet" method="post">
<div class="mycenter">
<div class="mysign">
	<!-- LOGO -->
	<div class="col-lg-11 text-center text-info">
		<img src="../img/logo-M.png" alt="logo" class="img-circle"/>
	</div>
	<br/>
 	<!-- LOGIN -->
   	<div class="col-lg-10">
       	<input type="text" class="form-control" name="username" placeholder="请输入身份证号" required autofocus/>
   	</div>
   	<div class="col-lg-10"></div>
   	<div class="col-lg-10">
       	<input type="password" class="form-control" name="password" placeholder="请输入密码" required autofocus/>
   	</div>
   	<div class="col-lg-10"></div>
   	<div class="col-lg-10">
   		<button type="button" class="btn btn-default col-lg-12" onclick="this.form.action='register.jsp';this.form.submit()">注册</button>
   	</div>
   	<div class="col-lg-10"></div>
   	<div class="col-lg-10">
       	<input type="submit" class="btn btn-primary col-lg-12" value="登录 "/></td>
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