<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<title>Deer.Book-Register</title>
</head>
<body>
<c:if test="${requestScope.registerError!=null}">
	<h4 align="center">注册失败</h4>
</c:if>
<div class="container" >  
  <div class="row myCenter">  
    <div class="col-xs-6 col-md-4 col-center-block"> 
	<form class="form-horizontal"  method="post" id="form" action="${pageContext.request.contextPath}/UserController/register.action" >
  <div class="form-group">
    <label for="exampleInputUserName" id="userNameLabel">用户名
    	<c:if test="${requestScope.registerError.userNameLengthError!=null}" var="userNameResult">
    		<c:out value="${requestScope.registerError.userNameLengthError}"></c:out>
    	</c:if>
    	<c:if test="${pageScope.userNameError==false}">
    		<c:if test="${requestScope.registerError.userNameSameError!=null}">
    			<c:out value="${requestScope.registerError.userNameSameError}"></c:out>
    		</c:if>
    	</c:if>
    </label>
    <input type="text" class="form-control" id="exampleInputUserName" placeholder="用户名" onfocus="userNameFocus();" onblur="userNameBlur();" name="exampleInputUserName">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword" id="passLabel">密码
    	<c:if test="${requestScope.registerError.userPassLengthError!=null}" var="userPassResult">
    		<c:out value="${requestScope.registerError.userPassLengthError}">
    		</c:out>
    	</c:if>
    	<c:if test="${pageScope.userPassResult == false}">
    		<c:if test="${requestScope.registerError.userPassNotSameError!=null}">
    			<c:out value="${requestScope.registerError.userPassNotSameError}"></c:out>
    		</c:if>
    	</c:if>
    </label>
    <input type="password" class="form-control" id="exampleInputPassword" placeholder="密码" onfocus="passFocus();" onblur="passBlur();" name="exampleInputPassword">
  </div>
  <div class="form-group">
    <label for="exampleInputPasswordAgain" id="passAgainLabel">重输密码</label>
    <input type="password" class="form-control" id="exampleInputPasswordAgain" placeholder="重输密码" onblur="passAgainBlur();" name="exampleInputPasswordAgain">
  </div>
  <div class="form-group">
    <label for="exampleInputPhone" id="phoneLabel">手机号
    	<c:if test="${requestScope.registerError.userPhoneSameError!=null}">
    		<c:out value="${requestScope.registerError.userPhoneSameError}"></c:out>
    	</c:if>
    </label>
    <input type="text" class="form-control" id="exampleInputPhone" placeholder="手机号" onblur="phoneBlur();" name="exampleInputPhone">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail" id="emailLabel">邮箱</label>
    <input type="text" class="form-control" id="exampleInputEmail" placeholder="邮箱" name="exampleInputEmail">
  </div>
  <div class="checkbox">
    <label>
      <input type="checkbox" name="autoLogIn"id="autoLogIn" value="true"> 自动登录
    </label>
  </div>
  <button type="submit" class="btn btn-default" >注册</button>
</form>
</div>
</div>
</div>
</body>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
	function userNameFocus(){
		$("#userNameLabel").html("用户名         <span class='glyphicon glyphicon-exclamation-sign'>用户名长度为4-16位</span>");	
	}
	function userNameBlur(){
		var userName = $("#exampleInputUserName").val();
		$("#userNameLabel").html("用户名");
		if((userName != null)&&(userName != "")&&(userName.length>=3)&&(userName.length<=16)){
			param = {"userName":userName};
			$.post("${pageContext.request.contextPath}/UserController/userNameCheck.action",param,function(data){
				if(data == 0){
					$("#userNameLabel").html("用户名         <span class='glyphicon glyphicon-remove-circle'>用户名已存在</span>");
				}else if(data == 1){
					$("#userNameLabel").html("用户名         <span class='glyphicon glyphicon-ok-circle'>用户名可用</span>");
				}else{
					$("#userNameLabel").html("用户名         <span class='glyphicon glyphicon-remove-circle'>用户名格式错误</span>");
				}
				
			});
			
		}
		
	}
	function passFocus(){
		$("#passLabel").html("密码         <span class='glyphicon glyphicon-exclamation-sign'>密码长度为4-16位</span>");	
		
	}
	function passBlur(){
		var pass = $("#exampleInputPassword").val();
		console.log(pass);
		if((pass==null)||(pass=="")){
			$("#passLabel").html("密码         <span class='glyphicon glyphicon-exclamation-sign'>密码不能为空</span>");	
		}else if(pass.length < 4){
			$("#passLabel").html("密码         <span class='glyphicon glyphicon-exclamation-sign'>密码长度过短</span>");	
		}else if(pass.length > 16){
			$("#passLabel").html("密码         <span class='glyphicon glyphicon-exclamation-sign'>密码长度过长</span>");	
		}else{
			$("#passLabel").html("密码         <span class='glyphicon glyphicon-ok-circle'></span>");	
		}
	}
	function passAgainBlur(){
		var pass = $("#exampleInputPassword").val();
		var passAgain = $("#exampleInputPasswordAgain").val();
		if((passAgain==null)||(passAgain=="")){
			
			$("#passAgainLabel").html("密码         <span class='glyphicon glyphicon-exclamation-sign'>密码不能为空</span>");
		}else if(passAgain==pass){
			$("#passAgainLabel").html("密码         <span class='glyphicon glyphicon-ok-circle'></span>");
		}else if(passAgain!=pass){
			$("#passAgainLabel").html("密码         <span class='glyphicon glyphicon-exclamation-sign'>两次密码不一致</span>");
		}
		
	}
	function phoneBlur(){
		var phone = $("#exampleInputPhone").val();
		if((phone.length!= 11)){
			$("#phoneLabel").html("手机号        <span class='glyphicon glyphicon-exclamation-sign'>你输入的手机号长度有误</span>");
			
		}else{
			/* 数据库模拟验证手机号是否正确 */
			param = {"phone":phone};
			$.post("${pageContext.request.contextPath}/UserController/phoneCheck.action",param,function(data){
				
				if(data == 0){
					$("#phoneLabel").html("手机号        <span class='glyphicon glyphicon-ok-circle'></span>");
				}else if(data == 1){
					$("#phoneLabel").html("手机号        <span class='glyphicon glyphicon-exclamation-sign'>该手机号已注册</span>");
				}
			});
		}
		
	}
	/* function submitOnClick(){
		var userName = $("#exampleInputUserName").val();
		var userPass = $("#exampleInputPassword").val();
		var userPassAgain=$("#exampleInputPasswordAgain").val();
		var phone = $("#exampleInputPhone").val();
		var email = $("#exampleInputEmail").val();
		var autoLogIn = $("#autoLogIn").get(0).checked;
		if(userName ==null && userName == ""){
			alert("用户名不能为空！");
		}else if(userPass ==null && userPass == ""){
			alert("密码不能为空！");
		}else if(userPassAgain == null && userPassAgain==" "){
			alert("请再次填写密码！");
		}else if(phone ==null && phone == ""){
			alert("手机号不能为空！");
		}else{
			var param = {
					"userName":userName,
					"userPass":userPass,
					"phone":phone,
					"email":email,
					"autoLogIn":autoLogIn
			};
			$.post("${pageContext.request.contextPath}/UserController/register.action",param,function(data){
				if(data == 0){
					alert("成功");
				}
			});
		} 
	}*/
</script>
</html>