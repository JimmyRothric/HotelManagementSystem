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
<%@ include file = "head.jsp" %>
<form action="RequirementServlet" method="post">
<div style="float:right">
<button onclick="this.form.action='main.jsp';this.form.submit()">返回</button>
</div>

请选择查询方式：<br/>
房间类型
<select name="type">
<option value="">ALL</option>
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
<option value="0">ALL</option>
<option value="1">0~200</option>
<option value="2">201~500</option>
<option value="3">501~1000</option>
<option value="4">1001~2000</option>
</select>
<input type="submit" name="searchBtn" value="查询">

<table border="0" cellspacing="0px" class="td">
	<tr>
		<td>房型</td>
		<td>房价</td>
		<td></td>
	</tr>
<c:forEach var="t" varStatus="i" items="${sessionScope.typeList}">
	<tr>
		<td>${t.type}</td>
		<td>${t.price}</td>
		<td><input type="submit" class="reserveBtn" name="reserveBtn" value="预订 " onclick="this.form.action='reservation.jsp?type=${t.type}';this.form.submit()"/></td>		
	</tr>
</c:forEach>
</table>
</form>
</body>
</html>