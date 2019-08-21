<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/6/12
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="css/all.css" />
    <link rel="stylesheet" type="text/css" href="css/context.css" />
    <title></title>
</head>

<body id="background">
<div id="body">
    <!--
        时间：2017-03-11
        描述：设置页头
    -->
    <div id="top">
        <div>
            <img src="img/left-top-right.gif" />
        </div>
        <div id="title">
            <p>类别信息</p>
        </div>
        <div id="top_body">
            <img src="img/content-bg.gif" height="31px" />
        </div>
        <div>
            <img src="img/nav-right-bg.gif" />
        </div>
    </div>
    <!--
        时间：2017-03-11
        描述：设置页中
    -->
    <div id="middle">
        <br/>
        <br/>
        <table align="center" border="1" cellspacing="0" cellpadding="0">
            <tr class="head">
                <td colspan="4">本日销售额统计</td>
            </tr>
            <tr class="head">
                <td>菜品名称</td>
                <td>订购数量</td>
                <td>单价</td>
                <td>合计</td>
            </tr>
            <c:forEach items="${ordersList}" var="orders">
            <tr>
                <td>${orders.dishes.name}</td>
                <td>${orders.dishesSum}</td>
                <td>${orders.dishes.price}</td>
                <td>${orders.dishes.price * orders.dishesSum}</td>
            </tr>
            </c:forEach>
            <tr class="head">
                <td colspan="11">共${pageSum}页
                    <a href="${pageContext.request.contextPath}/manage/typesActionM!selectTypesAll.action?page=1">[首页]</a>
                    <c:forEach var="pageNum" begin="1" end="${pageSum}">
                        <a href="${pageContext.request.contextPath}/manage/typesActionM!selectTypesAll.action?page=${pageNum}">${pageNum}</a>
                    </c:forEach>
                    <a href="${pageContext.request.contextPath}/manage/typesActionM!selectTypesAll.action?page=${pageSum}">[尾页]</a>
                </td>
            </tr>
        </table>
        <br/>
        <br/>
    </div>
</div>
</body>

</html>
