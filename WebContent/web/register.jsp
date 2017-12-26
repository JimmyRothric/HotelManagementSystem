<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
</head>
<body>
<form action="../RegisterServlet" method="post">
<div style="float:right">
<button onclick = "this.form.action='login.jsp';this.form.submit()">返回登录页面</button>
</div>
<table>
	<tr>
		<td>身份证号：</td>
		<td><input type="text" name="username"/></td>
	</tr>
	<tr>
		<td>姓名：</td>
		<td><input type="text" name="name"/></td>
	</tr>
	<tr>
		<td>设置密码：</td>
		<td><input type="password" name="password0"/> </td>
	</tr>
	<tr>
		<td>确认密码：</td>
		<td><input type="password" name="password1"/> </td>
	</tr>
</table>
<input type="submit" value="注册 " style="width:252px;height:30px;"/>
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