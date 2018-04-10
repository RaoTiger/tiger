<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<script src="js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
<div style="width:100%;height:32px" class="bg-primary">
<span style="color:white;"><strong>当前轮播图</strong></span></div>
<div class="row">
  <div class="col-xs-6 col-md-3">
    <a href="#" class="thumbnail">
      <img src="image/one.jpg">
      <span>one.jsp</span>
 </a>
  </div>
    <div class="col-xs-6 col-md-3">
    <a href="#" class="thumbnail">
      <img src="image/two.jpg">
      <span>two.jsp</span>
    </a>
  </div>
    <div class="col-xs-6 col-md-3">
    <a href="#" class="thumbnail">
      <img src="image/three.jpg">
      <span>three.jsp</span>
    </a>
  </div>
</div>
<div class="row">
<form action="updateAdvertising.do" method="post" enctype="multipart/form-data">
<select class="btn btn-default dropdown-toggle" name="picture">
<option>one.jpg</option>
<option>two.jpg</option>
<option>three.jpg</option>
</select>
<input type="file" name="uFile" >
<input type="submit" value="修改" class="btn btn-default"/>
</form>
</div>


 </div>
    
</body>
</html>