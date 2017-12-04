<%@page import="dao.AccountDao"%>
<%@page import="data.*"%>
<%@page import="java.util.ArrayList"%>
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
<title>Account Management</title>
</head>
<body>
<form action = "AccountManagementServlet" method = "post">
 <input id="str" type="hidden" name= "targetString">
 <input id="uid" type="hidden" name= "targetId">
<%
	AccountDao dao = new AccountDao();
	ArrayList<Account> list = dao.getAccountList();

	if (!list.isEmpty()){
		out.print("<table border = \"1\">");
		out.print("<th>身份证号</th>");
		out.print("<th>密码</th>");
		out.print("<th>姓名</th>");
		out.print("<th>操作</th>");
		for (int i = 0; i < list.size(); i++){
			Account acc = list.get(i);
			out.print("<tr>");
			out.print("<td>" + acc.getId() + "</td>");
			out.print("<td>" + acc.getPassword() + "</td>");
			out.print("<td>" + acc.getName() + "</td>");
			out.print("<td>");
			out.print("<input type=\"submit\" name = \"cp\" value=\"修改密码\" onclick = \"changePw();document.getElementById('uid').value = "+ acc.getId()  +";\"/>");
			out.print("<input type=\"submit\" name = \"cn\" value=\"修改姓名\" onclick = \"changeNm();document.getElementById('uid').value = "+ acc.getId()  +";\"/>");
			out.print("<input type=\"submit\" name = \"dl\" value=\"删除\" onclick = \"document.getElementById('uid').value = "+ acc.getId()  +";\"/>");
			out.print("</td>");
			out.print("</tr>");
			
		}
		out.print("</table>");
	}else{
		out.print("未找到相关数据");
	}
	
%>
</form>
</body>
</html>