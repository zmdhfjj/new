<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<title>登录</title>
</head>
<body>
<c:if test="${requestScope.logInUserNameError!=null}">
	<h4>登录失败</h4>
</c:if>
<c:if test="${requestScope.logInUserPassError!=null}">
	<h4>登录失败</h4>
</c:if>
<div style="margin-left: 500px;width: 300px" >
	<form method="post" action="${pageContext.request.contextPath}/UserController/logIn.action">
  <div class="form-group">
    <label for="exampleInputUserName">用户名
    	<c:if test="${requestScope.logInUserNameError!=null}">
			<c:out value="${requestScope.logInUserNameError}"></c:out>
		</c:if>
    </label>
    <input type="text" class="form-control" id="exampleInputUserName" placeholder="用户名" name="exampleInputUserName">
  </div>
  <div class="form-group">
    <label for="exampleInputUserPass">密码
    <c:if test="${requestScope.logInUserPassError!=null}">
			<c:out value="${requestScope.logInUserPassError}"></c:out>
		</c:if></label>
    <input type="password" class="form-control" id="exampleInputUserPass" placeholder="密码" name="exampleInputUserPass">
  </div>
  <button type="submit" class="btn btn-default" style="align-self: center;">登录</button>
</form>
<br/>
 <a href="../jsp/index.jsp"><button class="btn btn-default">返回首页</button></a>
</div>
</body>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
</html>