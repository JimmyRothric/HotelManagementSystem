<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trump Hotel</title>
</head>
<body>
<form action='' method='post'>
请选择查询方式：
<input type ="radio" name  = "choice" value = "1">房间类型
<input type ="radio" name  = "choice" value = "2">房价
<input type ="radio" name  = "choice" value = "3">时间
<br/>
请输入关键字：
<input type = "text" name = "text">
<input type = "submit" name = "searchButton" value = "查询">
<br/>
</form>
</body>
</html>