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

<link rel="stylesheet" type="text/css" href="css/element_style.css" />

<title>Details</title>
</head>
<body>
<form action="" method="post">
请选择查询方式：<br/>
房间类型
<select name="type">
		<%
			RoomTypeDao rtd = new RoomTypeDao();
			ArrayList<RoomType> rtList = rtd.getRoomTypes();
			if (rtList != null){
				for (int i = 0; i < rtList.size(); i++){
					String type = rtList.get(i).getType();
					out.print("<option value=\""+ type +"\">"+ type +"</option>");
				}
			}
		%>
</select>
价格
<select name="price">
<option value="0"></option>
<option value="1">0~200</option>
<option value="2">200~500</option>
<option value="3">500~1000</option>
<option value="4">1000~2000</option>
</select>


<table border="0" cellspacing="0px" class="td">
	<tr>
		<td>房型</td>
		<td>房格</td>
		<td></td>
	</tr>
<c:forEach var="t" varStatus="i" items="${sessionScope.typeList}">
	<tr>
		<td>${t}</td>
		<td>${sessionScope.roomMap[t]}</td>
		<td><input type="submit" name="reserveBtn" value="预订 " onclick="this.form.action='reservation.jsp?type=${t}';this.form.submit()"/></td>		
	</tr>
</c:forEach>
</table>
</form>
</body>
</html>