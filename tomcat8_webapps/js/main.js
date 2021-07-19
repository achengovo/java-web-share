/**
 * 查询后插入到列表
 * 
 * @param searchName
 * @param star
 * @param num
 * @returns
 */
function search(searchName, star, num, orderby, category, page) {
	$.get("ListServlet", {
		'searchName' : searchName,
		'star' : star,
		'num' : num,
		'orderby' : orderby,
		'page' : page
	}, function(res) {
		if (category == "list") {
			list(res, num, "list");
		} else if (category == "hot") {
			hot(res);
		} else if (category == "random") {
			random(res);
		}
	}, "json")
}
function random(res) {
	var s = "";
	for (var i = 0; i < res.length; i++) {
		s = "<li><a href='javascript:;'>" + "<p class='title'>" + res[i].rname
				+ "</p>" + "<p class='reading'>下载(" + res[i].browsenum
				+ ")</p>";

		if (res[i].img == 1) {
			s = s + "<div class=pic>" + "<img src='./uploads/" + res[i].rid
					+ ".jpg' alt=''>" + "</div></a></li>";
		} else {
			s = s + "</a></li>";
		}
		$("ul.random").append(s);
	}
}
function hot(res) {
	var s = "";
	for (var i = 0; i < res.length; i++) {
		s = ("<dd><i>" + (i + 1) + "</i><a href='#'> " + res[i].rname
				+ "</a><span>下载(" + res[i].browsenum + ")</span></dd>");
		$("div#hot>dl").append(s);
	}
}
function list(res, num, list) {
	if (res.length < num) {
		$("input#more").val("没有更多了！").attr('disabled', true);
	}
	var s = "";
	var head = "精品资源";
	for (var i = 0; i < res.length; i++) {
		if (res[i].category == 1) {
			head = "精品软件";
		} else if (res[i].category == 2) {
			head = "精品模板";
		} else if (res[i].category == 3) {
			head = "音乐天堂";
		}
		s = ("<dl class='single'><dt><span class='sort'>"
				+ head
				+ "</span> <a href='javascript:;'>"
				+ res[i].rname
				+ "</a></dt><!-- 单图 --><dd><p class='info'>"
				+ res[i].username
				+ "  发布于"
				+ res[i].update
				+ "</p><p class='brief'>"
				+ res[i].rinformation
				+ "</p><p class='extra'><a href='javascript:;' onclick=downloadres('"
				+ res[i].rid
				+ "','"
				+ res[i].location
				+ "',2"
				+ ") class='like'><span class='glyphicon glyphicon-download-alt reading'>下载("
				+ res[i].browsenum
				+ ")</span></a><a href='javascript:;' onclick=downloadres('"
				+ res[i].rid
				+ "','"
				+ "like"
				+ "',0"
				+ ") class='like'><span class='glyphicon glyphicon-heart'>收藏</span></a><a href='javascript:;' class='tags'> 标签：<span>  "
				+ res[i].label1 + " </span><span>  " + res[i].label2
				+ " </span><span>  " + res[i].label3 + "</span></a><span>积分："
				+ res[i].price + "</span></p>");
		if (res[i].img == 1) {
			s = s
					+ ("<a href='javascript:;' class='thumb'><img src='./uploads/"
							+ res[i].rid + ".jpg' alt=''></a></dd></dl>");
		}
		$("#" + list + "").append(s);
	}
}
function removeother() {
	$("input#modify").remove();
	$("div#myinfo").remove();
	$("div.hots").remove();
	$("div.top").remove();
	$("div.focus").remove();
	$("div.swipe").remove();
	$("input#more").val("点击加载更多").attr('disabled', false);
	$("#list").html("");
}
function downloadres(rid, location, state) {
	$.get("Download", {
		'rid' : rid,
		'state' : state,
		'filename' : rid + "-" + location
	}, function(res) {
		if (res == "likesuccess") {
			alert("收藏成功");
		} else if (res == "likefail") {
			alert("收藏失败！");
		} else if (res == "downfail") {
			alert("积分不足，下载失败！");
		} else if (res == "loginfail") {
			alert("未登录，请登录后进行操作！");
			window.location.href = "login.jsp";
		} else if (res == "liked") {
			alert("该资源已收藏，不可重复收藏");
		} else if (res == "downsuccess") {
			var url = "Download?rid=" + rid + "&state=1&filename=" + rid
					+ "-" + location;
			window.open(url);
		}
	})
}