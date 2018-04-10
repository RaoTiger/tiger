<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC >
<html>
<head>
<style>
        * {
    margin: 0;
    padding: 0;
    list-style: none;
}
 
body {
    font: 12px "宋体";
    padding-top: 20px;
}
 
#menu {
    width: 200px;
    margin: auto;
    height:360px;
}
 
#menu h1 {
    cursor: pointer;
    color: #FFF;
    font-size: 12px;
    padding: 5px 0 3px 10px;
    border: #C60 1px solid;
    margin-top: 1px;
    background-color: #F93;
}
 
#menu h2 {
    cursor: pointer;
    color: #777;
    font-size: 12px;
    padding: 5px 0 3px 10px;
    border: #E7E7E7 1px solid;
    border-top-color: #FFF;
    background-color: #F4F4F4;
}
 
#menu ul {
    padding-left: 15px;
    height: 100px;
    border: #E7E7E7 1px solid;
    border-top: none;
    overflow: auto;
}
 
#menu ul li {
    padding: 5px 0 3px 10px;
}
 
.no {
    display: none;
}
    </style>
    <script>
        function ShowMenu(obj, noid) {
            var block = document.getElementById(noid);
            var n = noid.substr(noid.length - 1);
            if (noid.length == 4) {
                var ul = document.getElementById(noid.substring(0, 3)).getElementsByTagName("ul");
                var h2 = document.getElementById(noid.substring(0, 3)).getElementsByTagName("h2");
                for (var i = 0; i < h2.length; i++) {
                    h2[i].innerHTML = h2[i].innerHTML.replace("+", "-");
                    h2[i].style.color = "";
                }
                obj.style.color = "#FF0000";
                for (var i = 0; i < ul.length; i++) {
                    if (i != n) {
                        ul[i].className = "no";
                    }
                }
            } else {
                var span = document.getElementById("menu").getElementsByTagName("span");
                var h1 = document.getElementById("menu").getElementsByTagName("h1");
                for (var i = 0; i < h1.length; i++) {
                    h1[i].innerHTML = h1[i].innerHTML.replace("+", "-");
                    h1[i].style.color = "";
                }
                obj.style.color = "#0000FF";
                for (var i = 0; i < span.length; i++) {
                    if (i != n) {
                        span[i].className = "no";
                    }
                }
            }
            if (block.className == "no") {
                block.className = "";
                obj.innerHTML = obj.innerHTML.replace("-", "+");
            } else {
                block.className = "no";
                obj.style.color = "";
            }
        }
    </script>
<style type="text/css">
.carousel{
		width:520px;
		height:280px;
	}
	
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.min.js"></script>

