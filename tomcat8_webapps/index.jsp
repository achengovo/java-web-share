<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>阿成资源-首页</title>
<!-- 引入初始化样式表 -->
<link rel="stylesheet" href="./css/normalize.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/glyphicons.css">
<link rel="stylesheet" href="./css/response.css">
<style>
body {
	background: url("./images/background.png") no-repeat;
	background-size: 100%;
}

html {
	margin: 0;
	padding: 0;
	color: #585858;
	background-color: #D7DDE6;
}

.btn {
	width: 100%;
	height: 34px;
	border: 0 none;
	color: #FFF;
	background-color: #FF5E52;
	opacity: .85;
}

.swipe {
	overflow: hidden;
	visibility: hidden;
	position: relative;
}

.swipe-wrap {
	overflow: hidden;
	position: relative;
}

.swipe-wrap>li {
	float: left;
	width: 100%;
	position: relative;
}
</style>
</head>
<c:if test="${user.state==0}">
	<%
		response.sendRedirect("admin.jsp");
	%>
</c:if>
<body>
	<div class="wrapper">
		<%@ include file="menu.jsp"%>
		<%@ include file="left.jsp"%>
		<!-- 网站主体 -->
		<div class="content">
			<!-- 焦点图 -->
			<div class="slider swipe">
				<ul class="swipe-wrap">
					<li><img src="./uploads/slide_1.jpg"> <span>XIU主题演示</span>
					</li>
					<li><img src="./uploads/slide_2.jpg"> <span>XIU主题演示</span>
					</li>
					<li><img src="./uploads/slide_1.jpg"> <span>XIU主题演示</span>
					</li>
					<li><img src="./uploads/slide_2.jpg"> <span>XIU主题演示</span>
					</li>
				</ul>
				<!-- 游标 -->
				<p class="cursor">
					<span class="active"></span> <span></span> <span></span> <span></span>
				</p>
				<!-- 上一下/下一个 -->
				<a class="arrow prev"> <span
					class="glyphicon glyphicon-chevron-left"></span>
				</a> <a class="arrow next"> <span
					class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
			<!-- 热门排行 -->
			<div id="hot" class="panel top">
				<div class="title">
					<h3>热门排行</h3>
				</div>
				<dl>
				</dl>
			</div>
			<!-- 最新发布 -->
			<div class="panel new" id="list">
				<div class="title">
					<h3>最新发布</h3>
				</div>

			</div>
			<input id="more" type="button" value="点击加载更多" class="btn">
		</div>
		<!-- 底部栏 -->
		<div class="footer">
			<p>Copyright2021 阿成.AllRightsReserved.</p>
		</div>
	</div>
	<script src="./js/jquery-3.5.1.js"></script>
	<script src="./js/swipe.js"></script>
	<script src=./js/main.js></script>
	<script>
		$(function() {
			$("li#index>a").css("color", "#FF5E52");
			$("input#more").val("点击加载更多").attr('disabled', false);
			var searchName = "";
			search(searchName, 0, 10, "update", "list", "0");
			search(searchName, 0, 5, "hot", "hot", "0")

			$("input#more").click(function() {
				searchName = $("input#searchName").val();
				var star = $("dl.single").length;
				search(searchName, star, 10, "update", "list", "0");
			})

		})

		// 
		var slider = Swipe(document.querySelector('.slider'), {
			auto : 3000,
			transitionEnd : function(index) {
				// index++;
				$('.cursor span').eq(index).addClass('active').siblings(
						'.active').removeClass('active');
			}
		});

		// 上/下一张
		$('.slider .arrow').on('click', function() {
			var _this = $(this);
			if (_this.is('.prev')) {
				slider.prev();
			} else if (_this.is('.next')) {
				slider.next();
			}
		})
	</script>
</body>
</html>