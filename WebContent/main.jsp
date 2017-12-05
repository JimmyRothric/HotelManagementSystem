<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trump Hotel</title>
</head>
<body>
<form action="QueryServlet" method="post">
请选择查询方式：<br/>
房间类型
<select name="type">
<option value="0">单人间</option>
<option value="1">双人间</option>
<option value="2">商务间</option>
<option value="3">套间</option>
<option value="4">总统套房</option>
</select>
价格
<select name="price">
<option value="0"></option>
<option value="1">0~200</option>
<option value="2">200~500</option>
<option value="3">500~1000</option>
<option value="4">1000~2000</option>
</select>
时间
<input type="date" name="arrive" min="2017-12-04">
<input type="date" name="depart" min="2017-12-04">
<br/>
请输入关键字：
<input type = "text" name = "text">
<input type = "submit" name = "searchButton" value = "查询">
<br/>
</form>
</body>
</html>