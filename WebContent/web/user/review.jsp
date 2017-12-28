<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="../../ReviewServlet" method="post">

<table>
	<tr>
		<td><textarea name="comment" style="height: 100px; width: 400px; resize: none;" /></textarea></td>
	</tr>
	<tr>
		<td><textarea name="rate" style="height: 30px; width: 400px; resize: none;" /></textarea></td>
	</tr>
	<tr>
		<td align="right"><input type="submit" value="提交 " onclick="this.form.action='ReviewServlet?oid=${item.id}&acc_id=${item.account_id}&type=?${item.room_type}';this.form.submit()"/></td>
	</tr>
</table>
</form>
</body>
</html>