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

<form action = "../../CheckinServlet" method = "post">
<p>
身份证号：
<input type = "text"  name = "id">
<input type = "submit" name = "rsearchBtn" value = "查询">
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
<c:forEach items="${orderList}" var="item">  
		  <tr>  
		    <td>${item.id}</td>  
		    <td>${item.account_id}</td>  
		    <td>${item.room_id}</td>
		    <td>${item.room_type}</td>
		    <td>${item.checkin}</td>  
		    <td>${item.checkout}</td>  
		  </tr>  
</c:forEach>  
</table>
为订单${orderList[0].id}分配房间：<br/>
<table border="1" cellspacing="0px" class="td">
<th>id</th>
<th>type</th>
<th>floor</th>
<th>orientation</th>
<th>description</th>
<th>function</th>
<c:forEach items="${roomList}" var="item">  
		  <tr>  
		    <td>${item.id}</td>  
		    <td>${item.type}</td>  
		    <td>${item.floor}</td>
		    <td>${item.orientation}</td>
		    <td>${item.description}</td>
		    <td><input type = "submit" name = "allocateBtn" value = "分配" onclick="this.form.action='CheckinServlet?oid=${orderList[0].id}&rid=${item.id}';this.form.submit()"></td> 
		  </tr>  
</c:forEach>  

</table>

</c:if>
</form>
</body>
</html>