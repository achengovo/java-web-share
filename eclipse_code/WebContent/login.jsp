<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<title>阿成资源-登录</title>
<!-- 引入初始化样式表 -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
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

#error1 {
	display: none;
}

.input-group span {
	top: 32px;
	color: #AAAAAA;
}
</style>
</head>
<body>
	<div class="signinform">
		<h1></h1>
		<!-- container -->
		<div class="container">
			<!-- main content -->
			<div class="w3l-form-info">
				<div class="w3_info">
					<h2>登录</h2>
					<form method="post">
						<div class="input-group">
							<span class="glyphicon glyphicon-user"></span> <input
								id="userName" name="uName" type="text" placeholder="用户名">
						</div>
						<div class="input-group">
							<span class="glyphicon glyphicon-lock"></span> <input
								id="passWord" name="uPass" type="Password" placeholder="密码">
						</div>
						<div class="form-row bottom">
							<a href="index.jsp" class="forgot">暂不登录</a> <a href="register.jsp">没有账号？注册</a>
						</div>
						<button id="btnlogin" name="btnlogin"
							class="btn btn-primary btn-block" type="button">登录</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div id="error1" class="error1">${error1}</div>
	<!-- fontawesome v5-->
	<script src="js/jquery-3.5.1.js"></script>
	<script src="js/login.js"></script>
</body>
</html>