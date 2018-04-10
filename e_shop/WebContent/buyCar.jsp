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
function vaildLanding(){
	
	var landingSpanObj = document.getElementById("landingSpanId");
	var username = '<%=session.getAttribute("username")%>' ;
	if(username == "null"){
		landingSpanObj.innerHTML = " <a class='navbar-brand' href='userLanding.jsp' target='_blank'><font color='red' size='2' >亲，请登录</font></a>";
	}else{
		landingSpanObj.innerHTML = " <a class='navbar-brand' href='userFrameset.jsp' target='_blank'><font color='red' size='2' >"+'<%=session.getAttribute("username")%>'+"</font></a>";
	}
}
function getNavigation(){
	getBuyCar();
    vaildLanding();
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
	vaildLanding();
}
function getBuyCar(){
	
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4){
			var data = xmlhttp.responseText;
			if(data != "no"){
				var dataArray = eval("("+data+")");
				var commodityObj = document.getElementById("commodityId");
				
				for(var i = 0;i<dataArray.length;i++){
					
						var divRowObj = document.createElement("div");
						divRowObj.className ="row"; 
						commodityObj.appendChild(divRowObj);
					
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
					
					var inputXZObj = document.createElement("input");
					inputXZObj.type="checkbox";
					inputXZObj.value = dataArray[i].id;
					inputXZObj.name = "shop";
					
					var inputFiveObj = document.createElement("input");
					inputFiveObj.type="hidden";
					inputFiveObj.value = dataArray[i].commodity_id;
					inputFiveObj.id="shopId";
					
					var spanTwoObj = document.createElement("span");
					spanTwoObj.innerHTML = "<font color='red' size='1'>价格："+dataArray[i].price+"</font><br />";
					
					var spanThreeObj = document.createElement("span");
					spanThreeObj.innerHTML = "<font size='1'>类别："+dataArray[i].typename+"</font><br/>";
					
					var spanFourObj = document.createElement("span");
					spanFourObj.innerHTML = "<font size='1'>类别编号："+dataArray[i].commodity_id+"</font><br/>";
					
					
					
					var inputObj = document.createElement("input");
					inputObj.type = "number";
					inputObj.value = "1";
					
					var spanSevenObj = document.createElement("span");
					spanSevenObj.innerHTML = "<font size='1'>本店活动：全场包邮</font><br/>";
					
					var inputDeleteObj = document.createElement("input");
					inputDeleteObj.type="button";
					inputDeleteObj.value="移除商品";
					var value = dataArray[i].id;
					inputDeleteObj.onclick = function(){
						var idValue = document.getElementById("shopId").value;
						alert(idValue);
						window.location.href="deleteBuyCarById.do?id="+idValue;
					};
					
					var inputBuyObj = document.createElement("input");
					inputBuyObj.type="button";
					inputBuyObj.value="购买商品";
					
					divRowObj.appendChild(inputXZObj);
					divTwo.appendChild(comImgObj);
					divOne.appendChild(divTwo);
					
					divRowObj.appendChild(inputFiveObj);
					divRowObj.appendChild(divOne);
					divRowObj.appendChild(spanOneObj);
					divRowObj.appendChild(spanTwoObj);
					divRowObj.appendChild(spanThreeObj);
					divRowObj.appendChild(spanFourObj);
					divRowObj.appendChild(inputObj);
					divRowObj.appendChild(spanSevenObj);
					divRowObj.appendChild(inputDeleteObj);
					divRowObj.appendChild(inputBuyObj);
				}
			}else{
				//alert("b");
			
				var commodityObj = document.getElementById("commodityId");
				var imgObj = document.createElement("img");
				imgObj.src = "image/wenhao.jpg";
				imgObj.style.width="350px";
				imgObj.style.width="350px";
				commodityObj.appendChild(imgObj);
			}
			}
	};
	xmlhttp.open("post","selectBuyCar.do",true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	var username = '<%=session.getAttribute("username")%>';
	//alert(username);
	xmlhttp.send("username="+username);
	
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
        <li><a href="buyCar.jsp" target='_blank'>购物车</a></li>
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
<div style="width:100%;height:30px;background-color:red;color:white;text-align:right"><strong>购物车</strong></div>
<hr/>
</div>
<div id="commodityId">
 <input type="checkbox" onclick="allCheck(this)" name="allC" />全选
    <input type="checkbox" onclick="disCheck()" name="disC" />反选<br />
</div>
<hr />
<div style="width:100%;text-align:right"><input type="submit" class="btn btn-danger" value="提交订单">
</div>
</body>
</html>