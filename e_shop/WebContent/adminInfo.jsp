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
function getAdminInfo(){
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4){
			var data = xmlhttp.responseText;
			var dataArray = eval("("+data+")");
			var adminnameObj = document.getElementById("adminnameId");
			var passwordObj = document.getElementById("passwordId");
			var nameObj = document.getElementById("nameId");
			var Id_CardObj = document.getElementById("Id_CardId");
			var brithdayObj = document.getElementById("brithdayId");
			var sexObj = document.getElementById("sexId");
			var addressObj = document.getElementById("addressId");
			var calObj = document.getElementById("calId");
			for(var i = 0;i<dataArray.length;i++){
				adminnameObj.value = dataArray[i].adminname;
				passwordObj.value = "**********";
				nameObj.value = dataArray[i].name;
				Id_CardObj.value = "**********"+dataArray[i].Id_Card.substring(8,13);
				brithdayObj.value = dataArray[i].brithday;
				sexObj.value = dataArray[i].sex;
				addressObj.value = dataArray[i].address;
				calObj.value = dataArray[i].cal;
			}
		}
	};
	xmlhttp.open("post","selectAdminByadminname.do",true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	var admin = "<%=adminname%>";
	xmlhttp.send("admin="+admin);
}
</script>
</head>
<body onload="getAdminInfo()">
<div class="container">
<form action="updateAdminInfo.do" method="post">
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:85px">账号</span>
  <input type="text" class="form-control"  style="width:180px" readonly="readonly" id="adminnameId" name="adminname">
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:85px">密码</span>
  <input type="text" class="form-control" style="width:180px" readonly="readonly" id="passwordId" name="password">
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:85px">姓名</span>
  <input type="text" class="form-control" readonly="readonly" style="width:180px" id="nameId" name="name">
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:85px">身份证</span>
  <input type="text" class="form-control" readonly="readonly" style="width:180px" id="Id_CardId" name="Id_Card">
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:85px">出生日期</span>
  <input type="date" class="form-control" style="width:180px" id="brithdayId" name="brithday">
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:85px">性别</span>
  <input type="text" class="form-control" style="width:180px" id="sexId" name="sex">
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:85px">家庭住址</span>
  <input type="text" class="form-control" style="width:180px" id="addressId" name="address">
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1" style="width:85px">联系电话</span>
  <input type="text" class="form-control" style="width:180px" id="calId" name="cal">
</div>
<input type="submit" class="form-control" value="修改" style="width:50px"/>
</form>
</div>
</body>
</html>