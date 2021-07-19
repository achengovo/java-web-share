<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>阿成资源-个人中心</title>
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
					<h3>个人资料</h3>
				</div>
				<br>
				<table>
					<tr>
						<td>ID：</td>
						<td>${user.userId }</td>
					</tr>
					<tr>
						<td>用户名：</td>
						<td>${user.userName }</td>
					</tr>
					<tr>
						<td>积分余额：</td>
						<td>${user.balance }</td>
					</tr>
					<tr>
						<td>手机号</td>
						<td>${user.phone }</td>
					</tr>
					<tr>
						<td>邮箱：</td>
						<td>${user.email }</td>
					</tr>
					<tr>
						<td>性别：</td>
						<td><c:if test="${user.sex==0}">女</c:if> <c:if
								test="${user.sex==1}">男</c:if> <c:if test="${user.sex==2}">不公开</c:if>
						</td>
					</tr>
				</table>
				<br>
			</div>
			<input type="button" id="modify" onclick="modifybtn()" class="btn4"
				value="修改资料"> <input type="button" id="modify"
				onclick="modifypassbtn()" class="btn5" value="修改密码">
			<!-- 最新发布 -->

			<div class="panel new" id="list">
				<div class="title">
					<h3>我的收藏</h3>
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
		function modifybtn() {
			$("input#modify").hide();
			var s = "<div id='change'><table><tr><td>用户名：</td><td><input id='modifyname'"
				+" type='text'></td></tr><tr><td>手机号：</td><td>"
					+ "<input id='modifyphone' type='text'></td></tr><tr><td>邮箱："
					+ "</td><td><input id='modifyemail' type='text'></td></tr><tr><td>性别：</td><td><input id='sex' type='radio' value='1' name='sex'>男<input id='sex' value='0' type='radio' name='sex'>女<input id='sex' type='radio' checked='checked' name='sex' value='2'>不公开</td></tr><tr><td>密码确认："
					+ "</td><td><input id='UserPass' type='password'></td></tr></table><br>"
					+ "<input onclick='modifysave()' type='button' class='btn2' value='保存修改'>"
					+ "<input onclick='modifycancel()' type='button' class='btn3' value='取消修改'></div>";
			$("#myinfo").append(s);
		}
		function modifypassbtn() {
			$("input#modify").hide();
			var s = "<div id='change'><table><tr><td>旧密码：</td><td><input id='pass'"
				+" type='password'></td></tr><tr><td>新密码：</td><td>"
					+ "<input id='modifypass' type='password'></td></tr><tr><td>确认新密码："
					+ "</td><td><input id='remodifypass' type='password'></td></tr></table><br>"
					+ "<input onclick='modifypasssave()' type='button' class='btn2' value='保存修改'>"
					+ "<input onclick='modifycancel()' type='button' class='btn3' value='取消修改'></div>";
			$("#myinfo").append(s);
		}
		function modifycancel() {
			$("input#modify").show();
			$("div#change").remove();
		}
		function likelist(star, num) {
			$.get("LikeServlet", {
				'star' : star,
				'num' : num
			}, function(res) {
				list(res, num, "list");
			}, "json")
		}
		function modifysave() {
			var UserPass = $("input#UserPass").val();
			var modifyname = $("input#modifyname").val();
			var modifyemail = $("input#modifyemail").val();
			var modifyphone = $("input#modifyphone").val();
			var modifysex = $("input#sex:checked").val();
			$.post("ModifyServlet", {
				'UserPass' : UserPass,
				'modifyname' : modifyname,
				'modifyemail' : modifyemail,
				'modifyphone' : modifyphone,
				'modifysex' : modifysex
			}, function(res) {
				if (res == "username") {
					alert("用户名已存在");
				} else if (res == "success") {
					alert("修改成功");
					window.location.href = "/share/my.jsp";
				} else if (res == "passerror") {
					alert("密码错误");
				} else if (res == "usernameempty") {
					alert("用户名不能为空");
				}
			})
		}
		function modifypasssave() {
			var oldpass = $("input#pass").val();
			var newpass = $("input#modifypass").val();
			var repass = "repass";
			if (newpass == "") {
				alert("密码不能为空");
			}
			var renewpass = $("input#remodifypass").val();
			if (newpass != renewpass) {
				alert("两次密码输入不一致");
			} else {
				$.post("login", {
					'oldpass' : oldpass,
					'newpass' : newpass,
					'repass' : repass
				}, function(res) {
					if (res == "success") {
						alert("修改成功,请重新登录");
						window.location.href = "/share/login.jsp";
					} else if (res == "fail") {
						alert("修改失败");
					} else if (res == "passfail") {
						alert("旧密码错误");
					}
				})
			}
		}
		$(function() {
			$("li#my>a").css("color", "#FF5E52");
			$("input#more").val("点击加载更多").attr('disabled', false);
			likelist(0, 2);

			$("input#modifybtn").click(function() {
				modifybtn();
			})
			//点击更多按钮
			$("input#more").click(function() {
				searchName = $("input#searchName").val();
				var star = $("dl.single").length;
				likelist(star, 5);
			})
		})
	</script>
</body>
</html>