<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function changeCheckOut(){
	var t=prompt("时间修改为? [YYYY-MM-DD]","<% 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		out.print(sdf.format(Calendar.getInstance().getTime()));
			%>");
	document.getElementById("str").value = t;
}

</script>
<link rel="stylesheet" type="text/css" href="css/element_style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check out</title>
</head>
<body>
<%@ include file="rhead.jsp" %>
<form action = "../../CheckoutServlet" method = "post">
 <input id="str" type="hidden" name= "checkout_time">
 <div style="margin-top:100px;">
<p>
身份证号：
<input type = "text"  name = "id">
<input type = "submit" name = "searchBtn" value = "查询">
</p>
<c:if test = "${orderList ne null}"> 
订单表：<br/>
<table border="1" cellspacing="0px" class="td">
<th>Oid</th>
<th>Uid</th>
<th>Rid</th>
<th>type</th>
<th>checkin</th>
<th>checkout</th>
<th>price</th>
<th>function</th>
<c:forEach items="${orderList}" var="item">  
		  <tr>  
		    <td>${item.id}</td>  
		    <td>${item.account_id}</td>  
		    <td>${item.room_id}</td>
		    <td>${item.room_type}</td>
		    <td>${item.checkin}</td>  
		    <td>${item.checkout}</td>  
		    <td>${item.price}</td>
		    <td><input type = "submit" name = "updateInfoBtn" value = "更新退房时间" onclick="changeCheckOut();this.form.action='../../CheckoutServlet?oid=${item.id}';this.form.submit()">
		        <input type = "submit" name = "checkoutBtn" value = "退房" onclick="this.form.action='../../CheckoutServlet?oid=${item.id}&rid=${item.room_id}';this.form.submit()"></td> 
		  </tr>  
</c:forEach>  
</table>
</c:if>
<c:remove var="orderList"/>
</div>
</form>
</body>
</html>