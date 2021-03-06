<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

	<head>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="css/menu.css" />
		<link rel="stylesheet" type="text/css" href="css/bodyAndBottom.css" />
		<link rel="stylesheet" type="text/css" href="css/order.css" />
		<title>我的订单</title>
	</head>
	<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
	<script>

		function isLogged() {
			var name = "${sessionScope.get("loggedUser").name}"
			if (name != ""){
				//已登录

				//不做操作  正常访问网页
			} else {
				//未登录
				//提示，跳转到登录页面
				alert("对不起！您还未登录，即将为您跳转到登录页面。");
				window.location.href="login.jsp";
			}
		}

		function setTitle() {
			var title = "${sessionScope.get("loggedUser").name}"
			if (title != ""){
				$("#welcome").html("亲爱的 " + title + " 您好! 欢迎光临!");
			} else {
				$("#welcome").html("亲爱的，你还没有登录哦！");
			}
		}
		
		function getOderPrice(id ,price, sum) {
			var oderPrice = price * sum;
			$("#oderPrice_"+ id).html(oderPrice);
		}

		function getDelivery(id , i) {
			if (i == 0){
				$("#delivery_"+ id).html("否");
			} else if (i == 1){
				$("#delivery_"+ id).html("是");
			} else if (i == 2){
				$("#delivery_"+ id).html("已取消");
			} else {
				$("#delivery_"+ id).html("未知");
			}

		}

		function tips(){
			var tips = "${Tips}";
			if (tips != ""){
				alert(tips);
			}
		}

		function search() {
			$("#search").submit();
		}
		$(function(){
			window.setInterval("showtime()",1000);
		});
		function showtime(){
			var dt=new Date();
			var str=dt.getFullYear()+"年"+(dt.getMonth()+1)+"月"+dt.getDate()+"日"+dt.getHours()+"："+dt.getMinutes()+"："+dt.getSeconds();
			$("#datetime").html(str);}
	</script>

	<body onload="setTitle() ; isLogged(); tips()">
		<!--
        	时间：2017-03-10
        	描述：背景层
        -->
		<div id="background">
			<!--
            	时间：2017-03-10
            	描述：上层
            -->
			<div id="top">
				<!--
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
                	时间：2017-03-10
                	描述：上层下块
                -->
				<div>
					<!--
                	时间：2017-03-10
                	描述：上层下块左
                -->
					<div style="float: left;">
						<img src="img/logo3.jpg" />
					</div>
					<div  style="float: left;">
						<img src="img/dragon.png" />
					</div>
					<!--
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
            	时间：2017-03-10
            	描述：中层
            -->
			<div id="middle_order">
				<table border="2" cellspacing="0" cellpadding="0" bordercolor="orangered">




					<tr>
						<td width="200px" align="right">按菜品名称查询</td>
						<td width="300px" align="left">
							<form action="${pageContext.request.contextPath}/proscenium/ordersAction!getOrdersByName.action" id="search">
								<input type="text" name="dishesName" />
								<img src="img/search5.gif" onclick="search()" style="cursor:pointer" />
							</form>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<a href="${pageContext.request.contextPath}/proscenium/ordersAction!getOrdersAllByUserId.action">我的所有订单</a>
							<a href="${pageContext.request.contextPath}/proscenium/ordersAction!getOrdersBy0.action">未已派送订单</a>
							<a href="${pageContext.request.contextPath}/proscenium/ordersAction!getOrdersBy1.action">已派送订单</a>
						</td>
					</tr>
				</table>
				<br/>
				<table border="2" cellspacing="0" cellpadding="0" bordercolor="orangered">
					<tr>
						<td colspan="9"><b>订单查询结果信息列表</b></td>
					</tr>
					<tr id="list_title">
						<td>菜品名称</td>
						<td>真实姓名</td>
						<td>订购电话</td>
						<td>派送地址</td>
						<td>订购数量</td>
						<td>单价(元)</td>
						<td>合计(元)</td>
						<td style="width: 160px;">订购时间</td>
						<td>是否派送</td>
					</tr>
					<%--//创建与表对应的属性--%>
					<%--private Integer id;--%>
					<%--//下单者--%>
					<%--private Users orderUser;--%>
					<%--//对应菜品--%>
					<%--private Dishes oderDishes;--%>
					<%--//订购数量--%>
					<%--private Integer dishesSum;--%>
					<%--//订单时间--%>
					<%--private Date dateTime;--%>
					<%--//订单状态--%>
					<%--private Integer delivery;--%>
					<c:forEach items="${ordersLists}" var="orders">
						<tr>
							<td>${orders.oderDishes.name}</td>
							<td>${orders.orderUser.name}</td>
							<td>${orders.orderUser.tel}</td>
							<td>${orders.orderUser.address}</td>
							<td>${orders.dishesSum}</td>
							<td>${orders.oderDishes.price}</td>
							<td id="oderPrice_${orders.id}">
								<script>
									getOderPrice(${orders.id} , ${orders.oderDishes.price} , ${orders.dishesSum});
								</script>
							</td>
							<td>${orders.dateTime}</td>
							<td id="delivery_${orders.id}">
								<script>
									getDelivery(${orders.id} , ${orders.delivery});
								</script>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!--
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