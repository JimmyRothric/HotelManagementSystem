<%@page import="dao.AccountDao"%>
<%@page import="data.*"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function changePw(){
	var pw=prompt("密码修改为?");
	document.getElementById("str").value = pw;
}
function changeNm(){
	var nm=prompt("姓名修改为?");
	document.getElementById("str").value = nm;
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../css/element_style.css" />
<title>Account Management</title>
</head>
<body>
<%@ include file="mhead.jsp" %>

<form action = "../../AccountManagementServlet" method="post">
<div style="margin-top: 100px; margin-left: 150px; margin-right: 150px;">
<input id="str" type="hidden" name="targetString">
<input id="uid" type="hidden" name="targetId">

<%
	AccountDao dao = new AccountDao();
	request.setAttribute("accList", dao.getAccountList());
%>	
		<c:if test= "${accList == null || accList.isEmpty()}">
		没有账号数据
		</c:if>
		<c:if test = "${accList != null && !accList.isEmpty()}">
		<table class="table table-bordered table-hover" style="text-align:center">
		<thead>
		<tr>
			<td>身份证号</td>
			<td>密码</td>
			<td>姓名</td>
			<td>类别</td>
			<td>修改密码</td>
			<td>修改姓名</td>
			<td>删除账号</td>
		</tr>
		</thead>
		<c:forEach items="${accList}" var="item">  
		<tbody>
		  <tr>  
		    <td>${item.id}</td>  
		    <td>${item.password}</td>  
		    <td>${item.name}</td>  
		    <td>${item.group}</td> 
		    <td><input type="submit" name="cp" value="修改密码" class="managerBtn" onclick="changePw();document.getElementById('uid').value = ${item.id}"></td>
		    <td><input type="submit" name="cn" value="修改姓名" class="managerBtn" onclick="changeNm();document.getElementById('uid').value = ${item.id}"></td>
		    <td><input type="submit" name="dl" value="删除账号" class="btn btn-danger" style="margin-top: 4px; height: 30px; width: 100px;" onclick="document.getElementById('uid').value = ${item.id}"></td>
		  </tr>  
		  </tbody>
		</c:forEach> 
		</table>
		</c:if>
</div>
</form>
</body>
</html>