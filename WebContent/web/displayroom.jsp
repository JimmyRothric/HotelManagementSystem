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
<body background="../img/grey-bg.png">
<c:if test="${account.group ne 'Receptionist' && account.group ne 'Manager'}">
<%@ include file="head.jsp" %>
</c:if>
<c:if test="${account.group eq 'Receptionist'}">
<%@ include file="receptionist/rhead.jsp" %>
</c:if>
<c:if test="${account.group eq 'Manager'}">
<%@ include file="u-mhead.jsp" %>
</c:if>

<form action="../RequirementServlet" method="post">
<div style="margin-top: 60px; margin-left: 150px; margin-right: 150px;">
<div class="container">
	<h3>请选择查询方式</h3><br/>
	<div class="row">
		<div class="col-md-2">
			<div class="row">
				入住时间<br/>
				<input type="date" name="checkin" class="form-control" style="width: 150px;" value=${checkin} readonly="true"><br/>
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
				离店时间<br/>
				<input type="date" name="checkout" class="form-control" style="width: 150px;" value=${checkout} readonly="true"><br/>
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
				<input type="text" class="form-control" value="0" style="width: 50px; margin-top:20px;" readonly="true"/> <br/>
				<button type="submit" name="searchBtn" class="searchBtn" style="border-radius: 2px; height: 33px; width: 150px; margin-top: 20px">
					<span class="glyphicon glyphicon-search"></span> 查询
				</button>
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
		<c:if test="${sessionScope.typeList eq null }">
			<%	
				Calendar c = Calendar.getInstance();
				Date today = c.getTime();
				c.add(Calendar.DATE, 1);
				Date tomorrow = c.getTime();
				RoomTypeDao dao = new RoomTypeDao();
				ArrayList<RoomType> typesList = dao.selectByTime(today, tomorrow);
				session.setAttribute("checkin", today);
				session.setAttribute("checkout", tomorrow);
				session.setAttribute("typeList", typesList);
			%>
		</c:if>
		<c:forEach var="t" varStatus="i" items="${sessionScope.typeList}">
		<tbody>
			<tr>
				<td><p style="margin-top: 10px;"><a href = "show_review.jsp?room_type=${t.type}">${t.type}</a></p></td>
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