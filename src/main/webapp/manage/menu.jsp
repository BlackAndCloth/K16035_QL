<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/6/12
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="css/all.css" />
    <link rel="stylesheet" type="text/css" href="css/menu.css"/>
    <title></title>
</head>

<body id="background">
<div id="menu">
    <ul>
        <li class="fmenu"><b>菜单管理</b>
            <ul>
                <li class="menupic"><img src="img/menu_topline.gif" /></li>
                <li class="menus"><a href="${pageContext.request.contextPath}/manage/dishesActionM!insertDishesPage.action" target="right">添加新菜单</a></li>
                <li class="menus"><a href="${pageContext.request.contextPath}/manage/dishesActionM!selectDishesAll.action?page=1" target="right">菜单信息列表</a></li>
            </ul>
        </li>
        <li class="fmenu"><b>菜单类别管理</b>
            <ul>
                <li class="menupic"><img src="img/menu_topline.gif" /></li>
                <li class="menus"><a href="type_save.jsp" target="right">添加新类别</a></li>
                <li class="menus"><a href="${pageContext.request.contextPath}/manage/typesActionM!selectTypesAll.action?page=1" target="right">类别信息列表</a></li>
            </ul>
        </li>
        <li class="fmenu"><b>公告信息管理</b>
            <ul>
                <li class="menupic"><img src="img/menu_topline.gif" /></li>
                <li class="menus"><a href="notice_save.jsp" target="right">添加新通告</a></li>
                <li class="menus"><a href="${pageContext.request.contextPath}/manage/noticeActionM!selectNoticeAll.action?page=1" target="right">通告信息列表</a></li>
            </ul>
        </li>
        <li class="fmenu"><b>销售订单管理</b>
            <ul>
                <li class="menupic"><img src="img/menu_topline.gif" /></li>
                <li class="menus"><a href="${pageContext.request.contextPath}/manage/ordersActionM!selectOrdersAll.action?page=1" target="right">销售订单信息列表</a></li>
                <li class="menus"><a href="${pageContext.request.contextPath}/manage/ordersActionM!selectOrdersPage.action?page=1" target="right">销售订单查询</a></li>
                <li class="menus"><a href="${pageContext.request.contextPath}/manage/ordersActionM!selectOrdersToday.action?page=1" target="right">本日销售统计</a></li>
            </ul>
        </li>
        <li class="fmenu"><b><a href="system.jsp" target="right" id="system">系统用户管理</a></b></li>
        <li class="fmenu"><b><a href="${pageContext.request.contextPath}/manage/adminActionM!adminOut.action" target="_top">注销退出</a></b></li>
    </ul>
</div>
</body>
</html>
