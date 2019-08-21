<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

	<head>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="css/menu.css" />
		<link rel="stylesheet" type="text/css" href="css/bodyAndBottom.css" />
		<link rel="stylesheet" type="text/css" href="css/userCenter.css" />
		<title>用户中心</title>
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
		$(function(){
			window.setInterval("showtime()",1000);
		});
		function showtime(){
			var dt=new Date();
			var str=dt.getFullYear()+"年"+(dt.getMonth()+1)+"月"+dt.getDate()+"日"+dt.getHours()+"："+dt.getMinutes()+"："+dt.getSeconds();
			$("#datetime").html(str);}
	</script>

	<body onload="tips(); setTitle()">


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
			<form id="form" action="${pageContext.request.contextPath}/proscenium/userAction!register.action" method="post">
			<div id="middle_userCenter">
				<table border="2" cellspacing="0" cellpadding="0" bordercolor="orangered">
					<tr>
						<td colspan="3"><b>请填写用户信息(带<font>*</font>为必填项)</b></td>
					</tr>
					<tr>
						<td class="left">用 户 名：</td>
						<td class="center"><input type="text" id="account" name="user.account" onblur="checkInput(this)" />
						<td class="right">
							<font>*</font><span id="tip_account" style="font-size:12px"></span>您用来登录的用户名</td>
					</tr>
					<tr>
						<td class="left">密 码：</td>
						<td class="center"><input type="password" id="password" name="user.password"  onblur="checkInput(this)" />
						<td class="right">
							<font>*</font><span id="tip_password" style="font-size:12px"></span>长度必须大于5个小于16个字符，只能为英语字、数字</td>
					</tr>
					<tr>
						<td class="left">确认密码：</td>
						<td class="center"><input type="password" id="repassword" onblur="checkInput(this)" />
						<td class="right">
							<font>*</font><span id="tip_repassword" style="font-size:12px"></span>请将输入的密码再次输入</td>
					</tr>
					<tr>
						<td class="left">真实姓名：</td>
						<td class="center"><input type="text" id="name" name="user.name"  onblur="checkInput(this)" />
						<td class="right">
							<font>*</font><span id="tip_name" style="font-size:12px"></span>填写您的真实的姓名</td>
					</tr>
					<tr>
						<td class="left">性 别：</td>
						<td align="left">男：<input type="radio" id="gender" name="user.gender" checked="checked" />女：<input type="radio" name="gender" />
						<td class="right">
							<font>*</font>请填写您的真实信息</td>
					</tr>
					<tr>
						<td class="left">生 日：</td>
						<td class="center"><input type="date" id="birthday" name="user.birthday"  onblur="checkInput(this)" />
						<td class="right">
							<font>*</font>请选择您的生日</td>
					</tr>
					<tr>
						<td class="left">身份证号：</td>
						<td class="center"><input type="text" id="IDCard" name="user.IDCard"   onblur="checkInput(this)"/>
						<td class="right">
								<font>*</font><span id="tip_IDCard" style="font-size:12px"></span>请输入18位身份证号 </td>
					</tr>
					<tr>
						<td class="left">家庭住址：</td>
						<td class="center"><input type="text" id="address" name="user.address"  onblur="checkInput(this)" />
						<td class="right">
							<font>*</font><span id="tip_address" style="font-size:12px"></span>请填写您的真实信息</td>
					</tr>
					<tr>
						<td class="left">电话号码：</td>
						<td class="center"><input type="text" id="tel" name="user.tel"  onblur="checkInput(this)" />
						<td class="right">
							<font>*</font><span id="tip_tel" style="font-size:12px"></span>请填写您的真实信息(11位数手机号码)</td>
					</tr>
					<tr>
						<td class="left">电子邮箱：</td>
						<td class="center"><input type="text" id="email" name="user.email"  onblur="checkInput(this)" />
						<td class="right">
							<font>*</font><span id="tip_email" style="font-size:12px"></span>请填写您有效的邮件地址。</td>
						<input type="hidden" name="user.type" value="0"/>
					</tr>
					<tr>
						<td class="left">邮政编码：</td>
						<td class="center"><input type="text" id="postCode" name="user.postCode"  onblur="checkInput(this)" />
						<td class="right">
							<font>*</font><span id="tip_postCode" style="font-size:12px"></span>请填写您的真实信息(格式为111111)</td>
					</tr>

					<tr>
						<td colspan="3">
							<!-- submit：提交时，不管js、jquery的判断，只要点击，就向action跳转 -->
							<!--在开发中做表单提交时，一般使用button-->
							<img src="img/canche_submit.gif" onclick="submitRegist()" style="cursor:pointer">
						</td>
					</tr>
				</table>
			</div>
			</form>
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
	//使用全局变量
	var flag = false;
	//定义一个input框输入失去焦点会执行的方法
	function checkInput(obj){
		//如果账户触发的事件
		if (obj.id == "account") {
			if ($("#"+obj.id).val() != "") {
				//满足要求
				//给账户旁边的span提示：OK
				$("#tip_"+obj.id).html("用户名可用");
				//将字体变为绿色
				$("#tip_"+obj.id).css("color","green");
				flag = true;
			}else {
				//不满足要求
				//给账户旁边的span提示：账户输入不满足格式
				$("#tip_"+obj.id).html("用户名不能为空");
				//将字体变为红色
				$("#tip_"+obj.id).css("color","red");
				flag = false;
			}
		} else if (obj.id == "password") {
			//密码的正则表达式
			//长度必须大于5个小于16个字符，只能为英语字、数字
			var re = /[a-zA-Z0-9]{5,16}/;
			//获取用户输入的账户值
			var userNameInput = $("#password").val();
			//验证输入的账户是否满足正则表达式
			if(re.test(userNameInput)){
				//满足要求
				//给账户旁边的span提示：OK
				$("#tip_"+obj.id).html("密码符合要求！");
				//将字体变为绿色
				$("#tip_"+obj.id).css("color","green");
				flag = true;
			}else{
				//不满足要求
				//给账户旁边的span提示：账户输入不满足格式
				$("#tip_"+obj.id).html("密码不符合要求！");
				//将字体变为红色
				$("#tip_"+obj.id).css("color","red");
				flag = false;
			}
		} else if (obj.id == "repassword") {
			//判断密码前后输入是否一致
			var userPwd = $("#password").val();
			var rePwd = $("#repassword").val();
			if(userPwd==rePwd && userPwd!=""){
				$("#tip_"+obj.id).html("两次密码输入一致！")
				$("#tip_"+obj.id).css("color","green");
				flag =true;
			}else{
				$("#tip_"+obj.id).html("两次密码输入不一致！请重新输入");
				$("#tip_"+obj.id).css("color","red");
				flag = false;
			}
		} else if (obj.id == "name") {
			if ($("#"+obj.id).val() != "") {
				//满足要求
				//给账户旁边的span提示：OK
				$("#tip_"+obj.id).html("姓名可用！");
				//将字体变为绿色
				$("#tip_"+obj.id).css("color","green");
				flag = true;
			}else {
				//不满足要求
				//给账户旁边的span提示：账户输入不满足格式
				$("#tip_"+obj.id).html("姓名不能为空！");
				//将字体变为红色
				$("#tip_"+obj.id).css("color","red");
				flag = false;
			}
		} else if (obj.id == "IDCard") {
			//身份证的正则表达式
			// 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
			var re = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
			//获取用户输入的账户值
			var IDCardInput = $("#IDCard").val();
			//验证输入的身份证是否满足正则表达式
			if(re.test(IDCardInput)){
				//满足要求
				//给账户旁边的span提示：OK
				$("#tip_"+obj.id).html("身份证合法！");
				//将字体变为绿色
				$("#tip_"+obj.id).css("color","green");
				flag = true;
			}else{
				//不满足要求
				//给账户旁边的span提示：账户输入不满足格式
				$("#tip_"+obj.id).html("身份证不合法！");
				//将字体变为红色
				$("#tip_"+obj.id).css("color","red");
				flag = false;
			}
		} else if (obj.id == "address") {
			if ($("#"+obj.id).val() != "") {
				//满足要求
				//给账户旁边的span提示：OK
				$("#tip_"+obj.id).html("地址可用！");
				//将字体变为绿色
				$("#tip_"+obj.id).css("color","green");
				flag = true;
			}else {
				//不满足要求
				//给账户旁边的span提示：账户输入不满足格式
				$("#tip_"+obj.id).html("地址不能为空！");
				//将字体变为红色
				$("#tip_"+obj.id).css("color","red");
				flag = false;
			}
		} else if (obj.id == "tel") {
			if ($("#"+obj.id).val() != "") {
				//满足要求
				//给账户旁边的span提示：OK
				$("#tip_"+obj.id).html("手机号码可用！");
				//将字体变为绿色
				$("#tip_"+obj.id).css("color","green");
				flag = true;
			}else {
				//不满足要求
				//给账户旁边的span提示：账户输入不满足格式
				$("#tip_"+obj.id).html("手机号码不能为空！");
				//将字体变为红色
				$("#tip_"+obj.id).css("color","red");
				flag = false;
			}
		} else if (obj.id == "email") {
			//邮箱
			var re = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			//获取用户输入的账户值
			var emailInput = $("#email").val();
			//验证输入的身份证是否满足正则表达式
			if(re.test(emailInput)){
				//满足要求
				//给账户旁边的span提示：OK
				$("#tip_"+obj.id).html("邮箱可用！");
				//将字体变为绿色
				$("#tip_"+obj.id).css("color","green");
				flag = true;
			}else{
				//不满足要求
				//给账户旁边的span提示：账户输入不满足格式
				$("#tip_"+obj.id).html("请输入正确的邮箱号码！");
				//将字体变为红色
				$("#tip_"+obj.id).css("color","red");
				flag = false;
			}
		} else if (obj.id == "postCode") {
			//邮编的正则表达式
			var re = /^\d{6}$/;
			//获取用户输入的账户值
			var postCodeInput = $("#postCode").val();
			//验证输入的身份证是否满足正则表达式
			if(re.test(postCodeInput)){
				//满足要求
				//给账户旁边的span提示：OK
				$("#tip_"+obj.id).html("邮编可用！");
				//将字体变为绿色
				$("#tip_"+obj.id).css("color","green");
				flag = true;
			}else{
				//不满足要求
				//给账户旁边的span提示：账户输入不满足格式
				$("#tip_"+obj.id).html("请输入正确的6位邮政编码！");
				//将字体变为红色
				$("#tip_"+obj.id).css("color","red");
				flag = false;
			}
		} else {
			if ($("#"+obj.id).val() != "") {
				//满足要求
				//给账户旁边的span提示：OK
				$("#tip_"+obj.id).html("生日可用！");
				//将字体变为绿色
				$("#tip_"+obj.id).css("color","green");
				flag = true;
			}else {
				//不满足要求
				//给账户旁边的span提示：账户输入不满足格式
				$("#tip_"+obj.id).html("生日不能为空！");
				//将字体变为红色
				$("#tip_"+obj.id).css("color","red");
				flag = false;
			}
		}
	}

	function submitRegist() {
		if (
				$("#account").val() != "" &&
				$("#password").val() != "" &&
				$("#repassword").val() != "" &&
				$("#name").val() != "" &&
				$("#birthday").val() != "" &&
				$("#IDCard").val() != "" &&
				$("#address").val() != "" &&
				$("#tel").val() != ""&&
				$("#email").val() != ""&&
				$("#postCode").val() != ""&&
				flag
		){
				$("#form").submit();
		}else {
			alert("您的表单信息输入不完整，请重新输入")

		}

	}



</script>



	</body>

</html>