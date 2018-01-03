<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Review</title>
<link rel="stylesheet" type="text/css" href="../../css/element_style.css" />
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
<link href="css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
<script src="js/star-rating.js" type="text/javascript"></script>
</head>
<body>
<%@ include file="../head.jsp" %>
<% 
	String order = request.getParameter("oid");
	String account = request.getParameter("acc_id");
	String type = request.getParameter("type");

%>

<form action="../../ReviewServlet" method="post">
<div class="container" style="margin-top: 100px;margin-left: 200px; margin-right: 150px;">
	<div class="row" style="margin-top: 60px">
		<div class="col-md-2">
		</div>
		<div class="col-md-2">
			<textarea name="rate" class="form-control" rows="1" style="height: 30px; width: 400px; resize: none;" /></textarea>
			<textarea name="comment" class="form-control" rows="3" style="height: 100px; width: 400px; resize: none;" /></textarea>
			<br/>
			<input type="submit" value="提交 " class="searchBtn" onclick="this.form.action='../../ReviewServlet?oid=<%=order%>&acc_id=<%=account%>&type=<%=type%>';this.form.submit()"/>
			
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>	

</form>
<script>
    jQuery(document).ready(function () {
        $(".rating-kv").rating();
    });
</script>

</body>
</html>