<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>阿成资源-精品模板</title>
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
<body>
	<div class="wrapper">
		<%@ include file="menu.jsp"%>
		<%@ include file="left.jsp"%>
		<!-- 网站主体 -->
		<div class="content">
			<!-- 最新发布 -->
			<div class="panel new" id="list">
				<div class="title">
					<h3>精品模板</h3>
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
			$("li#template>a").css("color", "#FF5E52");
			$("input#more").val("点击加载更多").attr('disabled', false);
			var searchName = "";
			search(searchName, 0, 10, "update", "list", "2");

			//点击更多按钮
			$("input#more").click(function() {
				searchName = $("input#searchName").val();
				var star = $("dl.single").length;
				search(searchName, star, 10, "update", "list", "2");
			})
			$("input#search").click(function() {
				removeother();
				var searchName = $("input#searchName").val();
				search(searchName, 0, 10, "update", "list", "2");
			})
		})
	</script>
</body>
</html>