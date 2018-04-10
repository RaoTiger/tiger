<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加商品</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
function getType(){
	var xmlhttp = new XMLHttpRequest();
	var typeObj = document.getElementById("typeId");
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4){
			var data = xmlhttp.responseText;
			var dataArray = eval("("+data+")");
			for(var i = 0;i<dataArray.length;i++){
				var optionObj = document.createElement("option");
				optionObj.value=dataArray[i].id;
				optionObj.innerText = dataArray[i].type;
				typeObj.appendChild(optionObj);
			}
		}
	};
	xmlhttp.open("post", "selectType.do",true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(null);
}
function getDiscount(){
	var discountValue = document.getElementById("discountId").value;
	var discountObj = document.getElementById("discountID");
	discountObj.value = discountValue;
}
</script>
</head>
<body onload="getType()">
<div class="container">
<form action="addCommodity.do" method="post" enctype="multipart/form-data">
<div class="input-group">
  <span class="input-group-addon" style="width:80px">商品名</span>
  <input type="text" name="name" style="width:350px" class="form-control" aria-describedby="basic-addon1"><br />
</div>
<div class="input-group">
<span class="input-group-addon" style="width:80px">商品类别</span>
<select id="typeId" class="form-control" style="width:350px" name="type"></select>
</div>
<div class="input-group">
  <span class="input-group-addon" style="width:80px">类别名</span>
  <input type="text" name="typename" style="width:350px" class="form-control" aria-describedby="basic-addon1"><br />
</div>
<div class="input-group">
  <span class="input-group-addon" style="width:80px">品牌</span>
  <input type="text" name="trademark" style="width:350px" class="form-control" aria-describedby="basic-addon1"><br />
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">数量</span>
  <input type="text" name="number" style="width:350px" class="form-control" aria-describedby="basic-addon1"><br />
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">价格</span>
  <input type="text" name="price" style="width:350px" class="form-control" aria-describedby="basic-addon1"><br />
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">打折</span>
  <select id="discountId" class="form-control" onchange="getDiscount()" style="width:350px">
  <option>1</option>
  <option>2</option>
  <option>3</option>
  <option>4</option>
  <option>5</option>
  <option>6</option>
  <option>7</option>
  <option>8</option>
  <option>9</option>
  <option>0</option>
</select>
  <input type="text" name="discount" style="width:350px" class="form-control" aria-describedby="basic-addon1" id="discountID"><br />
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">图片</span>
  <input type="file" name="uPicture" style="width:350px" class="form-control" aria-describedby="basic-addon1"><br />
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">描述</span>
  <input type="text" name="depict" style="width:350px" class="form-control" aria-describedby="basic-addon1"><br />
</div>
<div class="input-group">
  
  <input type="submit" value="添加"  class="form-control" aria-describedby="basic-addon1"><br />
</div>
</form>
</div>
</body>
</html>