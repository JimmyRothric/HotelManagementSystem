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
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>${account.name} Homepage</title>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation"> 
<div class="container-fluid"> 
    <div class="navbar-header" style="margin-top:-14px"> 
        <a class="navbar-brand" href="../main.jsp"><img src="../../img/logo-S.png"/></a> 
    </div> 
    <div>
    <form class="navbar-form navbar-right">
		<div id="head" class="btn-group">
			<button type="button" class="btn btn-default btn-sm" onclick="window.location.href='/HotelManagementSystem/web/user/personal_homepage.jsp'">
		  	<span class="glyphicon glyphicon-user"></span> ${account.name}
			</button>
			<button type="button" class="btn btn-warning btn-sm" onclick="window.location.href='/HotelManagementSystem/web/login.jsp?logout=true'">
				注销
			</button>
		</div>
	</form>
    </div>
</div>
</nav>
<form action="" method="post">
<div style="margin-top: 60px; margin-left: 150px; margin-right: 150px;">
<%
	Account account = (Account) session.getAttribute("account");
	OrderDao dao = new OrderDao();
	ArrayList<Order> orderList = dao.displayMyOwnOrder(account.getId());
	request.setAttribute("orderList", orderList);
%>
	<c:if test="${orderList ne null}">
		<h3>所有订单</h3><br/>
		<table class="table table-bordered" style="text-align:center">
			<thead>
				<tr>
					<td>订单号</td>
					<td>身份证号</td>
					<td>房间号</td>
					<td>房间类型</td>
					<td>入住时间</td>
					<td>离店时间</td>
					<td>金额</td>
					<td>评论</td>
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
				    <td>￥${item.price}</td>
				    <td>
				    <c:if test = "${item.order_type eq 'F'}">
				    	<button name="btn" class="btn btn-default" style="height: 20px; padding-top: 0px;" onclick="this.form.action='review.jsp?oid=${item.id}&acc_id=${item.account_id}&type=${item.room_type}';this.form.submit()">评论</button>
				    </c:if> 
				    </td>
				  </tr>  
			</tbody>
			</c:forEach>  
		</table>
	</c:if>
</div>
</form>
</body>
</html>