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
		<link href="${pageContext.request.contextPath }/css/businessInfo.css" rel="stylesheet">
		<title>饿了么 商家信息</title>
	</head>
	<body>
		<div class="wrapper">
			
			<!-- header部分 -->
			<header>
				<p>商家信息</p>
			</header>
			
			<!-- 商家logo部分 -->
			<div class="business-logo">
				<img src="${business.businessImg}">
			</div>
			
			<!-- 商家信息部分 -->
			<div class="business-info" data="${business.businessId}">
				<h1>${business.businessName}</h1>
				<p>&#165;<span class="starPrice">${business.starPrice}起送 &#165;<span class="deliveryPrice">${business.deliveryPrice}</span>配送</p>
				<p>${business.businessExplain}</p>
			</div>
			
			<!-- 食品列表部分 -->
			<ul class="food">
				<c:forEach items="${business.foodList}" var="food">
					<li>
						<div class="food-left">
							<img src="${food.foodImg}">
							<div class="food-left-info">
								<h3>${food.foodName}</h3>
								<p>${food.foodExplain}</p>
								<p>&#165;<span class="single-price">${food.foodPrice}</span></p>
							</div>
						</div>
						<div class="food-right">
							<div <c:if test="${food.quantity<=0}">style="display: none"</c:if>>
								<i class="fa fa-minus-circle" onclick="minus(this,${business.businessId},${food.foodId},${food.quantity})"></i>
							</div>
							<p <c:if test="${food.quantity<=0}">style="display: none"</c:if>><span class="food-quantity">${food.quantity}</span></p>
							<div>
								<i class="fa fa-plus-circle" onclick="plus(this,${business.businessId},${food.foodId},${food.quantity})"></i>
							</div>
						</div>
					</li>
				</c:forEach>
				<%--<li>
					<div class="food-left">
						<img src="img/sp01.png">
						<div class="food-left-info">
							<h3>纯肉鲜肉（水饺）</h3>
							<p>新鲜猪肉</p>
							<p>&#165;15</p>
						</div>
					</div>
					<div class="food-right">
						<div>
							<i class="fa fa-minus-circle"></i>
						</div>
						<p><span>3</span></p>
						<div>
							<i class="fa fa-plus-circle"></i>
						</div>
					</div>
				</li>
				<li>
					<div class="food-left">
						<img src="img/sp02.png">
						<div class="food-left-info">
							<h3>玉米鲜肉（水饺）</h3>
							<p>玉米鲜肉</p>
							<p>&#165;16</p>
						</div>
					</div>
					<div class="food-right">
						<div>
							<i class="fa fa-minus-circle"></i>
						</div>
						<p><span>2</span></p>
						<div>
							<i class="fa fa-plus-circle"></i>
						</div>
					</div>
				</li>
				<li>
					<div class="food-left">
						<img src="img/sp03.png">
						<div class="food-left-info">
							<h3>虾仁三鲜（蒸饺）</h3>
							<p>虾仁三鲜</p>
							<p>&#165;22</p>
						</div>
					</div>
					<div class="food-right">
						<div>
						</div>
						<p></p>
						<div>
							<i class="fa fa-plus-circle"></i>
						</div>
					</div>
				</li>
				<li>
					<div class="food-left">
						<img src="img/sp04.png">
						<div class="food-left-info">
							<h3>素三鲜（蒸饺）</h3>
							<p>素三鲜</p>
							<p>&#165;15</p>
						</div>
					</div>
					<div class="food-right">
						<div>
						</div>
						<p></p>
						<div>
							<i class="fa fa-plus-circle"></i>
						</div>
					</div>
				</li>
				<li>
					<div class="food-left">
						<img src="img/sp05.png">
						<div class="food-left-info">
							<h3>角瓜鸡蛋（蒸饺）</h3>
							<p>角瓜鸡蛋</p>
							<p>&#165;16</p>
						</div>
					</div>
					<div class="food-right">
						<div>
						</div>
						<p></p>
						<div>
							<i class="fa fa-plus-circle"></i>
						</div>
					</div>
				</li>
				<li>
					<div class="food-left">
						<img src="img/sp06.png">
						<div class="food-left-info">
							<h3>小白菜肉（水饺）</h3>
							<p>小白菜肉</p>
							<p>&#165;18</p>
						</div>
					</div>
					<div class="food-right">
						<div>
						</div>
						<p></p>
						<div>
							<i class="fa fa-plus-circle"></i>
						</div>
					</div>
				</li>
				<li>
					<div class="food-left">
						<img src="img/sp07.png">
						<div class="food-left-info">
							<h3>芹菜牛肉（水饺）</h3>
							<p>芹菜牛肉</p>
							<p>&#165;18</p>
						</div>
					</div>
					<div class="food-right">
						<div>
						</div>
						<p></p>
						<div>
							<i class="fa fa-plus-circle"></i>
						</div>
					</div>
				</li>--%>
			</ul>
			
			<!-- 购物车部分 -->
			<div class="cart">
				<div class="cart-left">
					<div class="cart-left-icon">
						<i class="fa fa-shopping-cart"></i>
						<div class="cart-left-icon-quantity">0</div>
					</div>
					<div class="cart-left-info">
						<p>&#165;<span class="totalMoney">0.00</span></p>
						<p>另需配送费<span class="realDeliveryPrice">0</span>元</p>
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
					<div class="cart-right-item submitDis" onclick="tobalance()">
					    去结算
					</div>
				</div>
			</div>
			
		</div>	
	</body>
</html>
<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath }/js/decimal.js"></script>
<script src="${pageContext.request.contextPath }/js/cart.js" rel="stylesheet"></script>
