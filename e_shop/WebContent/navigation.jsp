<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
function getNavigation(){
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4){
			var data = xmlhttp.responseText;
			var adminObj = document.getElementById("adminId");
			var valueObj = document.getElementById("valueId");
			var dateObj = document.getElementById("dateId");
			var codeObj = document.getElementById("codeId");
			var dataArray = eval("("+data+")");
			codeObj.value = dataArray[0].id;
			adminObj.value = dataArray[0].admin_id;
			valueObj.value = dataArray[0].value;
			dateObj.value = dataArray[0].date;
		}
	};
	xmlhttp.open("post","selectNavi.do",true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(null);
}
</script>
</head>
<body onload="getNavigation()">
   <form action="updateNavigation.do" method="post">
           <input type="hidden" name="id" id="codeId"><br />
   管理员编号:<input type="text" name="admin_id" id="adminId"/><br />
   滚动条内容:<input type="text" name="value" id="valueId"/><br />
  修改时 &nbsp;间:<input type="date" name="date" id="dateId"/><br />
  <input type="submit" value="修改"/>
   </form>
</body>
</html>