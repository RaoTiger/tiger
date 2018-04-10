<%@page import="com.hzyc.e_shop.bean.Commodity"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%List<Commodity> list = (ArrayList)request.getAttribute("list"); %>
</head>
<body>
<div class="container">
<form action="adminUpdateCommodity.do" method="post">
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">编号</span>
  <input type="text" readonly="readonly" value="<%=list.get(0).getId() %>" name="id" style="width:350px" class="form-control" aria-describedby="basic-addon1"><br />
  
  </div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">名称</span>
  <input type="text" value="<%=list.get(0).getName() %>" name="name" style="width:350px" class="form-control" aria-describedby="basic-addon1"><br />
  
  </div>
  <div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">类别编号</span>
  <input type="text" value="<%=list.get(0).getType() %>" name="type" style="width:350px" class="form-control" aria-describedby="basic-addon1"><br />
  
  </div>
  <div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">类别</span>
  <input type="text" value="<%=list.get(0).getTypename() %>" name="typename" style="width:350px" class="form-control" aria-describedby="basic-addon1"><br />

  </div>
  <div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">品牌</span>
  <input type="text" value="<%=list.get(0).getTrademark() %>" name="trademark" style="width:350px" class="form-control" aria-describedby="basic-addon1"><br />
  
  </div>
  <div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">数量</span>
  <input type="text" value="<%=list.get(0).getNumber() %>" name="number" style="width:350px" class="form-control" aria-describedby="basic-addon1"><br />
 
  </div>
  <div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">价格</span>
  <input type="text" value="<%=list.get(0).getPrice() %>" name="price" style="width:350px" class="form-control" aria-describedby="basic-addon1"><br />
  
  </div>
  <div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">打折</span>
  <input type="text" value="<%=list.get(0).getDiscount() %>" name="discount" style="width:350px" class="form-control" aria-describedby="basic-addon1"><br />
  
  </div>
  <div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">图片</span>
  <input type="text" value="<%=list.get(0).getImg() %>" name="img" style="width:350px" class="form-control" aria-describedby="basic-addon1"><br />
  
  </div>
  <div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">描述</span>
  <input type="text" value="<%=list.get(0).getDepict() %>" name="depict" style="width:350px" class="form-control" aria-describedby="basic-addon1"><br />
  
  </div>
  <input type="submit" value="修改" class="form-control" style="width:80px">
</form>
</div>
</body>
</html>