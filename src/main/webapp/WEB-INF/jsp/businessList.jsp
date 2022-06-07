<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link href="${pageContext.request.contextPath }/framework/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/framework/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/businessList.css" rel="stylesheet">
    <title>饿了么 商家列表</title>
</head>
<body>
<div class="wrapper">

    <!-- header部分 -->
    <header>
        <p>商家列表</p>
    </header>

    <!-- 商家列表部分 -->
    <ul class="business">
        <c:forEach items="${businessList}" var="item">
            <li onclick="location.href='${pageContext.request.contextPath }/business/getBusinessById?id=${item.businessId}'">
                <div class="business-img">
                    <img src="${item.businessImg}">
                    <c:if test="${item.quantity>0}">
                        <div class="business-img-quantity">${item.quantity}</div>
                    </c:if>
                </div>
                <div class="business-info">
                    <h3>${item.businessName}</h3>
                    <p>&#165;${item.starPrice}起送 | &#165;${item.deliveryPrice}配送</p>
                    <p>${item.businessExplain}</p>
                </div>
            </li>
        </c:forEach>
        <%--<li onclick="location.href='businessInfo.html'">
            <div class="business-img">
                <img src="img/sj01.png">
                <div class="business-img-quantity">3</div>
            </div>
            <div class="business-info">
                <h3>万家饺子（软件园E18店）</h3>
                <p>&#165;15起送 | &#165;3配送</p>
                <p>各种饺子炒菜</p>
            </div>
        </li>
        <li onclick="location.href='businessInfo.html'">
            <div class="business-img">
                <img src="img/sj02.png">
                <div class="business-img-quantity">2</div>
            </div>
            <div class="business-info">
                <h3>小锅饭豆腐馆（全运店）</h3>
                <p>&#165;15起送 | &#165;3配送</p>
                <p>特色美食</p>
            </div>
        </li>
        <li onclick="location.href='businessInfo.html'">
            <div class="business-img">
                <img src="img/sj03.png">
                <div class="business-img-quantity">1</div>
            </div>
            <div class="business-info">
                <h3>麦当劳麦乐送（全运路店）</h3>
                <p>&#165;15起送 | &#165;3配送</p>
                <p>汉堡薯条</p>
            </div>
        </li>
        <li onclick="location.href='businessInfo.html'">
            <div class="business-img">
                <img src="img/sj04.png">
            </div>
            <div class="business-info">
                <h3>米村拌饭（浑南店）</h3>
                <p>&#165;15起送 | &#165;3配送</p>
                <p>各种炒菜拌饭</p>
            </div>
        </li>
        <li onclick="location.href='businessInfo.html'">
            <div class="business-img">
                <img src="img/sj05.png">
            </div>
            <div class="business-info">
                <h3>申记串道（中海康城店）</h3>
                <p>&#165;15起送 | &#165;3配送</p>
                <p>烤串炸串</p>
            </div>
        </li>
        <li onclick="location.href='businessInfo.html'">
            <div class="business-img">
                <img src="img/sj06.png">
            </div>
            <div class="business-info">
                <h3>半亩良田排骨米饭</h3>
                <p>&#165;15起送 | &#165;3配送</p>
                <p>排骨米饭套餐</p>
            </div>
        </li>
        <li onclick="location.href='businessInfo.html'">
            <div class="business-img">
                <img src="img/sj07.png">
            </div>
            <div class="business-info">
                <h3>茶兮鲜果饮品（国际软件园店）</h3>
                <p>&#165;15起送 | &#165;3配送</p>
                <p>甜品饮品</p>
            </div>
        </li>
        <li onclick="location.href='businessInfo.html'">
            <div class="business-img">
                <img src="img/sj08.png">
            </div>
            <div class="business-info">
                <h3>唯一水果捞（软件园E18店）</h3>
                <p>&#165;15起送 | &#165;3配送</p>
                <p>新鲜水果</p>
            </div>
        </li>
        <li onclick="location.href='businessInfo.html'">
            <div class="business-img">
                <img src="img/sj09.png">
            </div>
            <div class="business-info">
                <h3>满园春饼（全运路店）</h3>
                <p>&#165;15起送 | &#165;3配送</p>
                <p>各种春饼</p>
            </div>
        </li>--%>
    </ul>

    <!-- 底部菜单部分 -->
    <ul class="footer">
        <li onclick="location.href='${pageContext.request.contextPath }/'">
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
