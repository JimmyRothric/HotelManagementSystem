<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../css/element_style.css" />
<script src="../js/bootstrap.min.js"></script>
<title>Register</title>
</head>
<body>
<form action="../RegisterServlet" method="post">
<div style="float:right; margin-top:-100px;">
<button class="btn btn-link" onclick="this.form.action='login.jsp';this.form.submit()">返回登录页面</button>
</div>
<div class="mycenter">
<div class="mysign">
   	<div class="col-lg-10">
       	<input type="text" class="form-control" name="username" placeholder="身份证号" required autofocus/>
   	</div>
   	  	<div class="col-lg-10"></div>
   	<div class="col-lg-10">
       	<input type="text" class="form-control" name="name" placeholder="姓名" required autofocus/>
   	</div>
   	  	<div class="col-lg-10"></div>
   	<div class="col-lg-10">
       	<input type="password" class="form-control" name="password0" placeholder="密码" required autofocus/>
   	</div>
   	<div class="col-lg-10"></div>
   	<div class="col-lg-10">
       	<input type="password" class="form-control" name="password1" placeholder="确认密码" required autofocus/>
   	</div>
   	<div class="col-lg-10"></div>
   	<div class="col-lg-10">
       	<input type="submit" class="btn btn-primary col-lg-12" value="注册  "/></td>
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