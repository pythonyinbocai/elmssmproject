<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>查询食品列表</title>
</head>
<body>
<form action="${pageContext.request.contextPath }/food/tolist.action" method="post">
    查询条件：
    <table width="100%" border=1>
        <tr>
            <td>食品名称：<input name="foodName"></td>
            <td>价格：<input name="lowPrice">--<input name="highPrice"></td>
            <td><input type="submit" value="查询"/></td>
        </tr>
    </table>
    食品列表：
    <table width="100%" border=1>
        <tr>
            <td>食品名称</td>
            <td>食品介绍</td>
            <td>食品价格</td>
            <td>商家</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${foodList }" var="food">
            <tr>
                <td>${food.foodname }</td>
                <td>${food.foodexplain }</td>
                <td>${food.foodprice }</td>
                <td>${food.business.businessname}</td>
                <td>
                    <a href="${pageContext.request.contextPath }/food/toupdate.action?id=${food.foodid}">修改</a>
                    <a href="${pageContext.request.contextPath }/food/delete.action?id=${food.foodid}">删除</a>
                </td>

            </tr>
        </c:forEach>

    </table>
    <a href="${pageContext.request.contextPath }/food/toadd.action">添加</a>

</form>
</body>

</html>