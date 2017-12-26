<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Order</title>
</head>
<body>
订单号：${order.id }<br/>
身份证号：${order.account_id }<br/>
房间类型：${order.room_type }<br/>
入住时间：${order.checkin }<br/>
离店时间：${order.checkout }<br/>
<b>总计：${order.price }¥</b><br/>
</body>
</html>