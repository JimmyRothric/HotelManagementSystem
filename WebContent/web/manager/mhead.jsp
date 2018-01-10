<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../../css/element_style.css" />
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.navbar {background-color: #154488;}
.navbar .nav > li > a{color: #ffffff;}
</style>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation"> 
    <div class="container-fluid"> 
    <div class="navbar-header" style="padding-left: 3%"> 
    	<a class="navbar-brand" href="/HotelManagementSystem/web/manager/mconsole.jsp" style="padding-top: 3%">
    		<img src="/HotelManagementSystem/img/logo-S.png" alt="logo"/>
    	</a>  
    </div> 
     <div class="navbar-header"> 
        <a class="navbar-brand" style="color: #ffffff;" href="/HotelManagementSystem/web/manager/mconsole.jsp">经理</a> 
    </div> 
    <div> 
    	<ul class="nav navbar-nav"> 
    		<li><a href="/HotelManagementSystem/web/manager/accmgr.jsp">账号管理</a></li>
			<li><a href="/HotelManagementSystem/web/manager/addRooms.jsp">添加客房</a></li> 
         	<li><a href="/HotelManagementSystem/web/manager/addRoomTypes.jsp">添加客房类型</a></li> 
          	<li><a href="/HotelManagementSystem/web/manager/overall.jsp">房态统计</a></li>
          	<li><a href="/HotelManagementSystem/web/receptionist/rconsole.jsp">前台界面</a></li>
        </ul> 
		<ul class="nav navbar-nav navbar-right" style="padding-right: 1%">
			<!--  <li><a href="#">未处理订单 <span class="badge">3</span></a></li>-->
			<form class="navbar-form navbar-right">
				<button type="button" class="btn btn-default" style="width: 80px; background-color: #000000; font-size: 14px; color: white;" onclick="window.location.href='/HotelManagementSystem/web/login.jsp?logout=true'">
					<span class="glyphicon glyphicon-log-out"></span> 注销
				</button>
			</form>
			
        </ul> 
    </div> 
    </div> 
</nav>