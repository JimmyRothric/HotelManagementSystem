<%@ page import="data.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.td td{width:120px;height:30px;text-align:center;}
</style>
<title>${account.name} Homepage</title>
</head>
<body>
<form action="../../CheckoutServlet" method="post">
<div style="float:right">
<button onclick="this.form.action='main.jsp';this.form.submit()">返回</button>

</div>
<%
	OrderDao dao = new OrderDao();
	ArrayList<Order> orderList = dao.displayMyOwnOrder("123");
	request.setAttribute("orderList", orderList);
%>

<c:if test="${orderList ne null}">
订单表：<br/>
<table border="1" cellspacing="0px" class="td">
	<tr>
		<td>Oid</td>
		<td>Uid</td>
		<td>Rid</td>
		<td>type</td>
		<td>checkin</td>
		<td>checkout</td>
		<td>price</td>
		<td>Review</td>
	</tr>
<c:forEach items="${orderList}" var="item">  
	  <tr>  
	    <td>${item.id}</td>  
	    <td>${item.account_id}</td>  
	    <td>${item.room_id}</td>
	    <td>${item.room_type}</td>
	    <td>${item.checkin}</td>  
	    <td>${item.checkout}</td>  
	    <td>${item.price}</td>
	    <c:if test = "${item.order_type eq 'S'}">
	    	<td><button onclick="this.form.action='review.jsp?oid=${item.id}&acc_id=${item.account_id}&type=?${item.room_type}';this.form.submit()">评论</button></td>
	    </c:if> 
	  </tr>  
</c:forEach>  
</table>
</c:if>

</form>
</body>
</html>