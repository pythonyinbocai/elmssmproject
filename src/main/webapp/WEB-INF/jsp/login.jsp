<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<link href="${pageContext.request.contextPath }/framework/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/framework/reset.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/css/login.css" rel="stylesheet">
		<title>饿了么 用户登陆</title>
	</head>
	<body>
		<div class="wrapper">
			
			<!-- header部分 -->
			<header>
				<p>用户登陆</p>
			</header>
			<form action="${pageContext.request.contextPath }/UserController/getUserByIdByPass" method="post">
			<!-- 表单部分 -->
			<ul class="form-box">
				<li>
					<div class="title">
						手机号码：
					</div>
					<div class="content">
						<input type="text" name="userId" placeholder="手机号码">
					</div>
				</li>
				<li>
					<div class="title">
						密码：
					</div>
					<div class="content">
						<input type="password" name="password" placeholder="密码">
					</div>
				</li>
			</ul>
			
			<div class="button-login">
				<input type="submit" value="登陆"/>
			</div>
			<div class="button-register">
				<button onclick="location.href='${pageContext.request.contextPath }/UserController/toregister'">去注册</button>
			</div>
			</form>
			<!-- 底部菜单部分 -->
			<ul class="footer">
				<li onclick="location.href='/'">
					<i class="fa fa-home"></i>
					<p>首页</p>
				</li>
				<li>
					<i class="fa fa-compass"></i>
					<p>发现</p>
				</li>
				<li onclick="location.href='orderList.html'">
					<i class="fa fa-file-text-o"></i>
					<p>订单</p>
				</li>
				<li onclick="location.href='${pageContext.request.contextPath }/my'">
					<i class="fa fa-user-o"></i>
					<p>我的</p>
				</li>
			</ul>
		</div>	
	</body>
</html>
