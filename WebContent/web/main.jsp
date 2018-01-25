<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.RoomType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.RoomTypeDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/element_style.css" />
<script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>  
<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<title>Mario Hotel</title>
</head>
<body style="background-image: url(../img/grey-bg.png); background-repeat: repeat-x;">
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
<c:if test="${account.group ne 'Receptionist' && account.group ne 'Manager'}">
<%@ include file="head.jsp" %>
</c:if>
<c:if test="${account.group eq 'Receptionist'}">
<%@ include file="receptionist/rhead.jsp" %>
</c:if>
<c:if test="${account.group eq 'Manager'}">
<%@ include file="u-mhead.jsp" %>
</c:if>
<form action="../QueryServlet" onsubmit="return isValid();" method="post">

<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar c = Calendar.getInstance();
	String today = sdf.format(c.getTime());
	c.add(Calendar.DATE, 1);
	String tomorrow = sdf.format(c.getTime());
	c.add(Calendar.DATE, 364);
	String max_today = sdf.format(c.getTime());
	c.add(Calendar.DATE, 1);
	String max_tomorrow = sdf.format(c.getTime());
%>
<div class="container">
	<div class="row" style="padding-top: 20%">
	
		<!-- title -->
		<div style="font-family: Calisto MT">
			<h1 style="text-align: center">MARIO HOTELS</h1>
			<h4 style="text-align: center">NEVER SETTLE</h4>
		</div>
		
		<!-- check-in & checkout -->
		<div style="padding-top: 5%; padding-left: 3%;">
			<div class="col-md-2">
			</div>
			<div class="col-md-2" style="margin-left: 3%">
				<h5>入住时间</h5>
				<input id="checkin_time" class="form-control" type="date" name="checkin" style="height: 33px; width: 175px;" value=<%=today%> min=<%=today%> max=<%=max_today%>>	
			</div>
			<div class="col-md-2" style="margin-left: 3%">
				<h5>离店时间</h5>
				<input id="checkout_time" class="form-control" type="date" name="checkout" style="height: 33px; width: 175px;" value=<%=tomorrow%> min=<%=tomorrow%> max=<%=max_tomorrow%>>
			</div>
			<div class="col-md-2" style="margin-left: 3%; padding-top: 30px;">
				<input type="submit" name="searchButton" class="reserveBtn" style="border-radius: 2px; height: 33px; width: 175px;" value="查询">
			</div>
		</div>
	</div>
</div>	
</form>
</body>
</html>