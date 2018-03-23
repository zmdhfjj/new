<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<title>Welcome-Deer.Book</title>
</head>
<body>

<!--导航栏-->
<!--导航头部  -->
<nav class="navbar navbar-default">
  <div class="container-fluid" style="margin: 20px">
    <!-- Brand and toggle get grouped for better mobile display -->
   	 	<div class="navbar-header">
     	 <a class="navbar-brand" href="#">
      	 <img style="position: absolute;left:10px;top:30px ;"alt="Brand" src="../img/logo.png" width="30px" height="30px">
    	 </a>
    	</div>
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Deer</a>
    </div>
    

    <!--导航身体-->
    
    <!--下拉框分类-->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="#">首页</a></li>
        <li><a href="#">全部</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">图书分类 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <!--form表单搜索-->
      <form class="navbar-form navbar-right">
  <div class="form-group">
    <div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
	    全部分类
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
    <li><a href="#">Action</a></li>
    <li><a href="#">Another action</a></li>
    <li><a href="#">Something else here</a></li>
    <li role="separator" class="divider"></li>
    <li><a href="#">Separated link</a></li>
  </ul>
</div>
  </div>
  <div class="form-group">
    <label for="inputPassword2" class="sr-only">Password</label><!--需要删除部分-->
    <input type="text" class="form-control" id="inputPassword2" placeholder="查找图书">
  </div>
  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
      </form>
      <!--导航登录注册购物车部分-->
      <ul class="nav navbar-nav navbar-right">
    	  <c:if test="${sessionScope.user==null}">
     		 <li><a href="../jsp/login.jsp">登录</a></li>
  	    </c:if>
  	    <c:if test="${sessionScope.user!=null}">
     		 <li><a href="../jsp/personal.jsp">${sessionScope.user.userName}</a></li>
  	    </c:if>
     	<li><a href="../jsp/register.jsp">注册</a></li>
        <li><a href="#">购物车</a></li>
        <li><a href="#">消息 <span class="badge">0</span></a></li>
        <!-- <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li> -->
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</body>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
</html>