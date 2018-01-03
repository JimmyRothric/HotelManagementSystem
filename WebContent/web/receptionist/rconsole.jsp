<%@page import="dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../css/element_style.css" />
<title>Insert title here</title>
</head>
<body>
<%@ include file="rhead.jsp" %>
<%
	OrderDao dao = new OrderDao();
	request.setAttribute("orderList", dao.getAllOrder());
%>
<div style="margin-top: 100px; margin-left: 150px; margin-right: 150px;">
<c:if test="${orderList ne null}">
<h3>订单表：</h3><br/>
<table class="table table-bordered table-hover" style="text-align:center">
	<thead>
		<tr>
			<td>Oid</td>
			<td>Uid</td>
			<td>Rid</td>
			<td>type</td>
			<td>checkin</td>
			<td>checkout</td>
			<td>demand</td>
			<td>price</td>
			<td>order_type</td>
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
		    <td>${item.order_type}</td>
		</tr>  
	</tbody>
	</c:forEach>  
</table>
</c:if>
</div>
</body>
</html>