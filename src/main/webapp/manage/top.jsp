<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/6/12
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="css/all.css" />
    <link rel="stylesheet" type="text/css" href="css/top.css"/>
    <title></title>
</head>

<body scroll="no">
<div id="background">
    <div>
        <img src="img/logo.gif" />
    </div>
    <div id="title">
        <marquee>管理员：
           ${session.Admin.account}
            您好,感谢登陆使用！</marquee>
    </div>
    <div id="out">
        <a href="${pageContext.request.contextPath}/manage/adminActionM!adminOut.action" target="_top"><img src="img/out.gif" /></a>
    </div>
</div>
</body>
</html>
