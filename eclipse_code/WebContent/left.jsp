<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 侧边栏 -->
<div class="aside">
	<!-- 热门主题 -->
	<div class="theme">
		<a href="javascript:;"> <span class="tag">积分榜单</span></a>
		<br>
		<table class='userhot'>
			<tr><td>用户名</td><td>积分</td></tr>
		</table>
	</div>
	<!-- 搜索 -->
	<div class="widgets">
		<h4>搜索</h4>
		<div class="body search">
			<form>
				<input id="searchName2" type="text" class="keys" placeholder="输入关键字">
				<input type="button" id="search2" class="btn" value="搜索">
			</form>
		</div>
	</div>
	<!-- 随机推荐 -->
	<div class="widgets">
		<h4>随机推荐</h4>
		<ul class="body random">
		</ul>
	</div>
</div>
<script src="./js/jquery-3.5.1.js"></script>
<script src="./js/main.js"></script>
<script>
function userhot() {
	$.get("UserhotServlet", {}, function(res) {
		var s="";
		for (var i = 0; i < res.length; i++) {
			s="<tr><td>"+res[i].userName+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>"+res[i].balance+"</td></tr>";
			$("table.userhot").append(s);
		}
	}, "json")
}
	$(function() {
		userhot();
		randomlist();
		$("input#search2").click(function() {
			$("input#more").val("点击加载更多").attr('disabled', false);
			$("#list").html("");
			var orderby = "download";
			var searchName = $("input#searchName2").val();
			search(searchName, 0, 10, "update", "list", "0");
		})
	})
	function randomlist() {
		search("", 0, 5, "", "random", "0");
	}
</script>