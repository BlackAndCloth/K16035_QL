<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8" />
	<link rel="stylesheet" type="text/css" href="css/menu.css" />
	<link rel="stylesheet" type="text/css" href="css/context.css" />
	<link rel="stylesheet" type="text/css" href="css/bodyAndBottom.css" />
	<title>青龙黑暗料理</title>
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
    描述：背景层
-->
<div id="background">
	<!--
        描述：上层
    -->
	<div id="top">
		<!--
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
            描述：上层下块
        -->
		<div>
			<!--
            描述：上层下块左
        -->
			<div style="float: left;">
				<img src="img/logo3.jpg" />
			</div>
			<div style="float: left;">
				<img src="img/dragon.png" />
			</div>
			<!--
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
						<a href=${pageContext.request.contextPath}/proscenium/indexAction!index.action><b>首页</b></a>
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
        描述：中层
    -->
	<div id="middle_index">
		<!--
            描述：中层左部
        -->
		<div id="middle_left">
			<!--
                描述：中层左部内容
            -->


			<c:forEach items="${dishesList}" var="dishes">
				<div class="context">
					<div class="context_top">
						<div class="context_img">
							<img src="${dishes.imgpath}" width="160" height="122" />
						</div>
						<div class="context_font">
							菜名: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>${dishes.name}</b><br/> 市场价格: ${dishes.price}<br/> 会员价格:
							<font><b>${dishes.priceAssociator}</b></font><br/> 配料: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dishes.recipe}<br/> <br/> <br/> 菜品类型: ${dishes.types.type}
						</div>
					</div>
					<div class="context_button">
						<form id="form_${dishes.id}" action="${pageContext.request.contextPath}/proscenium/ordersAction!addToShoppingCart.action?dishesPage=${dishesPage}" method="post">
							<input name="dishes.id" type="hidden" value="${dishes.id}">
							<input name="dishes.name" type="hidden" value="${dishes.name}">
							<input name="dishes.types.id" type="hidden" value="${dishes.types.id}">
							<input name="dishes.types.type" type="hidden" value="${dishes.types.type}">
							<input name="dishes.recipe" type="hidden" value="${dishes.recipe}">
							<input name="dishes.brief" type="hidden" value="${dishes.brief}">
							<input name="dishes.price" type="hidden" value="${dishes.price}">
							<input name="dishes.sums" type="hidden" value="${dishes.sums}">
							<input name="dishes.priceAssociator" type="hidden" value="${dishes.priceAssociator}">
							<input name="dishes.sumsAssociator" type="hidden" value="${dishes.sumsAssociator}">
							<input name="dishes.imgpath" type="hidden" value="${dishes.imgpath}">
							<%--<a href="javascript:addToShoppingCart(${dishes.name})"><img src="img/img_dinggou.gif" /></a>--%>
                            数量：<input name="dishesSum" type="text" style="width: 30px" value="1">
							<img src="img/img_dinggou.gif" onclick="addToShoppingCart(${dishes.id})" style="cursor:pointer" />
						</form>
					</div>
				</div>
			</c:forEach>
			<table width="500px">
				<tr width="500px"><td align="center" width="500px">
					<b>当前第 ${dishesPage} 页   共 ${dishesPageSum} 页  </b>
					<a href="${pageContext.request.contextPath}/proscenium/indexAction!index.action">首页</a>&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/proscenium/indexAction!indexDishesLastPage.action?dishesPage=${dishesPage}">上一页</a> &nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/proscenium/indexAction!indexDishesNextPage.action?dishesPage=${dishesPage}" >下一页</a>&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/proscenium/indexAction!index.action?dishesPage=${dishesPageSum}" >尾页</a>
				</td></tr>
			</table>
		</div>

		<!--
            描述：中层右部
        -->
		<div id="middle_right">
			<!--
                描述：餐厅公告栏
            -->
			<div id="announcement">
				<div id="announcement_title">
					餐厅公告
					<a href="${pageContext.request.contextPath}/proscenium/noticeAction!selectNoticeAll.action">更多>></a>
				</div>
				<br/>
                <%--<div id="pin">--%>
				<ul>
					<c:forEach items="${noticeList}" var="notice">
						<li>
							<a href="${pageContext.request.contextPath}/proscenium/noticeAction!showNotice.action?noticeId=${notice.id}">${notice.title}</a>
							<font>${notice.dateTimes}</font>
						</li>
					</c:forEach>
				</ul>
                <%--</div>--%>
			</div>
			<!--
                描述：我的餐车栏
            -->
			<div id="diner">
				<div id="diner_title">
					我的餐车
					<a href="diner.jsp">更多>></a>
				</div>
				<br/>
				<div id="diner_context_head">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;菜单名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量
				</div>
<div id="limit">
				<table>
					<c:forEach items="${sessionScope.shoppingCartList}" var="shoppingCart">
						<tr>
							<td width="120px" align="center">${shoppingCart.dishes.name}</td>
							<td width="56px" align="center">${shoppingCart.dishes.price}</td>
							<td width="56px" align="center">${shoppingCart.dishesSum}</td>
						</tr>
					</c:forEach>
				</table>


</div>
				<div id="diner_context_foot">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小计：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<font id="priceSum">${priceSum}</font>元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<font id="dishesSum">${dishesSum}</font>份

				</div>
				<div id="diner_context_button">
					<a href="${pageContext.request.contextPath}/proscenium/ordersAction!placeOrders.action"><img src="img/canche_submit.gif" /></a>
					<a href="${pageContext.request.contextPath}/proscenium/ordersAction!clearShoppingCart.action?dishesPage=${dishesPage}"><img src="img/quxiao2.gif" /></a>
				</div>

			</div>
			<!--
                描述：销售排行栏
            -->
			<div id="sell">
				<div id="sell_title">
					销售排行榜
				</div>
				<br/>
				<table>
					<c:forEach items="${dishesListRanking}" var="dishesRank">
						<tr align="left">
							<td width="115px"><a href="${pageContext.request.contextPath}/proscenium/dishesAction!selectDishesById.action?dishesId=${dishesRank.id}">${dishesRank.name}</a></td>
							<td width="115px"><font>已销售${dishesRank.sums}次</font></td>
						</tr>
					</c:forEach>

				</table>
			</div>
		</div>
	</div>
	<!--
    描述：下层
    -->
	<div id="bottom">
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
	function addToShoppingCart(id) {
		var title = "${sessionScope.get("loggedUser").name}"
		if (title != ""){
			//用户已登陆
			$("#form_" + id).submit();
		} else {
			//用户未登录
			alert("亲，您还没有登录哦，请登录后再进行此操作！")
		}
	}
</script>
</body>

</html>
