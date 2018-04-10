<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%boolean bool = request.getAttribute("bool").equals(true); 
if(bool){
%>
<script type="text/javascript">
alert("添加成功!");
location="addCommodity.jsp";
</script>
<%} else{%>
<script type="text/javascript">
alert("添加失败!");
location="addCommodity.jsp";
</script>
<%} %>
</head>
<body>

</body>
</html>