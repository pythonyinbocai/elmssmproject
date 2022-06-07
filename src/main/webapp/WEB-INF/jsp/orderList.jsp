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
		<link href="${pageContext.request.contextPath }/css/orderList.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath }/js/orderList.js"></script>
		<title>饿了么 我的订单</title>
	</head>
	<body>
		
		<div class="wrapper">
			
			<!-- header部分 -->
			<header>
				<p>我的订单</p>
			</header>
			
			<!-- 订单列表部分 -->
			<h3>未支付订单信息：</h3>
<c:if test="${fn:length(orderList)>0}">
			<ul class="order">
				<c:forEach items="${orderList}" var="order">
					<c:if test="${order.orderState==0}">
					<li>
						<div class="order-info">
							<p>
								${order.business.businessName}
								<i class="fa fa-caret-down"></i>
							</p>
							<div class="order-info-right">
								<p>&#165;${order.orderTotal}</p>
								<div class="order-info-right-icon" onclick="location.href='${pageContext.request.contextPath }/OrdersController/getOrdersById?orderId=${order.orderId}'">去支付</div>
							</div>
						</div>
						<ul class="order-detailet">
							<c:forEach items="${order.odList}" var="orderDetail">
								<li>
									<p>${orderDetail.food.foodName} x ${orderDetail.quantity}</p>
									<p>&#165;${orderDetail.food.foodPrice*orderDetail.quantity}</p>
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
								<p>&#165;${order.business.deliveryPrice}</p>
							</li>
						</ul>
					</li>
					</c:if>
				</c:forEach>
				<%--<li>
					<div class="order-info">
						<p>
							万家饺子（软件园E18店）
							<i class="fa fa-caret-down"></i>
						</p>
						<div class="order-info-right">
							<p>&#165;49</p>
							<div class="order-info-right-icon">去支付</div>
						</div>
					</div>
					<ul class="order-detailet">
						<li>
							<p>纯肉鲜肉（水饺） x 2</p>
							<p>&#165;15</p>
						</li>
						<li>
							<p>玉米鲜肉（水饺） x 1</p>
							<p>&#165;16</p>
						</li>
						<li>
							<p>配送费</p>
							<p>&#165;3</p>
						</li>
					</ul>
				</li>
				<li>
					<div class="order-info">
						<p>
							小锅饭豆腐馆（全运店）
							<i class="fa fa-caret-down"></i>
						</p>
						<div class="order-info-right">
							<p>&#165;55</p>
							<div class="order-info-right-icon">去支付</div>
						</div>
					</div>
					<ul class="order-detailet">
						<li>
							<p>纯肉鲜肉（水饺） x 2</p>
							<p>&#165;15</p>
						</li>
						<li>
							<p>玉米鲜肉（水饺） x 1</p>
							<p>&#165;16</p>
						</li>
						<li>
							<p>配送费</p>
							<p>&#165;3</p>
						</li>
					</ul>
				</li>--%>
			</ul>
</c:if>
			<h3>已支付订单信息：</h3>
<c:if test="${fn:length(orderList)>0}">
			<ul class="order">
				<c:forEach items="${orderList}" var="order">
					<c:if test="${order.orderState==1}">
						<li>
							<div class="order-info">
								<p>
										${order.business.businessName}
									<i class="fa fa-caret-down"></i>
								</p>
								<div class="order-info-right">
									<p>&#165;${order.orderTotal}</p>
								</div>
							</div>
							<ul class="order-detailet">
								<c:forEach items="${order.odList}" var="orderDetail">
									<li>
										<p>${orderDetail.food.foodName} x ${orderDetail.quantity}</p>
										<p>&#165;${orderDetail.food.foodPrice*orderDetail.quantity}</p>
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
									<p>&#165;${order.business.deliveryPrice}</p>
								</li>
							</ul>
						</li>
					</c:if>
				</c:forEach>
				<%--<li>
					<div class="order-info">
						<p>
							万家饺子（软件园E18店）
							<i class="fa fa-caret-down"></i>
						</p>
						<div class="order-info-right">
							<p>&#165;49</p>
						</div>
					</div>
					<ul class="order-detailet">
						<li>
							<p>纯肉鲜肉（水饺） x 2</p>
							<p>&#165;15</p>
						</li>
						<li>
							<p>玉米鲜肉（水饺） x 1</p>
							<p>&#165;16</p>
						</li>
						<li>
							<p>配送费</p>
							<p>&#165;3</p>
						</li>
					</ul>
				</li>
				<li>
					<div class="order-info">
						<p>
							小锅饭豆腐馆（全运店）
							<i class="fa fa-caret-down"></i>
						</p>
						<div class="order-info-right">
							<p>&#165;55</p>
						</div>
					</div>
					<ul class="order-detailet">
						<li>
							<p>纯肉鲜肉（水饺） x 2</p>
							<p>&#165;15</p>
						</li>
						<li>
							<p>玉米鲜肉（水饺） x 1</p>
							<p>&#165;16</p>
						</li>
						<li>
							<p>配送费</p>
							<p>&#165;3</p>
						</li>
					</ul>
				</li>--%>
			</ul>
</c:if>
			<!-- 底部菜单部分 -->
			<ul class="footer">
				<li onclick="location.href='index.html'">
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
