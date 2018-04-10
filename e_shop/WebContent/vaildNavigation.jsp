<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%boolean bool = request.getAttribute("bool").equals(true); %>
<%if(bool){ %>
<script type="text/javascript">
alert("修改成功!");
location = "navigation.jsp";
</script>
<%}else { %>
<script type="text/javascript">
alert("修改失败!");
location = "navigation.jsp";
</script>
<%} %>
</head>
<body>

</body>
</html>