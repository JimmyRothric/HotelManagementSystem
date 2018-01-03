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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../css/element_style.css" />
<script src="../../js/isvalid.js"></script>
<title>Check out</title>
</head>
<body>
<c:if test="${account.group eq 'Manager'}">
<%@ include file="r-mhead.jsp" %>
</c:if>
<c:if test="${account.group eq 'Receptionist'}">
<%@ include file="rhead.jsp" %>
</c:if>
<form action = "../../CheckoutServlet" onsubmit="return isValid();" method="post">
<input id="str" type="hidden" name= "checkout_time">
<div style="margin-top: 100px; margin-left: 150px; margin-right: 150px;">
<h3>退房管理</h3>
<p>
<div class="container">
	<div class="row" style="margin-top: 5px">
		<div class="col-md-2">
			<h4>身份证号：</h4>
			<input type="text" class="form-control" style="height: 33px; width: 200px;" name="id" id="number">
		</div>
		<div class="col-md-2">
			<button type="submit" name="searchBtn" class="searchBtn" style="margin-left: 20px;margin-top: 40px;">
				<span class="glyphicon glyphicon-search"></span> 查询
			</button>
		</div>
	</div>
</div>
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
		    <td><p style="margin-top: 10px;">${item.id}</p></td>  
		    <td><p style="margin-top: 10px;">${item.account_id}</p></td>  
		    <td><p style="margin-top: 10px;">${item.room_id}</p></td>
		    <td><p style="margin-top: 10px;">${item.room_type}</p></td>
		    <td><p style="margin-top: 10px;">${item.checkin}</p></td>  
		    <td><p style="margin-top: 10px;">${item.checkout}</p></td> 
		    <td><p style="margin-top: 10px;">￥${item.price}</p></td> 
		    <td><p style="margin-top: 10px;">${item.demand}</p></td>
		    <td><table>
		    	<tr>
		    		<td><input type="submit" name="updateInfoBtn" class="btn btn-warning" value="更新退房时间" onclick="changeCheckOut();this.form.action='../../CheckoutServlet?oid=${item.id}';this.form.submit()"></td>
		        	<td><input type="submit" name="checkoutBtn" class="btn btn-danger" value="退房" style="width: 120px; margin-left: 10px" onclick="this.form.action='../../CheckoutServlet?oid=${item.id}&rid=${item.room_id}';this.form.submit()"></td> 
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