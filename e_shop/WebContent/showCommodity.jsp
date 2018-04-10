<%@page import="com.google.gson.Gson"%>
<%@page import="com.hzyc.e_shop.bean.Commodity"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
<%List<Commodity> list = (ArrayList)request.getAttribute("value");
String a = list.get(0).getId();
Gson g = new Gson();
String value = g.toJson(list);
%>
<script type="text/javascript">
var page = 1;
function showCommodity(){
	var data = '<%=value%>';
	var dataArray = eval("("+data+")");
	var commodityObj = document.getElementById("commodityId");
	var divRowObj = document.createElement("div");
	commodityObj.appendChild(divRowObj);
	
	for(var i = 0;i<dataArray.length;i++){
		if(i%2 == 0){
			var divRowObj = document.createElement("div");
			commodityObj.appendChild(divRowObj);
		}
		var divOne = document.createElement("div");
		divOne.className = "col-sm-6 col-md-4";
		
		var divTwo = document.createElement("div");
		divTwo.className = "thumbnail";
		
		var comImgObj = document.createElement("img");
		comImgObj.src= "image/"+dataArray[i].img;
		comImgObj.style.width="280px";
		comImgObj.style.height="280px";
		
		var divThree = document.createElement("div");
		divThree.className = "caption";
		
		divThree.innerHTML = "<p><font color='red' size='5'>"+dataArray[i].price+"</font><p><P><a href='selectCommodityById.do?id="+dataArray[i].id+"'>"+dataArray[i].depict+"</a></p><p><a href='#' class='btn btn-primary' role='button'>"+dataArray[i].typename+"</a> <a href='#' class='btn btn-default'>"+dataArray[i].trademark+"</a></p>";
		
		divTwo.appendChild(comImgObj);
		divTwo.appendChild(divThree);
		divOne.appendChild(divTwo);
		divRowObj.appendChild(divOne);
		
		}
	getNavigation();
	vaildLanding();
}
function vaildLanding(){
	
	var landingSpanObj = document.getElementById("landingSpanId");
	var username = '<%=session.getAttribute("username")%>' ;
	if(username == "null"){
		landingSpanObj.innerHTML = " <a class='navbar-brand' href='userLanding.jsp' target='_blank'><font color='red' size='2' target='_blank'>亲，请登录</font></a>";
	}else{
		landingSpanObj.innerHTML = " <a class='navbar-brand' href='userInfo.jsp' target='_blank'><font color='red' size='2' target='_blank'>"+'<%=session.getAttribute("username")%>'+"</font></a>";
	}
}
function getNavigation(){
	var navigationObj = document.getElementById("navigationId");
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4){
			var data = xmlhttp.responseText;
			//alert(data);
			var spanObj = document.getElementById("spanId");
			spanObj.innerHTML = "<font color='red' size='3'>"+data+"</font>";
		}	
	};
	xmlhttp.open("post","selectNavigation.do",true);
	xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlhttp.send(null);
}

function upPage(){
	var value = '<%=session.getAttribute("code") %>';
	if(page > 1){
		page = page - 1;
		window.location.href="getCommodity.do?name="+value+"&page="+page;
	}
}
function upPage(){
	var value = '<%=session.getAttribute("code") %>';
	
		page = page + 1;
		window.location.href="getCommodity.do?name="+value+"&page="+page;
	
}
</script>
</head>
<body onload="showCommodity()">
<div class="container">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">      
     <span id="landingSpanId" ></span>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li ><a href="login.jsp" target="_blank"><span style="font-size:3px">免费注册</span></a></li>
        <li></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我的e_shop<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">已买到的宝贝</a></li>
            <li><a href="#">代发货的宝贝</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" role="search" action="selectCommodityByname.do" method="post">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="商品名/类别名/品牌名" name="name">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
      </form>
      
        <marquee style="width:350px;height:35px" onmouseover="this.stop()" onmouseout="this.start()" scrollamount="15" id="navigationId" ><img src="image/laba.jpg" width="35px" height="20px"><span id="spanId"></span></marquee> 
     
      <ul class="nav navbar-nav navbar-right">
        <li><a href="buyCar.jsp" target="_blank">购物车</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人中心<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">详细信息</a></li>
            <li><a href="#">修改密码</a></li>
            <li><a href="#">退出登录</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div id="commodityId" >
      
</div>

</div>
<div  style="margin:0 auto;width:150px">
<input type="button" value="上一页" onclick="upPage()"/><input type="button" value="下一页" onclick="downPage()"/></div>
</body>
</html>