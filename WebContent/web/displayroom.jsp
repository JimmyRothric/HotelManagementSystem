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
<link rel="stylesheet" type="text/css" href="../css/element_style.css" />
<title>Details</title>
</head>
<body>
<%@ include file="head.jsp" %>
<form action="../RequirementServlet" method="post">
<div style="margin-top: 60px; margin-left: 150px; margin-right: 150px;">
<div class="container">
	<h3>请选择查询方式</h3><br/>
	<div class="row">
		<div class="col-md-2">
			<div class="row">
				房间类型
				<select class="form-control" style="width: 150px;" name="type">
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
			</div>
		</div>
		<div class="col-md-2">
			<div class="row">
				价格
				<select class="form-control" style="width: 150px;" name="price">
					<option value="0">ALL</option>
					<option value="1">0~200</option>
					<option value="2">201~500</option>
					<option value="3">501~1000</option>
					<option value="4">1001~2000</option>
				</select>
			</div>
		</div>
		<div class="col-md-2">
			<div class="row">
				<input type="submit" name="searchBtn" class="reserveBtn" style="border-radius: 2px; height: 33px; width: 150px; margin-top: 20px" value="查询">
			</div>
		</div>
	</div>
</div>
<br/>
	<table class="table table-hover">
		<thead>
			<tr>
				<td>房型</td>
				<td>房价</td>
				<td></td>
			</tr>
		</thead>
		<c:forEach var="t" varStatus="i" items="${sessionScope.typeList}">
		<tbody>
			<tr>
				<td><p style="margin-top: 10px;">${t.type}</p></td>
				<td><p style="margin-top: 10px;">￥${t.price}</p></td>
				<td><input type="submit" class="reserveBtn" name="reserveBtn" value="预订 " onclick="this.form.action='user/reservation.jsp?type=${t.type}';this.form.submit()"/></td>		
			</tr>
		</tbody>
	</c:forEach>
	</table>
	
</div>
</form>
</body>
</html>