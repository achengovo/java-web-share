<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>阿成资源-管理员</title>
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

.content {
	width: 80%;
}

.title {
	float: left;
	width: 50%;
}

.right {
	float: right;
}

.search2 {
	float: right;
	width: 50%;
}

.table {
	width: 100%;
}

.table tr {
	line-height: 40px;
}

.btn {
	width: 20%;
	height: 34px;
	border: 0 none;
	color: #FFF;
	background-color: #FF5E52;
	opacity: .85;
}

.kuang {
	height: 28px;
}

.btn2 {
	width: 50px;
	height: 34px;
	border: 0 none;
	color: #FFF;
	background-color: #FF5E52;
	opacity: .85;
}

.btn3 {
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
<c:if test="${user.state==1}">
	<%
		response.sendRedirect("index.jsp");
	%>
</c:if>
<c:if test="${empty user}">
	<%
		response.sendRedirect("login.jsp");
	%>
</c:if>
<body>
	<script src="./js/jquery-3.5.1.js"></script>
	<script src="./js/swipe.js"></script>
	<script>
		//封禁账号
		function fengjin(userid, state) {
			$.get("AdminServlet", {
				'userid' : userid,
				'state' : state,
				'page' : "fenghao"
			}, function(date) {
				if (date == "jiesuccess") {
					alert("解封成功");
				} else if (date == "fengsuccess") {
					alert("封禁成功");
				}
				var num = $("table>tr").length;
				searchlist2('', 0, num, 'user')
			})
		}
		//封禁资源
		function fengjinres(rid, state) {
			$.get("AdminServlet", {
				'rid' : rid,
				'state' : state,
				'page' : "fengres"
			}, function(date) {
				if (date == "jiesuccess") {
					alert("解封成功");
				} else if (date == "fengsuccess") {
					alert("封禁成功");
				}
				var num = $("table>tr").length;
				searchlist2('', 0, num, 'res')
			})
		}
		//加载更多
		function morelist() {
			var star = $("tr").length - 1;
			var num = 15;
			var page = "user";
			if ($("h3").text() == "用户管理") {
				page = "user";
			} else if ($("h3").text() == "资源管理") {
				page = "res";
			}
			if ($("h3").text() == "订单查看") {
				page = "bus";
			}
			searchlist('', star, num, page);
		}
		//切换目录
		function searchlist2(searchName, star, num, page) {
			/* $("li#index>a").css("color", "#FF5E52"); */
			$("input#more").val("点击加载更多").attr('disabled', false);
			$("div.title").html("");
			$("table.table").html("");
			searchlist(searchName, star, num, page);
		}
		//查询
		function searchlist(searchName, star, num, page) {
			$.get("AdminServlet", {
				'searchName' : searchName,
				'star' : star,
				'num' : num,
				'page' : page
			}, function(date) {
				if (page == "user") {
					userlist(date);
				} else if (page == "res") {
					reslist(date);
				} else if (page == "bus") {
					buslist(date);
				}
			}, "json")
		}
		//用户列表显示
		function userlist(date) {
			var s = "";
			if ($("h3").text() != "用户管理") {
				$("div.title").append("<h3>用户管理</h3>");
				s = "<tr><td>用户ID</td>" + "<td>用户名</td>" + "<td>手机号</td>"
						+ "<td>邮箱</td>" + "<td>性别</td>" + "<td>积分</td>"
						+ "<td>状态</td>" + "<td>操作</td>" + "</tr>";
				$(".table").append(s);
			}

			for (var i = 0; i < date.length; i++) {
				s = "<tr><td>" + date[i].userId + "</td>" + "<td>"
						+ date[i].userName + "</td>" + "<td>" + date[i].phone
						+ "</td>" + "<td>" + date[i].email + "</td>" + "<td>";
						
						if(date[i].sex==0){
							s=s+"女";
						}if(date[i].sex==1){
							s=s+"男";
						}if(date[i].sex==2){
							s=s+"不公开";
						}
						s=s+ "</td>" + "<td>" + date[i].balance
						+ "</td>";
				if (date[i].state == 0) {
					s = s + "<td>管理员</td>";
					s = s
							+ "<td><input class='btn2' type='button' value='无'</td></tr>";
				} else if (date[i].state == 1) {
					s = s + "<td>普通用户</td>";
					s = s
							+ "<td><input class='btn2' type='button' onclick='fengjin("
							+ date[i].userId + ",2" + ")' value='封号'</td></tr>";
				} else if (date[i].state == 2) {
					s = s + "<td>已封禁</td>";
					s = s
							+ "<td><input class='btn2' type='button' onclick='fengjin("
							+ date[i].userId + ",1" + ")' value='解封'</td></tr>";
				}
				$(".table").append(s);
			}
			if (date.length < 15) {
				$("input#more").val("没有更多了").attr('disabled', true);
			}
		}
		//资源列表显示
		function reslist(date) {
			var s = "";
			if ($("h3").text() != "资源管理") {
				$("div.title").append("<h3>资源管理</h3>");
				var s = "<tr><td>资源ID</td>" + "<td>用户ID</td>" + "<td>资源名</td>"
						+ "<td>发布日期</td>" + "<td>积分</td>" + "<td>标签</td>"
						+ "<td>下载量</td><td>状态</td><td>操作</td></tr>";
				$(".table").append(s);
			}
			for (var i = 0; i < date.length; i++) {
				s = "<tr><td>" + date[i].rid + "</td>" + "<td>"
						+ date[i].userid + "</td>" + "<td>" + date[i].rname
						+ "</td>" + "<td>" + date[i].update + "</td>" + "<td>"
						+ date[i].price + "</td><td>" + date[i].label1 + ","
						+ date[i].label2 + "," + date[i].label3 + "</td><td>"
						+ date[i].browsenum + "</td>";
				if (date[i].state == 1) {
					s = s + "<td>正常</td>";
					s = s
							+ "<td><input class='btn2' type='button' onclick='fengjinres("
							+ date[i].rid + ",0" + ")' value='封禁'</td></tr>";
				} else if (date[i].state == 0) {
					s = s + "<td>封禁</td>";
					s = s
							+ "<td><input class='btn2' type='button' onclick='fengjinres("
							+ date[i].rid + ",1" + ")' value='解封'</td></tr>";
				}

				$(".table").append(s);
				if (date.length < 15) {
					$("input#more").val("没有更多了").attr('disabled', true);
				}
			}
		}
		//业务列表显示
		function buslist(date) {
			var s = "";
			if ($("h3").text() != "订单查看") {
				$("div.title").append("<h3>订单查看</h3>");
				var s = "<tr><td>业务ID</td>" + "<td>用户ID</td>" + "<td>资源ID</td>"
						+ "<td>业务日期时间</td>" + "<td>积分</td>"
						+ "<td>业务类型</td></tr>";
				$(".table").append(s);
			}

			for (var i = 0; i < date.length; i++) {
				s = "<tr><td>" + date[i].busId + "</td>" + "<td>"
						+ date[i].userId + "</td>" + "<td>" + date[i].rId
						+ "</td>" + "<td>" + date[i].busDate + "</td>" + "<td>"
						+ date[i].busPrice + "</td>";
				if (date[i].state == 0) {
					s = s + "<td>收藏</td></tr>";
				} else if (date[i].state == 1) {
					s = s + "<td>下载</td></tr>";
				} else if (date[i].state == 2) {
					s = s + "<td>发布</td></tr>";
				}
				$(".table").append(s);
				if (date.length < 15) {
					$("input#more").val("没有更多了").attr('disabled', true);
				}
			}
		}
		//进入页面时加载
		$(function() {
			searchlist('', 0, 15, 'user');
		})
	</script>
	<div class="wrapper">
		<div class="topnav">
			<ul>
				<li id="index"><a href="javascript:;"
					onclick="searchlist2('',0,15,'user');"> <span
						class="glyphicon glyphicon-user"></span> 用户管理
				</a></li>
				<li id="software"><a href="javascript:;"
					onclick="searchlist2('',0,15,'res');"> <span
						class="glyphicon glyphicon-gift"></span> 资源管理
				</a></li>
				<li id="template"><a href="javascript:;"
					onclick="searchlist2('',0,15,'bus');"> <span
						class="glyphicon glyphicon-th-list"></span> 查看订单
				</a></li>
			</ul>
		</div>
		<!-- 固定导航 -->
		<div class="header">
			<!-- 网站Logo -->
			<h1 class="logo">
				<a href="./index.jsp">阿成资源</a>
			</h1>
			<!-- 网站导航 -->
			<ul class="nav">
				<li id="index"><a onclick="searchlist2('',0,15,'user');"
					href="javascript:;"> <span class="glyphicon glyphicon-user"></span>用户管理
				</a></li>
				<li id="software"><a href="javascript:;"
					onclick="searchlist2('',0,15,'res');"><span
						class="glyphicon glyphicon-gift"></span>资源管理 </a></li>
				<li id="template"><a href="javascript:;"
					onclick="searchlist2('',0,15,'bus');"> <span
						class="glyphicon glyphicon-th-list"></span>查看订单
				</a></li>
			</ul>
			<script src="./js/jquery-3.5.1.js"></script>
		</div>
		<!-- 网站主体 -->
		<div class="content">
			<!-- 热门排行 -->
			<div id="hot" class="panel new">
				<div class="title"></div>
				<table class="table">
				</table>
			</div>
			<input id="more" type="button" onclick="morelist()" value="点击加载更多"
				class="btn3">
		</div>
		<!-- 底部栏 -->
		<div class="footer">
			<p>Copyright2021 阿成.AllRightsReserved.</p>
		</div>
	</div>

</body>
</html>