<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
<form action="../LoginServlet" method="post">
<table>
	<tr>
		<td>身份证号：</td>
		<td><input type="text" name="username"/></td>
	</tr>
	<tr>
		<td>密  码：</td>
		<td><input type="password" name="password"/> </td>
	</tr>
	<tr>
		<td><input type="reset" value="重置"/></td>
		<td align="right">
		<input type="button" value="注册 " onclick="this.form.action='register.jsp';this.form.submit()"/>
		<input type="submit" value="登录 "/></td>
	</tr>
</table>
<%	String errorInfo = (String)request.getAttribute("loginError");
	if (errorInfo != null) {
	%>	
	<script language="javascript">
		alert("<%=errorInfo%>");
	</script>
<%
	}
	request.removeAttribute("loginError");
%>
</form>
</body>
</html>