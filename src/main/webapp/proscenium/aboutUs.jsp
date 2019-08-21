<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

	<head>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="css/menu.css" />
		<link rel="stylesheet" type="text/css" href="css/bodyAndBottom.css" />
		<link rel="stylesheet" type="text/css" href="css/aboutUs.css" />
		<title>关于我们</title>
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
        	作者：luchao7285@163.com
        	时间：2017-03-10
        	描述：背景层
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
			<div id="middle_aboutUs">
				<br/>
				<p align="center" style="font-size: 28px;"><b>关于我们</b></p>
				<br/>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小时候的味道”即便五年十年都没机会再吃，也总是会挂念着，一吃就能想起过往时的味道来。这种味觉记忆，缠绕着思乡的点滴情怀，成为人们最原始的“乡愁”。你也有“小时候的味道”吗？ </p>
				<br/>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎来到阿婆私房菜，让你重温童年妈妈的味道！</p>
				<br/>
				<p align="center">
					<a href="${pageContext.request.contextPath}/proscenium/indexAction!index.action">返回</a>
				</p>
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