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
<link rel="stylesheet" type="text/css" href="css/element_style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account Management</title>
</head>
<body>
<form action = "AccountManagementServlet" method = "post">
 <input id="str" type="hidden" name= "targetString">
 <input id="uid" type="hidden" name= "targetId">
<%
	AccountDao dao = new AccountDao();
	request.setAttribute("accList", dao.getAccountList());
%>	
		<c:if test= "${accList == null || accList.isEmpty()}">
		没有账号数据
		</c:if>
		<c:if test = "${accList != null && !accList.isEmpty()}">
		<table border="1" cellspacing="0px" class="td">
		<th>身份证号</th>
		<th>密码</th>
		<th>姓名</th>
		<th>类别</th>
		<th>修改密码</th>
		<th>修改姓名</th>
		<th>删除账号</th>
		<c:forEach items="${accList}" var="item">  
		  <tr>  
		    <td>${item.id}</td>  
		    <td>${item.password}</td>  
		    <td>${item.name}</td>  
		    <td>${item.group}</td> 
		    <td><input type="submit" name = "cp" value="修改密码" onclick = "changePw();document.getElementById('uid').value = ${item.id}"></td>
		    <td><input type="submit" name = "cn" value="修改姓名" onclick = "changeNm();document.getElementById('uid').value = ${item.id}"></td>
		    <td><input type="submit" name = "dl" value="删除账号" onclick = "document.getElementById('uid').value = ${item.id}"></td>
		  </tr>  
		</c:forEach>  
		</table>
		</c:if>
</form>
</body>
</html>