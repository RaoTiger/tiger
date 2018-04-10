<%@page import="com.hzyc.e_shop.bean.Commodity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品管理</title>
<%List<Commodity> list = (ArrayList)request.getAttribute("list"); %>
</head>
<body>
<table border="1">
<tr>
<td>编号</td>
<td>名称</td>
<td>类别编号</td>
<td>类名</td>
<td>品牌</td>
<td>数量</td>
<td>价格</td>
<td>打折</td>
<td>图片</td>
<td>描述</td>
<td>编辑</td>
</tr>

<%for(int i = 0;i<list.size();i++){ 
%>
<tr>
<td><%=list.get(i).getId() %></td>
<td><%=list.get(i).getName() %></td>
<td><%=list.get(i).getType() %></td>
<td><%=list.get(i).getTypename() %></td>
<td><%=list.get(i).getTrademark() %></td>
<td><%=list.get(i).getNumber() %></td>
<td><%=list.get(i).getPrice() %></td>
<td><%=list.get(i).getDiscount() %></td>
<td><%=list.get(i).getImg()%></td>
<td><%=list.get(i).getDepict() %></td>
<td><a href="adminSelectCommodity.do?id=<%=list.get(i).getId() %>">修改</a>|<a href="#">删除</a></td>
</tr>
<%} %>

</table>
</body>
</html>