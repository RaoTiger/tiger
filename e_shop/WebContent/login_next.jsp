<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册</title>
<script type="text/javascript">
function getProvince(){
	//alert("a");
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4){
			var data = xmlHttp.responseText;
			var provinceObj = document.getElementById("provinceId");
			
			//alert(data);
			var dataArray = eval("("+data+")");
			 
			for(var i = 0; i<dataArray.length;i++){
				//alert("a");
				var optionObj = document.createElement("option");
				optionObj.value = dataArray[i].code;
				optionObj.innerText = dataArray[i].name;
				//alert(dataArray[i]);
				provinceObj.appendChild(optionObj);
			}
		}
	};
	xmlHttp.open("post", "getProvince.do", true);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlHttp.send(null);
}
function getCity(){
	//alert("a");
    var provinceObj = document.getElementById("provinceId");
	var procodeLabel= provinceObj.options[provinceObj.selectedIndex].innerText;
	//alert(procodeLabel);
	var proOneObj = document.getElementById("provinceOneId");
	proOneObj.value = procodeLabel;
	var xmlhttp = new XMLHttpRequest();
	var proValue = document.getElementById("provinceId").value;
	
	//alert(proValue);
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4){
			//alert("a");
			var data = xmlhttp.responseText;
			//alert(data);
			 var dataArray = eval("("+data+")");
			  var cityObj = document.getElementById("cityId");
			  var cityChild = cityObj.childNodes;
			  
			  while(cityChild.length > 0){
				  cityObj.removeChild(cityChild[cityChild.length - 1]);
			  }
			  for(var i = 0;i<dataArray.length;i++){
				 
	    			var optionObj = document.createElement("option");
	    			optionObj.value = dataArray[i].code;
	    			optionObj.innerText = dataArray[i].name;
	    			//alert(dataArray[i].name);
	    			cityObj.appendChild(optionObj);
	    			
	    		}
			 
			  
		}
		getTown();
	};
	//alert("a");
	xmlhttp.open("post","getCity.do", true);
	//alert("a");
	xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	//alert("a");
	xmlhttp.send("pro="+proValue);
}
function getTown(){
	//alert("a");
	 var cityObj = document.getElementById("cityId");
	 //alert("a");
		var cityLabel= cityObj.options[cityObj.selectedIndex].innerText;
		//alert("a");
		//alert(cityLabel);
		var cityOneObj = document.getElementById("cityOneId");
		cityOneObj.value = cityLabel;
	var xmlhttp = new XMLHttpRequest();
	var cityValue = document.getElementById("cityId").value;
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4){
			var data = xmlhttp.responseText;
			var dataArray = eval("("+data+")");
			  var townObj = document.getElementById("townId");
			  var townChild = townObj.childNodes;
			  while(townChild.length > 0){
				  townObj.removeChild(townChild[townChild.length - 1]);
			  }
			  for(var i = 0;i<dataArray.length;i++){
	    			
	    			var optionObj = document.createElement("option");
	    			optionObj.value = dataArray[i].code;
	    			optionObj.innerText = dataArray[i].name;
	    			//alert(dataArray[i].name);
	    			townObj.appendChild(optionObj);
	    		}
		}
		
	};
	xmlhttp.open("post","getTown.do",true);
	xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlhttp.send("city="+cityValue);
	getAddress();
}
function VaildAddress(){
	var addressObj = document.getElementById("addressId").value;
	var addressLength = addressObj.length;
	if(addressLength < 5){
		alert("地址不得少于5个字");
	}
}
function getAddress(){
	var townObj = document.getElementById("townId");
	 //alert("a");
		var townLabel= townObj.options[townObj.selectedIndex].innerText;
		//alert("a");
		//alert(cityLabel);
		var townOneObj = document.getElementById("townOneId");
		townOneObj.value = townLabel;
}
</script>
</head>
<%String username = request.getAttribute("user").toString(); %>
<body onload="getProvince()">
<form action="userLogin.do" method="post">
常用地址:<select id="provinceId" onchange="getCity()" style="width:100px" ></select>
         <input type="hidden" id="provinceOneId" name="province">
         <select id="cityId" onchange="getTown()" style="width:100px"></select>
          <input type="hidden" id="cityOneId" name="city">
         <select id="townId" style="width:100px" onchange="getAddress()"></select><br />
          <input type="hidden" id="townOneId" name="town">
 详细地址:<input type="text" name="address" id="addressId" onblur="VaildAddress()"><br />
 <input type="hidden" value="<%=username%>" name="username">
 <input type="submit" value="注册"/>
 </form>
</body>
</html>