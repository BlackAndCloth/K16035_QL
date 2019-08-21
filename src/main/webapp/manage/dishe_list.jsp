<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/6/12
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <p>菜品信息</p>
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
                <td colspan="11">菜单信息列表</td>
            </tr>
            <tr class="head">
                <td>菜单名称</td>
                <td>展示图片</td>
                <td>原料</td>
                <td>类型</td>
                <td>说明</td>
                <td>市场价格</td>
                <td>市场价销售数量</td>
                <td>会员单价</td>
                <td>会员价销售数量</td>
                <td colspan="2">操作</td>
            </tr>
            <c:forEach items="${dishesList}" var="dish">
            <tr>
                <td>${dish.name}</td>
                <td><img src="${dish.imgpath}" width="30px" height="30px" /></td>
                <td>${dish.recipe}</td>
                <td>${dish.types.type}</td>
                <td>${dish.brief}</td>
                <td>${dish.price}</td>
                <td>${dish.sums}</td>
                <td>${dish.priceAssociator}</td>
                <td>${dish.sumsAssociator}</td>
                <td><a href="${pageContext.request.contextPath}/manage/dishesActionM!selectDishesById.action?id=${dish.id}">修改</a></td>
                <td><a href="${pageContext.request.contextPath}/manage/dishesActionM!deleteDishesById.action?id=${dish.id}">刪除</a></td>
            </tr>
            </c:forEach>
            <tr class="head">
                <td colspan="11">共${pageSum }页
                    <a href="${pageContext.request.contextPath}/manage/dishesActionM!selectDishesAll.action?page=1">[首页]</a>
                    <c:forEach var="pageNum" begin="1" end="${pageSum }">
                        <a href="${pageContext.request.contextPath}/manage/dishesActionM!selectDishesAll.action?page=${pageNum}">${pageNum }</a>
                    </c:forEach>
                    <a href="${pageContext.request.contextPath}/manage/dishesActionM!selectDishesAll.action?page=${pageSum}">[尾页]</a>
                </td>
            </tr>
        </table>
        <br/>
        <br/>
    </div>
</div>
</body>
</html>
