<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div style="float:right">
<c:if test = "${account.id eq null}">
<a href="login.jsp">登录</a>|
<a href="register.jsp">注册</a>
</c:if>
<c:if test = "${account.id ne null}">
<a href="personal_homepage.jsp" target="_blank">${account.id}</a>|
<a href="login.jsp">注销</a>
</c:if>
</div>
