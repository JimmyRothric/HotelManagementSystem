<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String order = request.getParameter("oid");
	String account = request.getParameter("acc_id");
	String type = request.getParameter("type");

%>

<form action="../../ReviewServlet" method="post">

<table>
	<tr>
		<td><textarea name="comment" style="height: 100px; width: 400px; resize: none;" /></textarea></td>
	</tr>
	<tr>
		<td><textarea name="rate" style="height: 30px; width: 400px; resize: none;" /></textarea></td>
	</tr>
	<tr>
		<td align="right"><input type="submit" value="提交 " onclick="this.form.action='../../ReviewServlet?oid=<%=order%>&acc_id=<%=account%>&type=<%=type%>';this.form.submit()"/></td>
	</tr>
</table>
</form>
</body>
</html>