<script type="text/javascript">
var page = 0;
function getNavigation(){
	getCommodity();
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
	var userLandingObj = document.getElementById("userLanding");
	var rightDivObj = document.getElementById("landingAndLogin");
	var imgObj = document.createElement("img");
	imgObj.src="image/avtar.png";
	rightDivObj.appendChild(imgObj);
	if(username == "null"){
		landingSpanObj.innerHTML = " <a class='navbar-brand' href='userLanding.jsp' target='_blank'><font color='red' size='2'>亲，请登录</font></a>";
		
		var inputDivObj = document.createElement("div");
		inputDivObj.className = "input-group";
		var inputDivTwoObj = document.createElement("div");
		inputDivTwoObj.className = "input-group";
		userLandingObj.appendChild(inputDivObj);
		userLandingObj.appendChild(inputDivTwoObj);
		rightDivObj.appendChild(userLandingObj);
		
		var userSpanObj = document.createElement("span");
		userSpanObj.className = "input-group-addon";
		userSpanObj.style.width="50px";
		userSpanObj.innerHTML="<font>账号</font>";
		
		var userInputObj = document.createElement("INPUT");
		userInputObj.setAttribute("className","form-control");
		userInputObj.setAttribute("type","text");
		userInputObj.setAttribute("name","username");
		userInputObj.style.width="150px";
		
		inputDivObj.appendChild(userSpanObj);
		inputDivObj.appendChild(userInputObj);
		
		var passSpanObj = document.createElement("span");
		passSpanObj.className = "input-group-addon";
		passSpanObj.style.width="50px";
		passSpanObj.innerHTML = "<font>密码</font>";
		
		var passInputObj = document.createElement("input");
		passInputObj.className = "form-control";
		passInputObj.type="password";
		passInputObj.name = "password";
		passInputObj.style.width="150px";
		
		inputDivTwoObj.appendChild(passSpanObj);
		inputDivTwoObj.appendChild(passInputObj);
		
		var landingInputObj = document.createElement("input");
		//loginInputObj.className="form-control";
		landingInputObj.type="submit";
		landingInputObj.value = "登陆";
		landingInputObj.style.width="55px";
		rightDivObj.appendChild(landingInputObj);
		
		var loginInputObj = document.createElement("input");
		//loginInputObj.className="form-control";
		loginInputObj.type="button";
		loginInputObj.value = "注册";
		loginInputObj.style.width="55px";
		loginInputObj.onclick=function(){
			window.open("login.jsp");
		}
		rightDivObj.appendChild(loginInputObj);
		
		
	}else{
		landingSpanObj.innerHTML = " <a class='navbar-brand' href='userFrameset.jsp' target='_blank'><font color='red' size='2'>"+'<%=session.getAttribute("username")%>'+"</font></a>";
		var spanObj = document.createElement("span");
		spanObj.innerHTML = "<br/><font size='3'>当前用户：<a href='userFrameset.jsp' target='_blank'><font color='red' size='2'>"+'<%=session.getAttribute("username")%>'+"</font></a></font>";
		rightDivObj.appendChild(spanObj);
		
		var logoutInputObj = document.createElement("input");
		//loginInputObj.className="form-control";
		logoutInputObj.type="button";
		logoutInputObj.value = "注销";
		logoutInputObj.onclick=function(){
			//alert("a");
		 window.location.href="cleanSession.do";
		};
		logoutInputObj.style.width="55px";
		rightDivObj.appendChild(logoutInputObj);
		
		var loginInputObj = document.createElement("input");
		//loginInputObj.className="form-control";
		loginInputObj.type="button";
		loginInputObj.value = "注册";
		loginInputObj.style.width="55px";
		loginInputObj.onclick=function(){
			window.open("login.jsp");
		}
		rightDivObj.appendChild(loginInputObj);
		
	}
}
function getPicture(){
	oneImgObj = document.getElementById("oneImgId");
	twoImgObj = document.getElementById("twoImgId");
	threeImgObj = document.getElementById("threeImgId");
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4){
			var data = xmlhttp.responseText;
			var dataArray = eval("("+data+")");
			oneImgObj.src = "image/"+dataArray[0].picture;
			twoImgObj.src = "image/"+dataArray[1].picture;
			threeImgObj.src = "image/"+dataArray[2].picture;
		}
		
	};
	xmlhttp.open("post","selectAdvertising.do",true);
	xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlhttp.send(null);
	//getCommodity();
}
function getCommodity(){
	var count = 0;
	var xmlhttp = new XMLHttpRequest();
	var commodityObj = document.getElementById("commodityId");
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4){
			var data = xmlhttp.responseText;
			
			var dataArray = eval("("+data+")");
			
			var divRowObj = document.createElement("div");
			commodityObj.appendChild(divRowObj);
			for(var i = 0;i<dataArray.length;i++){
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
				
				divThree.innerHTML = "<p><font color='red' size='5'>"+dataArray[i].price+"</font><p><P><a href='3'>"+dataArray[i].depict+"</a></p><p><a href='#' class='btn btn-primary' role='button'>"+dataArray[i].typename+"</a> <a href='#' class='btn btn-default'>"+dataArray[i].trademark+"</a></p>";
				
				divTwo.appendChild(comImgObj);
				divTwo.appendChild(divThree);
				divOne.appendChild(divTwo);
				divRowObj.appendChild(divOne);
				
				}
		}
	};
	xmlhttp.open("post","selectLimitCommodity.do",true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	var newPage = (page)*3;
	xmlhttp.send("newPage="+newPage);
	//alert(page);
	page++;
}

</script>
</head>
<body onload="getNavigation()">
    <div class="container">
    <div class="row">
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
    </div>
    <table>
<tr>
<td >
<div id="menu">
        <h1 onClick="javascript:ShowMenu(this,'NO0')">服装类</h1>
        <span id="NO0" class="no">
   <h2 onClick="javascript:ShowMenu(this,'NO00')"><a href="getCommodity.do?name=1001">男衣</a>/<a href="getCommodity.do?name="1002>女衣</a></h2>
   <ul id="NO00" class="no">
    <li><a href="#">羽绒服</a>  <a href="#">男</a>/<a href="#">女</a></li>
    <li><a href="#">毛衣</a> <a href="#">男</a>/<a href="#">女</a></li>
    <li><a href="#">卫衣</a> <a href="#">男</a>/<a href="#">女</a></li>
    <li><a>T恤</a> </li>
    <li><a>夹克</a> </li>
   </ul>
   <h2 onClick="javascript:ShowMenu(this,'NO01')"><a href="getCommodity.do?name="1011>男鞋</a>/<a href="getCommodity.do?name="1012>女鞋</a></h2>
   <ul id="NO01" class="no">
    <li><a href="#">运动鞋</a> <a href="#">男</a>/<a href="#">女</a></li>
    <li><a href="#">高跟鞋</a></li>
    <li><a href="#">凉鞋</a> <a href="#">男</a>/<a href="#">女</a></li>
    <li><a href="#">球鞋</a> <a href="#">男</a>/<a href="#">女</a></li>
    <li><a href="#">拖鞋</a> <a href="#">男</a>/<a href="#">女</a></li>
   </ul>
   <h2 onClick="javascript:ShowMenu(this,'NO02')"><a href="getCommodity.do">男袜</a>/<a href="getCommodity.do?name="1022>女袜</a></h2>
   <ul id="NO02" class="no">
    <li><a href="#">棉袜</a></li>
    <li><a href="#">运动袜</a></li>
   </ul>
   <h2 onClick="javascript:ShowMenu(this,'NO03')"><a href="getCommodity.do?name="1031>男裤</a>/<a href="getCommodity.do?name="1032>女裤</a></h2>
   <ul id="NO03" class="no">
    <li><a href="#">运动裤</a></li>
    <li><a href="#">打底裤</a></li>
    <li><a href="#">秋裤</a></li>
    <li><a href="#">牛仔裤</a></li>
   </ul>
