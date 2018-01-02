<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/element_style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reservations Check In</title>
</head>
<body>
<%@ include file="rhead.jsp" %>
<form action = "../../CheckinServlet" method = "post">
<div style="margin-top: 100px; margin-left: 150px; margin-right: 150px;">
<h3>预订入住</h3>
<p>
身份证号：
<input type = "text"  name = "id">
<input type = "submit" name = "rsearchBtn" value = "查询">
</p>

<c:if test = "${orderList ne null}"> 
订单表：<br/>
<table class="table table-bordered table-hover" style="text-align:center">
	<thead>
		<tr>
			<td>Oid</td>
			<td>Uid</td>
			<td>type</td>
			<td>checkin</td>
			<td>checkout</td>
			<td>function</td>
		</tr>
	</thead>
	<c:forEach items="${orderList}" var="item"> 
	<tbody>  
		  <tr>  
		    <td>${item.id}</td>  
		    <td>${item.account_id}</td>  
		    <td>${item.room_type}</td>
		    <td>${item.checkin}</td>  
		    <td>${item.checkout}</td>
		    <td> <button type="submit" name="deleteBtn" class="btn btn-danger" onclick="this.form.action='../../CheckinServlet?oid=${item.id}';this.form.submit()">
		   			<span class="glyphicon glyphicon-remove"></span>
		   		</button>
		    </td>
		  </tr>  
	</tbody>
	</c:forEach>  
</table>
为订单${orderList[0].id}分配房间：<br/>
<table class="table table-bordered table-hover" style="text-align:center">
	<thead>
		<tr>
			<td>id</td>
			<td>type</td>
			<td>floor</td>
			<td>orientation</td>
			<td>description</td>
			<td>function</td>
		</tr>
	</thead>
	<c:forEach items="${roomList}" var="item">  
	<tbody>
		  <tr>  
		    <td>${item.id}</td>  
		    <td>${item.type}</td>  
		    <td>${item.floor}</td>
		    <td>${item.orientation}</td>
		    <td>${item.description}</td>
		    <td><input type="submit" name="allocateBtn" class="btn btn-default" value="分配" onclick="this.form.action='../../CheckinServlet?oid=${orderList[0].id}&rid=${item.id}';this.form.submit()"></td> 
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