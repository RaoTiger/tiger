<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<form action="addType.do" method="post">
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">商品类别</span>
  <input type="text" name="type" style="width:350px" class="form-control" placeholder="中文/English" aria-describedby="basic-addon1"><br />
  <input type="submit" value="添加" class="form-control" style="width:80px">
  </div>
  </form>
  </div>

</body>
</html>