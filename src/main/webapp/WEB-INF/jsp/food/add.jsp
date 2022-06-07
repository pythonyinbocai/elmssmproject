<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>添加食品</title>
</head>
<body>
    <h1>添加食品</h1>
<form action="${pageContext.request.contextPath }/food/addSubmit.action" method="post">
    <p>名称：<input name="foodname"></p>
    <p>描述：<textarea rows="5" cols="30" name="foodexplain"></textarea></p>
    <p>价格：<input name="foodprice"></p>
    <p>商家：<select name="businessid">
        <option value="0" selected>请选择</option>
        <c:forEach items="${businessList}" var="item">
            <option value="${item.businessid}">${item.businessname}</option>
        </c:forEach>
    </select></p>
    <p><input type="submit"></p>
</form>
</body>
</html>