</span>
        <h1 onClick="javascript:ShowMenu(this,'NO1')">电子产品类</h1>
        <span id="NO1" class="no">
   <h2 onClick="javascript:ShowMenu(this,'NO10')"><a href="getCommodity.do?name="2001>手机</a></h2>
   <ul id="NO10" class="no">
    <li><a href="#">苹果</a></li>
    <li><a href="#">三星</a></li>
    <li><a href="#">华为</a></li>
    <li><a href="#">联想</a></li>
    <li><a href="#">vivo</a></li>
    <li><a href="#">金立</a></li>
   </ul>
   <h2 onClick="javascript:ShowMenu(this,'NO11')"><a href="#">电脑</a></h2>
   <ul id="NO11" class="no">
    <li><a href="#">苹果</a></li>
    <li><a href="#">戴尔</a></li>
    <li><a href="#">三星</a></li>
    <li><a href="#">联想</a></li>
   </ul>
</span>
        <h1 onClick="javascript:ShowMenu(this,'NO2')">家用电器类</h1>
        <span id="NO2" class="no">
   <h2 onClick="javascript:ShowMenu(this,'NO20')"><a href="#">电视机</a></h2>
   <ul id="NO20" class="no">
    <li><a href="">海尔</a></li>
    <li><a href="">格力</a></li>
   </ul>
   <h2 onClick="javascript:ShowMenu(this,'NO21')"><a href="#">冰箱</a></h2>
   <ul id="NO21" class="no">
    <li><a href="">海尔</a></li>
    <li><a href="">格力</a></li>
   </ul>
</span>
        <h1 onClick="javascript:ShowMenu(this,'NO3')">食品保鲜</h1>
        <span id="NO3" class="no">
   <h2 onClick="javascript:ShowMenu(this,'NO30')"><a href="#">美食</a></h2>
   <ul id="NO30" class="no">
  <li><a href="#">牛奶</a></li>
  <li><a href="#">酸梅汤</a></li>
  <li><a href="#">大米</a></li>
  <li><a href="#">小米</a></li>
  <li><a href="#">黄豆</a></li>
   </ul>
   <h2 onClick="javascript:ShowMenu(this,'NO31')"><a href="">零食</a></h2>
   <ul id="NO31" class="no">
    <li><a href="#">开心果</a></li>
    <li><a href="#">棒棒糖</a></li>
    <li><a href="#">薄荷糖</a></li>
    <li><a href="#">口香糖</a></li>
    <li><a href="#">辣条</a></li>
   </ul>
</span>
    </div>
</td>
<td><div style="width:120px"></div></td>
<td>
      <div id="carouselexample" class="carousel slide" data-ride="carousel" style="width:600px;margin:0 auto;height:360px;border:1px red solid">
      <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner" role="listbox">
      <div class="item active">
					<a href="#"><img id="oneImgId" width="650px" height="380px"/></a>
					<div class="carousel-caption">
						...
					</div>
	</div>
	<div class="item">
					<a href="#"><img id="twoImgId" width="650px" height="380px"/></a>
					<div class="carousel-caption">
						...
					</div>
	</div>
	<div class="item">
					<a href="#"><img id="threeImgId" width="650px" height="380px"/></a>
					<div class="carousel-caption">
						...
		</div>
	   </div>	
	   </div>
	   <a class="left carousel-control" href="#carouselexample" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			
			<a class="right carousel-control" href="#carouselexample" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>	
			</div>
			</td>
			<td> <div style="width:50px"></div></td>
			<td >
			<form action="userLanding.do" method="post">
			<div style="border:1px red solid;text-align:center" id="rightDiv">
			
			
			<div id="userLanding" >
			
			</div>
			<div class="input-group" id="landingAndLogin">
         
         
</div>
</div>

			</form>
			
			</td>
			</tr>
			</table>

<div id="commodityId">
      
</div>
 <div style="text-align:center;">
      <input type="button" value="加载商品" onclick="getCommodity();"/>
      </div>
</div>
</html>