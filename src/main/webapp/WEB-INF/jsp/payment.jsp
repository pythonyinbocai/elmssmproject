<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<link href="${pageContext.request.contextPath }/framework/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/framework/reset.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/css/payment.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.js"></script>
		<script src="${pageContext.request.contextPath }/js/payment.js"></script>
		<title>饿了么 在线支付</title>
	</head>
	<body>
		<div class="wrapper">
			
			<!-- header部分 -->
			<header>
				<p>在线支付</p>
			</header>
			<!-- 订单信息部分 -->
			<h3>订单信息：</h3>
			<div class="order-info">
				<p data="${business.businessId}">
					${business.businessName}
					<i class="fa fa-caret-down" id="showBtn"></i>
				</p>
				<p>&#165;${total+business.deliveryPrice}</p>
			</div>
			<div class="order-info">
				<p>
					<c:if test="${fn:length(addressList)>0}">
						地址：<br>
						<c:forEach items="${addressList}" var="deliveryAddress">
							<input name="daId" type="radio" value="${deliveryAddress.daId}">联系人：${deliveryAddress.contactName};${deliveryAddress.contactTel};${deliveryAddress.address}
							<br>
						</c:forEach>
					</c:if>
					<c:if test="${fn:length(addressList)==0}">
						<button>添加地址</button>
					</c:if>
				</p>
			</div>
			<!-- 订单明细部分 -->
			<ul class="order-detailet" id="detailetBox">
				<c:forEach items="${cartList}" var="cart">
					<li>
						<p>${cart.food.foodName} x ${cart.quantity}</p>
						<p>&#165;${cart.food.foodPrice*cart.quantity}</p>
					</li>
				</c:forEach>
				<%--<li>
					<p>纯肉鲜肉（水饺） x 2</p>
					<p>&#165;15</p>
				</li>
				<li>
					<p>玉米鲜肉（水饺） x 1</p>
					<p>&#165;16</p>
				</li>--%>
				<li>
					<p>配送费</p>
					<p>&#165;${business.deliveryPrice}</p>
				</li>
			</ul>
			
			<!-- 支付方式部分 -->
			<ul class="payment-type">
				<li>
					<img src="${pageContext.request.contextPath }/img/alipay.png">
					<i class="fa fa-check-circle"></i>
				</li>
				<li>
					<img src="${pageContext.request.contextPath }/img/wechat.png">
				</li>
			</ul>
			<div class="payment-button">
				<button onclick="orderSubmit()">确认支付</button>
			</div>
			
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
				<li onclick="location.href='${pageContext.request.contextPath }/OrdersController/listOrdersByUserId'">
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
