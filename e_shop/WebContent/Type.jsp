<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
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
				var divObj = document.createElement("div");
				var spanObj = document.createElement("span");
				var inputObj = document.createElement("span");
				
				divObj.className = "input-group";
				
				spanObj.className="input-group-addon";
				spanObj.idName="basic-addon1";
				spanObj.innerText = dataArray[i].id;
				spanObj.style.width="52px";
				
				inputObj.className="form-control";
				//inputObj.type="text";
				inputObj.value = dataArray[i].type;
				inputObj.innerText = dataArray[i].type;
			    inputObj.style.width="180px";
				
				divObj.appendChild(spanObj);
				divObj.appendChild(inputObj);
				typeObj.appendChild(divObj);
			}
		}
	};
	xmlhttp.open("post","selectType.do",true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(null);
}
</script>
</head>
<body onload="getType()">
<div class="container">
<form action="" method="post">
<div class="input-group" id="typeId">
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:52px">编号</span>
  <input  class="form-control" value="类别" readonly="readonly" style="width:180px"><br />
</div>
</div>
<div class="input-group">
<input type="submit" class="form-control" value="修改" style="width:80px"><br />
</div>

</form>
</div>
</body>
</html>