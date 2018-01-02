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
<div style="margin-top: 100px; margin-left: 150px; margin-right: 150px;">
<h3>退房管理</h3>
<p>
身份证号：
<input type="text"  name="id">
<input type="submit" name="searchBtn" value="查询">
</p>
<c:if test = "${orderList ne null}"> 
订单表：<br/>
<table class="table table-bordered table-hover" style="text-align:center">
	<thead>
		<tr>
			<td>Oid</td>
			<td>Uid</td>
			<td>Rid</td>
			<td>type</td>
			<td>checkin</td>
			<td>checkout</td>
			<td>price</td>
			<td>demand</td>
			<td>function</td>
		</tr>
	</thead>
	<c:forEach items="${orderList}" var="item">  
	<tbody>
		  <tr>  
		    <td>${item.id}</td>  
		    <td>${item.account_id}</td>  
		    <td>${item.room_id}</td>
		    <td>${item.room_type}</td>
		    <td>${item.checkin}</td>  
		    <td>${item.checkout}</td>  
		    <td>${item.demand}</td>
		    <td>￥${item.price}</td>
		    <td><table>
		    	<tr>
		    		<td><input type="submit" name="updateInfoBtn" class="btn btn-warning" value="更新退房时间" onclick="changeCheckOut();this.form.action='../../CheckoutServlet?oid=${item.id}';this.form.submit()"></td>
		        	<td><input type="submit" name="checkoutBtn" class="btn btn-danger" value="退房" onclick="this.form.action='../../CheckoutServlet?oid=${item.id}&rid=${item.room_id}';this.form.submit()"></td> 
		  		</tr>
		  	</table></td>
		  </tr> 
	</tbody> 
	</c:forEach>  
</table>
</c:if>
<c:remove var="orderList"/>
</div>
</form>
</body>
</html>