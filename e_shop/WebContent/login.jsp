<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<title>注册</title>
<script type="text/javascript">
function ValidUserName(){
	var userObj = document.getElementById("userID").value;
	var userLen = userObj.length;
	if(userLen <6 || username > 16){
		var userSpanObj = document.getElementById("userSpanId");
		userSpanObj.innerHTML = "<font color='red' size='2'>用户名长度为6-16</font>";
	}else{
		var xmlHttp = new XMLHttprequest();
		xmlHttp.onreadystatechange = function(){
			if(xmlHttp.readyState == 4){
				
			}
		};
		xmlHttp.open();
	}
}
</script>
</head>
<body>
<div class="container">
<form action="addUser.do" method="post">
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">用户名</span>
  <input type="text" style="width:350px" class="form-control" placeholder="Username" aria-describedby="basic-addon1" id="userID" name="username"  onblur="ValidUserName()">
  <span id="userSpanId"></span><img id="userImgId"/><br />
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">密码 </span>
  <input type="password" style="width:350px" class="form-control" placeholder="password" aria-describedby="basic-addon1" id="passID" name="password"  onblur="VaildPassword()">
  <span id="passSpanId"></span><img id="passImgId"/><br />
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">姓名</span>
  <input type="text" name="name" style="width:350px" class="form-control" placeholder="中文/English" aria-describedby="basic-addon1"  name="name">
  <br />
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">身份证号</span>
  <input type="text" style="width:350px" class="form-control" placeholder="Id_Card" aria-describedby="basic-addon1" id="Id_CardID" name="Id_Card" onblur="VaildId_Card()">
  <span id="Id_CardSpanId"></span><br />
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">性别</span>
  <input type="radio"   value="男" name="sex">男
  <input type="radio"   value="女" name="sex">女
  <br />
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">常用邮箱</span>
  <input type="text" style="width:350px" class="form-control" placeholder="e_mail" aria-describedby="basic-addon1"  name="e_mail">
<br />
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">出生日期</span>
  <input type="date" style="width:350px" class="form-control" placeholder="brithday" aria-describedby="basic-addon1"  name="brithday">
<br />
</div>

<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:80px">联系电话</span>
  <input type="text" style="width:350px" class="form-control" placeholder="cal" aria-describedby="basic-addon1"  name="cal">
<br />
</div>
<input type="submit" value="下一页">
</form>
</div>
</body>
</html>