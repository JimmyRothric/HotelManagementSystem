<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Order</title>
</head>

<body>
<c:if test="${account.group eq 'User'}">
<%@ include file="../head.jsp" %>
</c:if>
<c:if test="${account.group eq 'Receptionist'}">
<%@ include file="../receptionist/rhead.jsp" %>
</c:if>
<c:if test="${account.group eq 'Manager'}">
<%@ include file="../u-mhead.jsp" %>
</c:if>

<c:if test="${order eq null}">
	<c:redirect url = "../main.jsp"/>
</c:if>
<div style="margin-top: 100px; margin-left: 150px; margin-right: 150px; ">
<h5><big>订单号：</big>${order.id }</h5>
<h5><big>身份证号：</big>${order.account_id }</h5>
<h5><big>房间类型：</big>${order.room_type }</h5>
<h5><big>入住时间：</big>${order.checkin }</h5>
<h5><big>离店时间：</big>${order.checkout }</h5>
<h5><big>备注：</big>${order.demand }</h5>
<h3><b>总计：</b>￥${order.price }</h3>
</div>
<c:remove var = "order"/>
<%@ include file="../errorinfo.html" %>
</body>
</html>