<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>修改食品</h1>
<form action="${pageContext.request.contextPath }/food/updateSubmit.action" method="post">
    <input name="foodid" type="hidden" value="${food.foodid}">
    <p>名称：<input name="foodname" value="${food.foodname}"></p>
    <p>描述：<textarea rows="5" cols="30" name="foodexplain">${food.foodexplain}</textarea></p>
    <p>价格：<input name="foodprice" value="${food.foodprice}"></p>
    <p>商家：<select name="businessid">
        <option value="10001" <c:if test="${food.businessid==10001}">selected</c:if> >万家饺子（软件园E18店）</option>
        <option value="10002" <c:if test="${food.businessid==10002}">selected</c:if>>小锅饭豆腐馆（全运店）</option>
        <c:forEach items="${businessList}" var="item">
            <option value="${item.businessid}" <c:if test="${food.businessid==item.businessid}">selected</c:if> >${item.businessname}</option>
        </c:forEach>
    </select></p>
    <p><input type="submit"></p>
</form>
</body>
</html>
