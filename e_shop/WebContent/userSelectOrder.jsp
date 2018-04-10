<%@page import="com.hzyc.e_shop.bean.NoOrder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%List<NoOrder> list = (ArrayList)request.getAttribute("list"); %>

</head>
<body>
<table border="1">
<tr>
<td>编号</td>
<td>用户名</td>
<td>商品编号</td>
<td>数量</td>
<td>价格</td>
<td>地址</td>
<td>状态</td>
<td>编辑</td>
</tr>
<%for(int i = 0;i<list.size();i++){ %>
<tr>
<td><%=list.get(i).getId() %></td>
<td><%=list.get(i).getUsername() %></td>
<td><%=list.get(i).getCommodity_id() %></td>
<td><%=list.get(i).getNumber() %></td>
<td><%=list.get(i).getPrice() %></td>
<td><%=list.get(i).getAddress() %></td>
<td><%=list.get(i).getState() %></td>
<td><a href="#">退单</a>|<a href="#">评论</a></td>
</tr>
<%} %>
</body>
</html>