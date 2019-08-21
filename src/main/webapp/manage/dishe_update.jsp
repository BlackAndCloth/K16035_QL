<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/6/22
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
            <p>修改菜品</p>
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
        <form action="${pageContext.request.contextPath}/manage/dishesActionM!updateDishes.action" method="post" enctype="multipart/form-data">
            <table align="center" border="1" cellspacing="0" cellpadding="0">
                <input type="hidden" name="dishes.id" value="${dishes.id}"/>
                <input type="hidden" name="dishes.sums" value="${dishes.sums}"/>
                <input type="hidden" name="dishes.sumsAssociator" value="${dishes.sumsAssociator}"/>
                <tr>
                    <td class="left">菜品图片：</td>
                    <td class="right">
                        <img src="${dishes.imgpath}" name="dishes.imgpath" width="100px" height="100px"/>
                    </td>
                </tr>
                <tr>
                    <td class="left">菜品名称：</td>
                    <td class="right"><input type="text" name="dishes.name" value="${dishes.name}" /></td>
                </tr>
                <tr>
                    <td class="left">原 料：</td>
                    <td class="right"><input type="text" name="dishes.recipe" value="${dishes.recipe}" /></td>
                </tr>
                <tr>
                    <td class="left">市场价格：</td>
                    <td class="right"><input type="text" name="dishes.price"  value="${dishes.price}" /></td>
                </tr>
                <tr>
                    <td class="left">会员价格：</td>
                    <td class="right"><input type="text" name="dishes.priceAssociator" value="${dishes.priceAssociator}" /></td>
                </tr>
                <tr>
                    <td class="left">说 明：</td>
                    <td class="right"><textarea name="dishes.brief" rows="10" cols="30">${dishes.brief}</textarea></td>
                </tr>
                <tr>
                    <td class="left">菜品类别：</td>
                    <td class="right">
                        <select name="type">
                            <c:forEach items="${typesList}" var="types">
                                <c:if test="${dishes.types.id == types.id}">
                                    <option value="${types.id}" selected>${types.type}</option>
                                </c:if>
                                <c:if test="${dishes.types.id != types.id}">
                                     <option value="${types.id}">${types.type}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="left">上传图片：</td>
                    <td class="right"><input type="file" name="imgpath"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="确人修改"/></td>
                </tr>
            </table>
        </form>
        <br/>
        <br/>
    </div>
</div>
</body>

</html>
