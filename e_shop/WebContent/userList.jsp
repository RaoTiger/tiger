<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户中心</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<script src="js/bootstrap.min.js"></script>
<%String username = session.getAttribute("username").toString(); %>
</head>
<body>
<div class="container">
<ul class="nav nav-pills nav-stacked">
			<li role="presentation" class="active"><a href="selectUserInfo.do?username=<%=username %>" target="BottomRightFrame">信息管理</a></li>
  			<li role="presentation" class="active"><a href="selectNoOrderByUsername.do?username=<%=username %>" target="BottomRightFrame">订单查询</a></li>
  			<li role="presentation" class="active"><a href="buyCar.jsp" target="BottomRightFrame">购物车</a></li> 
	        <li role="presentation" class="active"><a href="vaildUserNameAndId_Card.jsp" target="BottomRightFrame">修改密码</a></li>
		</ul>
</div>
</body>
</html>