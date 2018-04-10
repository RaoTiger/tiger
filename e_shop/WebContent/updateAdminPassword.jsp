<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<%String adminname = session.getAttribute("adminname").toString(); %>
<script type="text/javascript">
function vaildPasswordOne(){
	var passwordOneValue = document.getElementById("passwordOne").value;

    var passwordOneLength =  passwordOneValue.length;

	var spanOneObj = document.getElementById("spanOneId");
	if(passwordOneValue == ""){
		spanOneObj.innerHTML = "<font color='red' size='2'>请输入密码</font>";
	}
	if(passwordOneLength < 6 || passwordOneLength > 16){
		spanOneObj.innerHTML = "<font color='red' size='2'>密码长度为6-16位</font>";
	}else{
		var imgOneObj = document.getElementById("imgOneId");
		 imgOneObj.src = "image/duihao.png";
		  imgOneObj.style.width = "10px";
		  imgOneObj.style.height = "10px";
	}
}
function vaildPassword(){
	
	var passwordOneValue = document.getElementById("passwordOne").value;
	var passwordTwoValue = document.getElementById("passwordTwo").value;
	
	if(passwordOneValue!=passwordTwoValue){
		var spanObj = document.getElementById("spanId");
		spanObj.innerHTML = "<font color='red' size='2'>两次密码不一致</font>";
	}else{
		
	}
}
</script>
</head>
<body>
<div class="container">
<form action="updateAdminPassword.do" method="post">
<input type="hidden" value="<%=adminname %>" name="adminname">
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:120px" >输入新密码</span>
  <input type="password" id="passwordOne" class="form-control"  style="width:180px" onblur="vaildPasswordOne()">
  <span id="spanOneId"></span>
  <img id="imgOneId"/>
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:120px">再次输入密码</span>
  <input type="password" id="passwordTwo" class="form-control" style="width:180px"  name="password" onblur="vaildPassword()">
  <span id="spanId"></span>
</div>
<input type="submit" value="确定" class="form-control" style="width:60px">
</form>
</div>
</body>
</html>