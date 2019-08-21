<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/6/12
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/all.css"/>
    <title>后台管理系统</title>
    <script>
        window.onload=function () {
            var account =  "${sessionScope.get("Admin").account}";
            if(account == null || account == ""){
                window.location.href="./index.jsp";
            }
        }
    </script>
</head>
<frameset rows="64px,*" noresize="noresize" frameborder="0">
    <frame src="top.jsp" scrolling="no"/>
    <frameset cols="200px,*" noresize="noresize">
        <frame src="menu.jsp"/>
        <frame src="${pageContext.request.contextPath}/manage/dishesActionM!selectDishesAll.action?page=1" name="right"/>
    </frameset>
</frameset>
</html>
