<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../css/element_style.css" />
<script src="../../js/isvalid.js"></script>
<title>Reservations Check In</title>
</head>
<body>
<c:if test="${account.group eq 'Manager'}">
<%@ include file="r-mhead.jsp" %>
</c:if>
<c:if test="${account.group eq 'Receptionist'}">
<%@ include file="rhead.jsp" %>
</c:if>
<form action = "../../CheckinServlet" onsubmit="return isValid();" method="post">
<div style="margin-top: 100px; margin-left: 150px; margin-right: 150px;">
<h3>预订入住</h3>
<p>
<div class="container">
	<div class="row" style="margin-top: 5px">
		<div class="col-md-2">
			<h4>身份证号</h4>
			<input type="text" class="form-control" style="height: 33px; width: 200px;" name="id" id="number">
		</div>
		<div class="col-md-2">
			<button type="submit" name="rsearchBtn" class="searchBtn" style="margin-left: 20px;margin-top: 40px;">
				<span class="glyphicon glyphicon-search"></span> 查询
			</button>
		</div>
	</div>
</div>
</p>

<c:if test = "${orderList ne null}"> 
订单表<br/>
<table class="table table-bordered table-hover" style="text-align:center">
	<thead>
		<tr>
			<td>Oid</td>
			<td>Uid</td>
			<td>type</td>
			<td>checkin</td>
			<td>checkout</td>
			<td>demand</td>
			<td>function</td>
		</tr>
	</thead>
	<c:forEach items="${orderList}" var="item"> 
	<tbody>  
		  <tr>  
		    <td><p style="margin-top: 10px;">${item.id}</p></td>  
		    <td><p style="margin-top: 10px;">${item.account_id}</p></td>  
		    <td><p style="margin-top: 10px;">${item.room_type}</p></td>
		    <td><p style="margin-top: 10px;">${item.checkin}</p></td>  
		    <td><p style="margin-top: 10px;">${item.checkout}</p></td>
		    <td><p style="margin-top: 10px;">${item.demand}</p></td>
		    <td><button type="submit" name="deleteBtn" class="btn btn-danger" style="margin-top: 3px;" onclick="this.form.action='../../CheckinServlet?oid=${item.id}';this.form.submit()">
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
		    <td><p style="margin-top: 10px;">${item.id}</p></td>  
		    <td><p style="margin-top: 10px;">${item.type}</p></td>  
		    <td><p style="margin-top: 10px;">${item.floor}</p></td>
		    <td><p style="margin-top: 10px;">${item.orientation}</p></td>
		    <td><p style="margin-top: 10px;">${item.description}</p></td>
		    <td><input type="submit" name="allocateBtn" class="btn btn-default" value="分配" style="height: 30px; width: 120px; margin-top: 3px; padding-top: 3px" onclick="this.form.action='../../CheckinServlet?oid=${orderList[0].id}&rid=${item.id}';this.form.submit()"></td> 
		  </tr>  
	</tbody>
	</c:forEach>
</table>

</c:if>
<c:remove var="orderList"/>
</div>
<c:if test="${errorInfo ne null}">
	<script language="javascript">
		alert('${errorInfo}');
	</script>
	<c:remove var = "errorInfo"/>
</c:if>
</form>
</body>
</html>