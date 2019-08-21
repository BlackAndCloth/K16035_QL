<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/6/12
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="css/index.css" />
    <link rel="stylesheet" type="text/css" href="css/all.css" />
    <title></title>
</head>
<script type="text/javascript">
    function select(){
        if(self!=top){
            //不是顶层页面
            top.location.href="./index.jsp";
        }
    }

</script>


<style type="text/css">

</style>

<body onload="select()">
<!--
    时间：2017-03-11
    描述：中部
-->
<div>
    <!--
        时间：2017-03-11
        描述：中部上
    -->
    <div id="body_top"></div>
    <!--
        时间：2017-03-11
        描述：中部中
    -->
    <div id="body_middle">
        <div id="body_middle_context">
            <div id="logo">
                <img src="img/logo.png" />
            </div>
            <div id="contacts">
                <p>
                    <img src="img/icon-mail2.gif" />客户服务邮箱：
                    <a href="#">admin@apsfc.com</a>
                </p>
                <p>
                    <img src="img/icon-phone.gif" />官方网站：
                    <a href="#">http://www.apsfc.com</a>
                </p>
            </div>
            <div id="instruction">
                <img src="img/icon-demo.gif" />
                <a href="#">使用说明</a> <img src="img/icon-login-seaver.gif" />
                <a href="#">在线客服</a>
            </div>
        </div>
        <div id="body_middle_context">
            <form action="${pageContext.request.contextPath}/manage/adminActionM!adminLogin.action" method="post">
                <table id="login">
                    <tr>
                        <td colspan="2"><b style="font-size: 16px;">登陆网上订餐后台管理</b></td>
                    </tr>
                    <tr>
                        <td class="left">管理员：</td>
                        <td class="right"><input type="text" name="admin.account" /></td>
                    </tr>
                    <tr>
                        <td class="left">密码：</td>
                        <td class="right"><input type="password" name="admin.password" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="checkbox" name="cookiesave" />5天内自动登录</td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" id="submit"><input type="submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="重置" /></td>
                    </tr>
                </table>
            </form>
            <div id="imgwel">
                <img src="img/login-wel.gif" />
            </div>
        </div>
    </div>
    <!--
        时间：2017-03-11
        描述：中部下
    -->
    <div id="body_bottom">Copyright © 2015-2020</div>
</div>
</body>

</html>
