$(function() {
	$("#btnregister").click(function() {
		var userName = $("input#userName").val();
		var passWord = $("input#userPass").val();
		var repass = $("input#repass").val();
		var phone = $("input#phone").val();
		var email = $("input#email").val();
		if (userName == "") {
			alert("用户名不能为空");
		} else if (passWord == "") {
			alert("密码不能为空");
		} else if (phone == "") {
			alert("手机号不能为空");
		} else if (email == "") {
			alert("邮箱不能为空");
		} else if (repass != passWord) {
			alert("两次密码输入不一致！");
		} else {
			$.post("Register", {
				'userName' : userName,
				'userPass' : passWord,
				'phone' : phone,
				'email' : email
			}, function(data) {
				if (data == "fail") {
					alert("用户名已存在，请重新输入");
				} else {
					window.location.href = "index.jsp";
				}
			})
		}
	})
	$("input#repass").blur(function() {
		var pass = $("input#userPass").val();
		var repass = $("input#repass").val();
		if (repass != pass) {
			alert("两次密码输入不一致！");
		}
	})

})