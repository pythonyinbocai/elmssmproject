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
		<link href="${pageContext.request.contextPath }/css/order.css" rel="stylesheet">
		<title>饿了么 确认订单</title>
	</head>
	<body>
		<div class="wrapper">
			<!-- header部分 -->
			<header>
				<p>确认订单</p>
			</header>
			<!-- 订单信息部分 -->
			<div class="order-info">
				<h5>订单配送至：</h5>
				<div class="order-info-address">
					<p>${order.deliveryAddress.address}</p>
					<i class="fa fa-angle-right"></i>
				</div>
				<p>${order.deliveryAddress.contactName}&nbsp;&nbsp;${order.deliveryAddress.contactTel}</p>
			</div>
			<h3>${order.business.businessName}</h3>
			<!-- 订单明细部分 -->
			<ul class="order-detailed">
				<c:forEach items="${order.odList}" var="orderDetail">
					<li>
						<div class="order-detailed-left">
							<img src="${orderDetail.food.foodImg}">
							<p>${orderDetail.food.foodName} x ${orderDetail.quantity}</p>
						</div>
						<p>&#165;<span>${orderDetail.food.foodPrice*orderDetail.quantity}</span></p>
					</li>
				</c:forEach>
				<%--<li>
					<div class="order-detailed-left">
						<img src="img/sp01.png">
						<p>纯肉鲜肉（水饺） x 2</p>
					</div>
					<p>&#165;15</p>
				</li>
				<li>
					<div class="order-detailed-left">
						<img src="img/sp02.png">
						<p>玉米鲜肉（水饺） x 1</p>
					</div>
					<p>&#165;16</p>
				</li>--%>
			</ul>
			<div class="order-deliveryfee">
				<p>配送费</p>
				<p>&#165;${order.business.deliveryPrice}</p>
			</div>
			<!-- 合计部分 -->
			<div class="total">
				<div class="total-left">
					&#165;<span>${order.orderTotal}</span>
				</div>
				<div class="total-right" onclick="location.href='${pageContext.request.contextPath }/OrdersController/updateState?orderId=${order.orderId}'">
					去支付
				</div>
			</div>
		</div>	
	</body>
</html>
