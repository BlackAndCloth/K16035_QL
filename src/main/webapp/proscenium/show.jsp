<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

	<head>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="css/menu.css" />
		<link rel="stylesheet" type="text/css" href="css/bodyAndBottom.css" />
		<link rel="stylesheet" type="text/css" href="css/show.css" />
		<title>菜品展示</title>
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
		$(function(){
			window.setInterval("showtime()",1000);
		});
		function showtime(){
			var dt=new Date();
			var str=dt.getFullYear()+"年"+(dt.getMonth()+1)+"月"+dt.getDate()+"日"+dt.getHours()+"："+dt.getMinutes()+"："+dt.getSeconds();
			$("#datetime").html(str);}
	</script>

	<body onload="setTitle()">
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
						<img src="img/logo3.jpg"  />
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
			<div id="middle_show">
				<table border="2" cellspacing="0" cellpadding="0" bordercolor="orangered" align="center">
					<tr>
						<td class="left">菜单名称：</td>
						<td class="right">${dishes.name}</td>
					</tr>
					<tr>
						<td class="left">原料：</td>
						<td class="right">${dishes.recipe}</td>
					</tr>
					<tr>
						<td class="left">市场单价：</td>
						<td class="right">${dishes.price}</td>
					</tr>
					<tr>
						<td class="left">会员单价：</td>
						<td class="right">${dishes.priceAssociator}</td>
					</tr>
					<tr>
						<td class="left">说明：</td>
						<td class="right">${dishes.brief}</td>
					</tr>
					<tr>
						<td class="left">菜品类别：</td>
						<td class="right">${dishes.types.type}</td>
					</tr>
					<tr>
						<td class="left">展示图片：</td>
						<td class="right"><img src="${dishes.imgpath}" width="100px" height="100px"/></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<a href="${pageContext.request.contextPath}/proscenium/indexAction!index.action">返回</a>
						</td>
					</tr>
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