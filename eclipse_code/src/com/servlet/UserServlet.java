package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.User;
import com.service.UserService;

import util.Md5Pass;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/login")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String repass = request.getParameter("repass");
		String newpass = request.getParameter("newpass");
		String oldpass = request.getParameter("oldpass");
		newpass=Md5Pass.md5(newpass);
		oldpass=Md5Pass.md5(oldpass);
		UserService service = new UserService();
		if ("repass".equals(repass)) {
			User user = new User();
			user = (User) request.getSession().getAttribute("user");
			if (user.getUserPass().equals(oldpass)) {
				int id = user.getUserId();
				if (service.repass(id, newpass) > 0) {
					request.getSession().invalidate();
					out.print("success");
				} else {
					out.print("fail");
				}
			} else {
				out.print("passfail");
			}
		} else {
			String loginName = request.getParameter("userName");
			String passWord = request.getParameter("userPass");
			passWord=Md5Pass.md5(passWord);
			User user = service.login(loginName, passWord);
			if (user != null) {
				request.getSession().setAttribute("user", user);
			} else {
				out.print("fail");
			}
		}
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
