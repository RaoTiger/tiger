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
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.min.js"></script>
<title>Insert title here</title>
<%List<Commodity> list = (ArrayList)request.getAttribute("value");
String number = request.getAttribute("number").toString();
String a = list.get(0).getId();
Gson g = new Gson();
String value = g.toJson(list);
%>
<script type="text/javascript">
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
		getPicture();
		
	};
	xmlhttp.open("post","selectNavigation.do",true);
	xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlhttp.send(null);
	vaildLanding();
}
function vaildLanding(){
	
	var landingSpanObj = document.getElementById("landingSpanId");
	var username = '<%=session.getAttribute("username")%>' ;
	if(username == "null"){
		landingSpanObj.innerHTML = " <a class='navbar-brand' href='userLanding.jsp'><font color='red' size='2'>亲，请登录</font></a>";
	}else{
		landingSpanObj.innerHTML = " <a class='navbar-brand' href='userInfo.jsp'><font color='red' size='2'>"+'<%=session.getAttribute("username")%>'+"</font></a>";
	}
}
function getAddress(){
	getNavigation();
	showCommodity();
	var username = '<%=session.getAttribute("username")%>';
	//alert(username);
	var selectObj = document.getElementById("selectId");
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4){
			var data = xmlhttp.responseText;
			//alert(data);
			if(data != "no"){
				dataArray = eval("("+data+")");
				for(var i = 0;i<dataArray.length;i++){
					var optionObj = document.createElement("option");
	    			optionObj.value = dataArray[i].id;
	    			optionObj.innerText = dataArray[i].address;
					selectObj.appendChild(optionObj);
				}
			}else{
				alert("a");
			}
			
		}
		getTextarea();
	};
	xmlhttp.open("post","selectUserAddress.do",true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send("username="+username);
	
}
function getTextarea(){
	//alert("a");
	var textareaObj = document.getElementById("textareaId");
	//alert("a");
	var selectObj = document.getElementById("selectId");
	//alert("a");
	var selectLabel= selectObj.options[selectObj.selectedIndex].innerText;
	//alert("a");
	textareaObj.value = selectLabel;
}
function showCommodity(){
	var data = '<%=value%>';
	var number = '<%=number%>';
	//alert(number);
	//alert(data);
	var dataArray = eval("("+data+")");
	var commodityObj = document.getElementById("commodityId");
	var divRowObj = document.createElement("div");
	divRowObj.className ="row"; 
	commodityObj.appendChild(divRowObj);
	var usernameObj = document.getElementById("usernameId");
	var comObj = document.getElementById("commodity_idId");
	var numObj = document.getElementById("getnumberId");
	var priObj = document.getElementById("priceId");
	
	for(var i = 0;i<dataArray.length;i++){
		if(i%2 == 0){
			var divRowObj = document.createElement("div");
			commodityObj.appendChild(divRowObj);
		}
		//alert("a");
		usernameObj.value='<%=session.getAttribute("username")%>';
		//alert("a");
		comObj.value = dataArray[i].id;
		//alert("a");
		numObj.value = number;
		//alert("a");
		priObj.value = (dataArray[i].price*number);
		//alert("a");
		var divOne = document.createElement("div");
		divOne.className = "col-sm-6 col-md-4";
		
		var divTwo = document.createElement("div");
		divTwo.className = "thumbnail";
		
		var comImgObj = document.createElement("img");
		comImgObj.src= "image/"+dataArray[i].img;
		comImgObj.style.width="100px";
		comImgObj.style.height="100px";
		
		var spanOneObj = document.createElement("span");
		spanOneObj.innerHTML = "<font  size='1'>"+dataArray[i].depict+"</font><br />";
		
		var spanTwoObj = document.createElement("span");
		spanTwoObj.innerHTML = "<font color='red' size='1'>价格："+(dataArray[i].price*number)+"</font><br />";
		
		var spanThreeObj = document.createElement("span");
		spanThreeObj.innerHTML = "<font size='1'>类别："+dataArray[i].typename+"</font><br/>";
		
		var spanFourObj = document.createElement("span");
		spanFourObj.innerHTML = "<font size='1'>品牌："+dataArray[i].trademark+"</font><br/>";
		
		var spanFiveObj = document.createElement("span");
		spanFiveObj.innerHTML = "<font size='1'>名称："+dataArray[i].name+"</font><br/>";
		
		var inputObj = document.createElement("input");
		inputObj.type = "number";
		inputObj.value = number;
		
		var spanSevenObj = document.createElement("span");
		spanSevenObj.innerHTML = "<font size='1'>本店活动：全场包邮</font><br/>";
		
		
		
		
		divTwo.appendChild(comImgObj);
		divOne.appendChild(divTwo);
		divRowObj.appendChild(divOne);
		divRowObj.appendChild(spanOneObj);
		divRowObj.appendChild(spanTwoObj);
		divRowObj.appendChild(spanThreeObj);
		divRowObj.appendChild(spanFourObj);
		divRowObj.appendChild(spanFiveObj);
		divRowObj.appendChild(inputObj);
		divRowObj.appendChild(spanSevenObj);

		}
		}
</script>
</head>
<body onload="getAddress()">
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
<div style="width:100%;height:30px;background-color:red;color:white;text-align:right"><strong>支付中心</strong></div>
<hr/>
<div id="addressId">
<div style="float:left">
<span id="spanId">选择收货地址</span>
</div>
<div style="padding-left:320px">添加新地址</div>
<hr/>
<div>
<select id="selectId" style="width:80px" onchange="getTextarea()"></select>
</div>
<form action="addplay.do" method="post">


<div style="float:left">
<textarea cols="20" rows="5" id="textareaId" style= "resize:none" readonly="readonly" name="address"></textarea>
</div>
<div style="padding-left:300px">
<a  href="addNewAddress.jsp" role="button" data-slide="next" target="_blank">
				<img src="image/jiahao.jpg" style="width:85px;height:85px"/>
			</a>
</div>
<hr />
<div>
<span><strong>确认订单信息</strong></span>
</div>

<div id="commodityId">
<input type="hidden" name="username" id="usernameId">
<input type="hidden" name="commodity_id" id="commodity_idId">
<input type="hidden" name="number" id="getnumberId">
<input type="hidden" name="price" id="priceId">
</div>
<hr/>
<div style="width:100%;text-align:right"><input type="submit" class="btn btn-danger" value="提交订单">
</div>
</form>
</div>
</div>


</body>
</html>