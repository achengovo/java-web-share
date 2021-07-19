<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>阿成资源-上传资源</title>
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

.btn4 {
	width: 49.8%;
	height: 34px;
	border: 0 none;
	color: #FFF;
	background-color: #FF5E52;
	opacity: .85;
}

.btn5 {
	float: right;
	width: 49.8%;
	height: 34px;
	border: 0 none;
	color: #FFF;
	background-color: #FF5E52;
	opacity: .85;
}

.btn2 {
	width: 49%;
	height: 34px;
	border: 0 none;
	color: #FFF;
	background-color: #FF5E52;
	opacity: .85;
}

.btn3 {
	float: right;
	width: 49%;
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

tr {
	line-height: 30px;
}
</style>
</head>
<body>
	<c:if test="${empty user}">
		<%
			response.sendRedirect("login.jsp");
		%>
	</c:if>
	<div class="wrapper">
		<%@ include file="menu.jsp"%>
		<!-- 网站主体 -->
		<div class="content">
			<div class="panel new" id="myinfo">
				<div class="title">
					<h3>资源上传</h3>
					<form action="UploadServlet" method="post"
						enctype="multipart/form-data">
				</div>
				<br>

				<table>

					<tr>
						<td>标题</td>
						<td><input type="text" name="rname" /></td>
					</tr>
					<tr>
						<td>资源介绍：</td>
						<td><textarea maxlength="255" rows="5" cols="20" type="text" name="rinformation" /></textarea></td>
					</tr>
					<tr>
						<td>下载所需积分：</td>
						<td><input type="text" name="price" /></td>
					</tr>
					<tr>
						<td>资源类别：</td>
						<td><input type="radio" value="1" name="category" />精品软件 <input
							type="radio" value="2" name="category" />精品模板 <input
							type="radio" value="3" name="category" />音乐天堂</td>
					</tr>
					<tr>
						<td>标签1：</td>
						<td><input type="text" name="label1" /></td>
					</tr>
					<tr>
						<td>标签2：</td>
						<td><input type="text" name="label2" /></td>
					</tr>
					<tr>
						<td>标签3：</td>
						<td><input type="text" name="label3" /></td>
					</tr>
					<tr>
						<td>选择文件</td>
						<td><input type="file" name="myfile" /></td>
					</tr>
				</table>

			</div>
			<input id="more" type="submit" value="点击发布" class="btn"> <br>
			</form>
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
			$("li#upload>a").css("color", "#FF5E52");
		})
	</script>
</body>
</html>