<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<link href="${pageContext.request.contextPath }/framework/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/framework/reset.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/css/userInfo.css" rel="stylesheet">
		<title>饿了么 个人信息</title>
	</head>
	<body>
		<div class="wrapper">
			
			<!-- header部分 -->
			<header>
				<p>个人信息</p>
			</header>
			
			<!-- 商家logo部分 -->
			<div class="user-logo">
				<img src="${user.userImg}">
			</div>
			
			<!-- 商家信息部分 -->
			<div class="user-info">
				<h1>${user.userName}</h1>
				<p>性别：${user.userSex}</p>
			</div>

			<!-- 购物车部分 -->
			<div class="cart">
				<div class="cart-left">
					<div class="cart-left-icon">
						<i class="fa fa-shopping-cart"></i>
						<div class="cart-left-icon-quantity">3</div>
					</div>
					<div class="cart-left-info">
						<p>&#165;12.88</p>
						<p>另需配送费3元</p>
					</div>
				</div>
				<div class="cart-right">
					<!-- 不够起送费 -->
					<!--
					<div class="cart-right-item">
						&#165;15起送
					</div>
					-->
					<!-- 达到起送费 -->
					<div class="cart-right-item" onclick="location.href='order.html'">
					    去结算
					</div>
				</div>
			</div>
			
		</div>	
	</body>
</html>
