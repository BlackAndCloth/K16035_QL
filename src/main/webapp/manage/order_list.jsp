<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/6/12
  Time: 16:12
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
            <p>订单信息</p>
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
                <td colspan="12">销售订单查询结果信息列表</td>
            </tr>
            <tr class="head">
                <td>用户ID</td>
                <td>真实姓名</td>
                <td>联系方式</td>
                <td>家庭住址</td>
                <td>菜品名称</td>
                <td>订购数量</td>
                <td>单价(元)</td>
                <td>合计(元)</td>
                <td>订购时间</td>
                <td>是否派送</td>
                <td colspan="2">确认订单</td>
            </tr>
            <c:forEach items="${ordersList}" var="orders">
            <tr>
                <td>${orders.id}</td>
                <td>${orders.user.name}</td>
                <td>${orders.user.tel}</td>
                <td>${orders.user.address}</td>
                <td>${orders.dishes.name}</td>
                <td>${orders.dishesSum}</td>
                <td>${orders.dishes.price}</td>
                <td>${orders.dishes.price * orders.dishesSum}</td>
                <td>${orders.dateTime}</td>
                <td>
                    <c:if test="${orders.delivery == 1}">
                        是
                    </c:if>
                    <c:if test="${orders.delivery == 0}">
                        否
                    </c:if>
                    <c:if test="${orders.delivery == 2}">
                        已取消
                    </c:if>
                </td>
                <td>
                    <c:if test="${orders.delivery == 0}">
                        <a href="${pageContext.request.contextPath}/manage/ordersActionM!updateOrderFlagYes.action?id=${orders.id}">派送</a>
                    </c:if>
                    <c:if test="${orders.delivery != 2}">
                        <a href="${pageContext.request.contextPath}/manage/ordersActionM!updateOrderFlagNo.action?id=${orders.id}">取消订单</a>
                    </c:if>
                </td>
            </tr>
            </c:forEach>
            <tr class="head">
                <td colspan="12">共${pageSum}页
                    <a href="${pageContext.request.contextPath}/manage/ordersActionM!selectOrdersAll.action?page=1">[首页]</a>
                    <c:forEach var="pageNum" begin="1" end="${pageSum }">
                        <a href="${pageContext.request.contextPath}/manage/ordersActionM!selectOrdersAll.action?page=${pageNum}">${pageNum}</a>
                    </c:forEach>
                    <a href="${pageContext.request.contextPath}/manage/ordersActionM!selectOrdersAll.action?page=${pageSum}">[尾页]</a>
                </td>
            </tr>
        </table>
        <br/>
        <br/>
    </div>
</div>
</body>
</html>
