<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/6/12
  Time: 16:09
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
            <p>添加菜品</p>
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
    <div id="middle" >
        <br/>
        <br/>
        <form action="${pageContext.request.contextPath}/manage/dishesActionM!insertDishes.action" method="post" enctype="multipart/form-data">
            <table align="center" border="1" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="left">菜品名称：</td>
                    <td class="right"><input type="text"name="dishes.name" />
                    </td>
                </tr>
                <tr>
                    <td class="left">原 料：</td>
                    <td class="right"><input type="text" name="dishes.recipe" /></td>
                </tr>
                <tr>
                    <td class="left">市场价格：</td>
                    <td class="right"><input type="text" name="dishes.price" /></td>
                </tr>
                <tr>
                    <td class="left">会员价格：</td>
                    <td class="right"><input type="text" name="dishes.priceAssociator" /></td>
                </tr>
                <tr>
                    <td class="left">说 明：</td>
                    <td class="right"><textarea name="dishes.brief" rows="10" cols="30"></textarea></td>
                </tr>
                <tr>
                    <td class="left">菜品类别：</td>
                    <td class="right">
                        <select name="type">
                            <c:forEach items="${typesList}" var="types">
                                <option value="${types.id}">${types.type}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="left">上传图片：</td>
                    <td class="right"><input type="file" name="imgpath" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="确认添加"/></td>
                </tr>
            </table>
        </form>
        <br/>
        <br/>
    </div>
</div>
</body>

</html>
