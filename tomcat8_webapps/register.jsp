<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>阿成资源-注册</title>
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

#error2 {
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
					<h2>注册</h2>
					<form>
						<div class="input-group">
							<span class="glyphicon glyphicon-user"></span> <input
								id="userName" type="text" placeholder="用户名" required="">
						</div>
						<div class="input-group">
							<span class="glyphicon glyphicon-lock"></span> <input
								id="userPass" name="userPass" type="Password" placeholder="密码"
								required="">
						</div>
						<div class="input-group">
							<span class="glyphicon glyphicon-lock"></span> <input id="repass"
								type="Password" placeholder="密码确认" required="">
						</div>
						<div class="input-group">
							<span class="glyphicon glyphicon-phone"></span> <input id="phone"
								type="tel" placeholder="手机号码" required="">
						</div>
						<div class="input-group">
							<span class="glyphicon glyphicon-envelope"></span> <input
								id="email" type="email" placeholder="邮箱" required="">
						</div>
						<div class="form-row bottom">
							<a href="login.jsp">已有账号？登录</a>
						</div>
						<button class="btn btn-primary btn-block" type="button"
							id="btnregister">立即注册</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery-3.5.1.js"></script>
	<script src="js/register.js"></script>

</body>

</html>