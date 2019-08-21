<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

	<head>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="css/menu.css" />
		<link rel="stylesheet" type="text/css" href="css/bodyAndBottom.css" />
		<link rel="stylesheet" type="text/css" href="css/diner.css" />
		<title>我的餐车</title>
	</head>
	<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
	<script>
		function setTitle() {
			var title = "${sessionScope.get("loggedUser").name}"
			if (title != ""){
				$("#welcome").html("亲爱的 " + title + " 您好! 欢迎光临!");
			} else {
				$("#welcome").html("亲爱的，你还没有登录哦！");
			}
		}

		function tips(){
			var tips = "${Tips}";
			if (tips != ""){
				alert(tips);
			}
		}
		$(function(){
			window.setInterval("showtime()",1000);
		});
		function showtime(){
			var dt=new Date();
			var str=dt.getFullYear()+"年"+(dt.getMonth()+1)+"月"+dt.getDate()+"日"+dt.getHours()+"："+dt.getMinutes()+"："+dt.getSeconds();
			$("#datetime").html(str);}
	</script>

	<body onload="setTitle() ;tips()">
		<!--
        	作者：luchao7285@163		
            	作者：luchao7285@163.com
            	时间：2017-03-10
            	描述：上层
            -->
		<div id="background">
			<!--
            	作者：luchao7285@163.com
            	时间：2017-03-10
            	描述：上层
            -->
			<div id="top">
				<!--
                	作者：luchao7285@163.com
                	时间：2017-03-10
                	描述：上层上块
                -->
				<div id="top_up">
					<ul>
						<li>
							<a href="login.jsp">会员登录</a>
						</li>|
						<li>
							<a href="userCenter.jsp">会员注册</a>
						</li>|
						<li>
							<a href="${pageContext.request.contextPath}/proscenium/indexAction!logout.action">注销退出</a>
						</li>|
						<li>
							<a href="description.jsp">配送说明</a>
						</li>|
						<li>
							<a href="aboutUs.jsp">关于我们</a>
						</li>
					</ul>
				</div>
				<!--
                	作者：luchao7285@163.com
                	时间：2017-03-10
                	描述：上层下块
                -->
				<div>
					<!--
                	作者：luchao7285@163.com
                	时间：2017-03-10
                	描述：上层下块左
                -->
					<div style="float: left;">
						<img src="img/logo3.jpg"  />
					</div>
					<div  style="float: left;">
						<img src="img/dragon.png" />
					</div>
					<!--
                	作者：luchao7285@163.com
                	时间：2017-03-10
                	描述：上层下块右
                -->
					<div id="top_bottom_right">
						<div id="title">
							<span id="welcome"></span>
							<span id="datetime"></span>
							<%--亲爱的 ${sessionScope.get("loggedUser").name} 您好! 欢迎光临!--%>
						</div>
						<ul>
							<li>
								<a href="${pageContext.request.contextPath}/proscenium/indexAction!index.action"><b>首页</b></a>
							</li>
							<li>
								<a href="diner.jsp"><b>我的餐车</b></a>
							</li>
							<li>
								<a href="order.jsp"><b>我的订单</b></a>
							</li>
							<li>
								<a href="userCenter.jsp"><b>用户中心</b></a>
							</li>
							<li>
								<a href="description.jsp"><b>配送说明</b></a>
							</li>
							<li>
								<a href="aboutUs.jsp"><b>关于我们</b></a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/proscenium/indexAction!logout.action"><b>注销退出</b></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!--
            	作者：luchao7285@163.com
            	时间：2017-03-10
            	描述：中层
            -->
			<%--<table>--%>
				<%--<c:forEach items="${sessionScope.shoppingCartList}" var="shoppingCart">--%>
					<%--<tr>--%>
						<%--<td width="120px" align="center">${shoppingCart.dishes.name}</td>--%>
						<%--<td width="56px" align="center">${shoppingCart.dishes.price}</td>--%>
						<%--<td width="56px" align="center">${shoppingCart.dishesSum}</td>--%>
					<%--</tr>--%>
				<%--</c:forEach>--%>
			<%--</table>--%>
			<%--<div id="diner_context_foot">--%>
				<%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小计：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
				<%--<font id="priceSum">${priceSum}</font>元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
				<%--<font id="dishesSum">${dishesSum}</font>份--%>
			<%--</div>--%>



			<div id="middle_diner">
				<table border="2" cellspacing="0" cellpadding="0" bordercolor="orangered">
					<tr>
						<td colspan="3"><b>我的订餐信息列表</b></td>
					</tr>
					<tr>
						<td width="250px">菜品名称</td>
						<td width="150px">单价</td>
						<td width="150px">数量</td>
					</tr>
					<c:forEach items="${sessionScope.shoppingCartList}" var="shoppingCart">
					<tr>
					<td width="250px" align="center">${shoppingCart.dishes.name}</td>
					<td width="150px" align="center">${shoppingCart.dishes.price}</td>
					<td width="150px" align="center">${shoppingCart.dishesSum}</td>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="3">小计：
							<font>${sessionScope.priceSum}</font>元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共：
							<font>${sessionScope.dishesSum}</font>份</td>
					</tr>
					<tr>
						<td colspan="3">
							<a href="${pageContext.request.contextPath}/proscenium/ordersAction!placeOrders.action"><img src="img/canche_submit.gif" /></a>
							<a href="${pageContext.request.contextPath}/proscenium/ordersAction!clearShoppingCart2.action"><img src="img/quxiao2.gif" /></a>
						</td>
					</tr>
				</table>
			</div>
			<!--
        	作者：luchao7285@163.com
        	时间：2017-03-11
        	描述：下层
        	-->
			<div id="bottom" style="margin-top: 50px;">
				<ul>
					<li>
						<a href="aboutUs.jsp">关于我们</a>
					</li>|
					<li>
						<a href="description.jsp">配送说明</a>
					</li>|
				</ul>
				Copyright(C)2015-2020
			</div>
		</div>
	</body>

</html>