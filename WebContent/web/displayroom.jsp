<%@page import="java.text.SimpleDateFormat"%>
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
<%
	if (session.getAttribute("checkin") == null || session.getAttribute("checkout") == null || session.getAttribute("typeList") == null) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		String today_str = sdf.format(c.getTime());
		Date today = sdf.parse(today_str);
		c.add(Calendar.DATE, 1);
		String tomorrow_str = sdf.format(c.getTime());
		Date tomorrow = sdf.parse(tomorrow_str);
		RoomTypeDao dao = new RoomTypeDao();
		ArrayList<RoomType> typesList = dao.selectByTime(today, tomorrow);
		session.setAttribute("typeList", typesList);
		session.setAttribute("checkin", today_str);
		session.setAttribute("checkout", tomorrow_str);
		session.setAttribute("days", 1);
	}
%>
<div style="margin-top: 60px; margin-left: 150px; margin-right: 150px;">
<div class="container">
	<h3>请选择查询方式</h3><br/>
	<div class="row">
		<div class="col-md-2">
			<div class="row">
				入住时间<br/>
				<input type="date" name="checkin" class="form-control" style="width: 150px;" value='${checkin}' readonly="true"><br/>
				房间类型
				<select class="form-control" style="width: 150px;" name="type" onchange="saveType()">
					<option value="">ALL</option>
						<%
							String selected_type = (String) session.getAttribute("type");
							RoomTypeDao rtd = new RoomTypeDao();
							ArrayList<RoomType> rtList = rtd.getRoomTypes();
							if (rtList != null){
								for (int i = 0; i < rtList.size(); i++){
									String type = rtList.get(i).getType();
									if (selected_type !=null && selected_type.equals(type)){
										out.print("<option value=\""+ type +"\" selected=\"selected\">"+ type +"</option>");
									}else{
										out.print("<option value=\""+ type +"\">"+ type +"</option>");
									}
								}
							}
						%>
				</select>
			</div>
		</div>
		<div class="col-md-2">
			<div class="row">
				离店时间<br/>
				<input type="date" name="checkout" class="form-control" style="width: 150px;" value='${checkout}' readonly="true"><br/>
				价格
			
				<select class="form-control" style="width: 150px;" name="price" >
				
					<%
					String str = (String) session.getAttribute("price");
					
					String[] strList = {"ALL","0~200","201~500","501~1000","1001~2000"}; 
					for (int i = 0; i < 4; i++){
						if (str != null && str.equals(String.valueOf(i))){
							out.print("<option value=\""+ i +"\" selected=\"selected\">"+strList[i] +"</option>");
						}else{
							out.print("<option value=\""+ i +"\">"+strList[i] +"</option>");
						}
						
					}
					%>
					<!--
					<option value="0">ALL</option>
					<option value="1">0~200</option>
					<option value="2">201~500</option>
					<option value="3">501~1000</option>
					<option value="4">1001~2000</option>-->
				</select>
			</div>
		</div>
		<div class="col-md-2">
			<div class="row">
				天数<br/>
				<input type="text" class="form-control" value= '${days}' style="width: 50px;" readonly="true"/> <br/>
				<button type="submit" name="searchBtn" class="searchBtn" style="border-radius: 2px; height: 33px; width: 150px; margin-top:20px;">
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