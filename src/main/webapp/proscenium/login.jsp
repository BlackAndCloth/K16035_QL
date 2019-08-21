<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

	<head>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="css/menu.css" />
		<link rel="stylesheet" type="text/css" href="css/bodyAndBottom.css" />
		<link rel="stylesheet" type="text/css" href="css/login.css" />
		<title>用户登陆</title>
	</head>

	<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
	<script>
		function tips(){
			var tips = "${Tips}";
			if (tips != ""){
				alert(tips);
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

		function isLogged() {
			var name = "${sessionScope.get("loggedUser").name}"
			if (name != ""){
				//已登录
				//提示，跳转到登录页面
				alert("亲爱的，你已经登录过了，无需重复登录。即将为您跳转到主页。");
				window.location.href="${pageContext.request.contextPath}/proscenium/indexAction!index.action";

			} else {
				//未登录
				//不做操作  正常访问网页

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

	<body onload="tips(); setTitle(); isLogged()">
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
			<div id="middle_login">
				<!--
                	时间：2017-03-11
                	描述：登陆框背板
                -->
				<div id="login_background">
					<!--
                    	时间：2017-03-11
                    	描述：登陆框
                    -->
					<div id="login_input">
						<form name="login" id="login" method="post" action="${pageContext.request.contextPath}/proscenium/userAction!login.action">
							<div class="input">账号： <input type="text" id="account" name="account" /></div>
							<div class="input">密码： <input type="password" id="password" name="password" /></div>
							<div align="center">
								<%--<input type="submit" id="submit" value="" />--%>
								<a href="javascript:submitLogin()"><img src="img/canche_submit.gif" /></a>
									<%--<img src="img/canche_submit.gif" onclick="submitLogin()">--%>
								<a href="userCenter.jsp"><img src="img/zhuce.gif" /></a>
							</div>
						</form>
					</div>
					<!--
                    	时间：2017-03-11
                    	描述：登陆提示
                    -->
					<div id="login_title">
						<ul>
							<li>如果您已经是会员，请在左侧登录</li>
							<li>如果您还没有注册会员，
								<a href="userCenter.jsp" id="register">点这里注册新会员</a>
							</li>
							<li>如果您忘记了密码，
								<a href="#" id="resetpassword">点这里重设一个密码</a>
							</li>
						</ul>
					</div>
				</div>
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
	
	<script>
		function submitLogin() {
			if ($("#account").val() != "" && $("#password").val() != ""
			){
				$("#login").submit();
			}else {
				alert("您的表单信息输入不完整，请重新输入")

			}
		}
	</script>
	
	
	</body>

</html>z