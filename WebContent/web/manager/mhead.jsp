<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"> 
    <div class="container-fluid"> 
    <div class="navbar-header"> 
        <a class="navbar-brand" href="mconsole.jsp">经理</a> 
    </div> 
    <div> 
    	<ul class="nav navbar-nav"> 
    		<li><a href="accmgr.jsp">账号管理</a></li>
			<li><a href="addRooms.jsp">添加客房</a></li> 
         	<li><a href="addRoomTypes.jsp">添加客房类型</a></li> 
          	<li><a href="overall.jsp">房态统计</a></li>
          	<li><a href="../receptionist/rconsole.jsp">前台界面</a></li>
        </ul> 
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#">未处理订单 <span class="badge">3</span></a></li>
			<form class="navbar-form navbar-right">
				<button type="button" class="btn btn-default btn-sm" onclick="window.location.href='/HotelManagementSystem/web/login.jsp?logout=true'">
					注销</button>
			</form>
			
        </ul> 
    </div> 
    </div> 
</nav>