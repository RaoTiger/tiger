<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<%String adminname = session.getAttribute("adminname").toString(); %>
</head>
<body>
<div class="container">
<form action="selectAdminNameAndId_Card.do" method="post">
<input type="hidden" value="<%=adminname %>" name="adminname">
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:100px">姓名</span>
  <input type="text" class="form-control"  style="width:180px"  name="nameValue">
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:100px">身份证号码</span>
  <input type="text" class="form-control" style="width:180px"  name="Id_CardValue">
</div>
<input type="submit" value="下一页" class="form-control" style="width:60px">
</form>
</div>
</body>
</html>