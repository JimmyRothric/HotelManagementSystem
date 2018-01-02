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
<%@ include file="head.jsp" %>
<form action="../QueryServlet" onsubmit="return isValid();" method="post">

<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar c = Calendar.getInstance();
	String today = sdf.format(c.getTime());
	c.add(Calendar.DAY_OF_MONTH, 1);
	String tomorrow = sdf.format(c.getTime());
%>
<div id="form" style="margin-top:80px;">
	<div class="row">  
	    <div class='col-sm-2'>  
	     	  入住时间<input id="checkin_time" type="date" name="checkin" value=<%=today%> min=<%=today%>>
	    </div>  
	    <div class='col-sm-2'>  
	       	 离店时间<input id="checkout_time" type="date" name="checkout" value=<%=tomorrow%> min=<%=tomorrow%>>
	    </div>  
	     <div class='col-sm-2'>  
	       	<input type="submit" name="searchButton" class="btn btn-primary col-lg-1" value="查询">
	    </div>
	</div>  
</div>
</form>
</body>
</html>