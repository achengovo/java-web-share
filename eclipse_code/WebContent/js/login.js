$(function() {
	$("#btnlogin").click(function() {
		var userName = $("input#userName").val();
		var passWord = $("input#passWord").val();
		$.post("login", {
			'userName' : userName,
			'userPass' : passWord
		}, function(data) {
			if (data == "fail") {
				alert("用户名或密码错误，请重新登录！");
				$("input#passWord").val("");
			}else{
				window.location.href = "index.jsp";
			}
		})
	})
})