<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/6/23
  Time: 9:09
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
            <p>修改公告</p>
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
        <br /> <br />
        <form action="${pageContext.request.contextPath}/manage/noticeActionM!updateNoticeById.action?id=${notice.id}" method="post">
            <table align="center" border="1" cellspacing="0" cellpadding="0">
                <input type="hidden" name="notice.id" value="${notice.id}"/>
                <tr>
                    <td class="left">公告标题：</td>
                    <td class="right"><input type="text" name="notice.title" value="${notice.title}"/></td>
                </tr>
                <tr>
                    <td class="left">公告内容：</td>
                    <td class="right"><textarea name="notice.content" rows="10" cols="30">${notice.content}</textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" /></td>
                </tr>
            </table>
        </form>
        <br /> <br />
    </div>
</div>
</body>
</html>

