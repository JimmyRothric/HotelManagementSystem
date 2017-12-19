<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.RoomType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.RoomTypeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trump Hotel</title>
</head>
<body>
<script>
function isValid() {
	var checkin = document.getElementById("checkin_time").value;
	var checkout = document.getElementById("checkout_time").value;
	var ci = new Date(checkin.split("-"));
	var co = new Date(checkout.split("-"));
	if (ci > co) {
		alert("输入日期错误,入住时间晚于离店时间");
		return false;
	}
}
</script>

<form action="QueryServlet" onsubmit="return isValid();" method="post">
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar c = Calendar.getInstance();
	String today = sdf.format(c.getTime());
	c.add(Calendar.DAY_OF_MONTH, 1);
	String tomorrow = sdf.format(c.getTime());
%>
入住时间<input id="checkin_time" type="date" name="checkin" value=<%=today%> min=<%=today%>>
离店时间<input id="checkout_time" type="date" name="checkout" value=<%=tomorrow%> min=<%=tomorrow%>>
<br/>
<input type = "submit" name = "searchButton" value = "查询">
<br/>
</form>
</body>
</html>