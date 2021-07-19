<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="topnav">
	<ul>

		<li id="index"><a href="index.jsp"> <span
				class="glyphicon glyphicon-home"></span> 首页
		</a></li>
		<li id="software"><a href="software.jsp"> <span
				class="glyphicon glyphicon-fire"></span> 精品软件
		</a></li>
		<li id="template"><a href="template.jsp"> <span
				class="glyphicon glyphicon-gift"></span> 精品模板
		</a></li>
		<li id="music"><a href="music.jsp"> <span
				class="glyphicon glyphicon-music"></span> 音乐天堂
		</a></li>
		<li id="my"><c:if test="${user!=null}">
				<a href="my.jsp"> <span class="glyphicon glyphicon-user"></span>个人中心
				</a>
			</c:if> <c:if test="${empty user}">
				<a href="login.jsp"> <span class="glyphicon glyphicon-user"></span>去登录
				</a>
			</c:if></li>
		<li id="upload"><a href="upload.jsp"> <span
				class="glyphicon glyphicon-open"></span> 上传资源
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

		<li id="index"><a href="index.jsp"> <span
				class="glyphicon glyphicon-home"></span>首页
		</a></li>
		<li id="software"><a href="software.jsp"><span
				class="glyphicon glyphicon-fire"></span>精品软件 </a></li>
		<li id="template"><a href="template.jsp"> <span
				class="glyphicon glyphicon-gift"></span>精品模板
		</a></li>
		<li id="music"><a href="music.jsp"> <span
				class="glyphicon glyphicon-music"></span>音乐天堂
		</a></li>
		<li id="my"><c:if test="${user!=null}">
				<a href="my.jsp"> <span class="glyphicon glyphicon-user"></span>个人中心
				</a>
			</c:if> <c:if test="${empty user}">
				<a href="login.jsp"> <span class="glyphicon glyphicon-user"></span>去登录
				</a>
			</c:if></li>
		<li id="upload"><a href="upload.jsp"> <span
				class="glyphicon glyphicon-open"></span>上传资源
		</a></li>
	</ul>
	<!-- 网站搜索 -->
	<div class="search">
		<form>
			<input id="searchName" type="text" class="keys" placeholder="输入关键字">
			<input id="search" type="button" class="btn" value="搜索">
		</form>
	</div>
	<script src="./js/jquery-3.5.1.js"></script>
	<script src="./js/main.js"></script>
	<script>
		$(function() {
			$("input#search").click(function() {
				removeother();
				var searchName = $("input#searchName").val();
				search(searchName, 0, 10, "update", "list", "0");
			})
		})
	</script>
</div>