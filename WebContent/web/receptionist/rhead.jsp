<%@page import="dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="background-color: #dad9c7;">
    <div class="container-fluid">
    <div class="navbar-header" style="padding-left: 3%"> 
    	<a class="navbar-brand" href="/HotelManagementSystem/web/receptionist/rconsole.jsp" style="padding-top: 0%">
    		<img src="/HotelManagementSystem/img/logo-S.png" alt="logo"/>
    	</a>  
    </div>
    <div class="navbar-header"> 
        <a class="navbar-brand" href="/HotelManagementSystem/web/receptionist/rconsole.jsp">前台管理</a> 
    </div> 
    <div> 
        <ul class="nav navbar-nav navbar-left">
            <li><a href="/HotelManagementSystem/web/receptionist/rcheckin.jsp">预定入住</a></li>
			<li><a href="/HotelManagementSystem/web/receptionist/rcheckout.jsp">退房管理</a></li> 
			<li><a href="/HotelManagementSystem/web/main.jsp">快速预订</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right" style="padding-right: 1%">
			<li class="active"><a href="/HotelManagementSystem/web/receptionist/rcheckin.jsp">未处理订单 <span class="badge" style="background-color: #E00000;"> <% 
			OrderDao odao = new OrderDao();
			out.print(odao.getPreOrderNumber());
			%> </span></a></li>
			<form class="navbar-form navbar-right">
				<button type="button" class="btn btn-warning btn-sm" style="width: 80px; font-size: 14px;" onclick="window.location.href='/HotelManagementSystem/web/login.jsp?logout=true'">
					<span class="glyphicon glyphicon-log-out"></span> 注销
				</button>
			</form>
			
        </ul> 
    </div> 
    </div> 
</nav>
