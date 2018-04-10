<%@page import="com.google.gson.Gson"%>
<%@page import="com.hzyc.e_shop.bean.Commodity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.min.js"></script>
<title>Insert title here</title>
<%List<Commodity> list = (ArrayList)request.getAttribute("value");
String a = list.get(0).getId();
Gson g = new Gson();
String value = g.toJson(list);
%>
<script type="text/javascript">
function vaildLanding(){
	
	var landingSpanObj = document.getElementById("landingSpanId");
	var username = '<%=session.getAttribute("username")%>' ;
	if(username == "null"){
		landingSpanObj.innerHTML = " <a class='navbar-brand' href='userLanding.jsp' target='_blank'><font color='red' size='2'>亲，请登录</font></a>";
	}else{
		landingSpanObj.innerHTML = " <a class='navbar-brand' href='userInfo.jsp' target='_blank'><font color='red' size='2'>"+'<%=session.getAttribute("username")%>'+"</font></a>";
	}
}
function showCommodity(){
	vaildLanding();
	getNavigation();
	var data = '<%=value%>';
	var dataArray = eval("("+data+")");
	var commodityObj = document.getElementById("commodityId");
	var divRowObj = document.createElement("div");
	divRowObj.className ="row"; 
	commodityObj.appendChild(divRowObj);
	
	for(var i = 0;i<dataArray.length;i++){
		var addBuyCayObj = document.getElementById("addCar");
		
		addBuyCayObj.value = dataArray[i].id;
		
		var buyNowObj = document.getElementById("buyNow");
		buyNowObj.value = dataArray[i].id;
		var addCarObj = document.getElementById("addCar");
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
		comImgObj.style.width="380px";
		comImgObj.style.height="380px";
		
		var spanOneObj = document.createElement("span");
		spanOneObj.innerHTML = "<font  size='5'>"+dataArray[i].depict+"</font><br />";
		
		var spanTwoObj = document.createElement("span");
		spanTwoObj.innerHTML = "<font color='red' size='5'>价格："+dataArray[i].price+"</font><br />";
		
		var spanThreeObj = document.createElement("span");
		spanThreeObj.innerHTML = "<font size='5'>类别："+dataArray[i].typename+"</font><br/>";
		
		var spanFourObj = document.createElement("span");
		spanFourObj.innerHTML = "<font size='5'>品牌："+dataArray[i].trademark+"</font><br/>";
		
		var spanFiveObj = document.createElement("span");
		spanFiveObj.innerHTML = "<font size='5'>名称："+dataArray[i].name+"</font><br/>";
		
		var spanSevenObj = document.createElement("span");
		spanSevenObj.innerHTML = "<font size='5'>本店活动：全场包邮</font><br/>";
		
		var spanEightObj = document.createElement("span");
		spanEightObj.innerHTML = "<font size='5'>颜色分类：</font><br/>";
		
		var spanNineObj = document.createElement("span");
		spanNineObj.innerHTML = "<font size='5'>尺寸大小：</font><br/>";
		
		var spanTenObj = document.createElement("span");
		spanTenObj.innerHTML = "<font size='5'>数量：</font><br/>";
		
		var inputObj = document.createElement("input");
		inputObj.id="numberId";
		inputObj.type = "number";
	    inputObj.value = "1";

		
		
		divTwo.appendChild(comImgObj);
		divOne.appendChild(divTwo);
		divRowObj.appendChild(divOne);
		divRowObj.appendChild(spanOneObj);
		divRowObj.appendChild(spanTwoObj);
		divRowObj.appendChild(spanThreeObj);
		divRowObj.appendChild(spanFourObj);
		divRowObj.appendChild(spanFiveObj);
		divRowObj.appendChild(spanSevenObj);
		divRowObj.appendChild(spanEightObj);
		divRowObj.appendChild(spanNineObj);
		divRowObj.appendChild(spanTenObj);
		divRowObj.appendChild(inputObj);
		}
		}
		function buyNow(){
			//alert("a");
			var buyNowValue = document.getElementById("buyNow").value;
			var inputValue = document.getElementById("numberId").value;
			//alert(inputValue);
			var username = '<%=session.getAttribute("username")%>' ;
			if(username == "null"){
				window.open('userLanding.jsp');
			}else{
			//alert("a");
			window.location.href = "buyCommodity.do?id="+buyNowValue+"&number="+inputValue;
		}
		}
		function addBuyCar(){
			var addBuyCarValue = document.getElementById("addCar").value;
			var username = '<%=session.getAttribute("username")%>' ;
			
			var inputValue = document.getElementById("numberId").value;
			
			if(username =="null"){
				window.open('userLanding.jsp');
			}else{
				window.location.href="addBuyCar.do?com="+addBuyCarValue+"&username="+username+"&number="+inputValue;
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
 <button type="button" class="btn btn-danger" id="buyNow" onclick="buyNow()">立即购买</button>
 <button type="button" class="btn btn-success" id="addCar" onclick="addBuyCar()">加入购物车</button>
</div>
</body>
</html>