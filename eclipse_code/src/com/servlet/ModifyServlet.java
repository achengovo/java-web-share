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
 * Servlet implementation class ModifyServlet
 */
@WebServlet("/ModifyServlet")
public class ModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModifyServlet() {
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
		User user = new User();
		UserService service = new UserService();
		User user3 = new User();
		user3 = (User) request.getSession().getAttribute("user");
		int userid = user3.getUserId();
		user.setUserId(userid);
		user.setUserPass(Md5Pass.md5(request.getParameter("UserPass")));
		user.setUserName(request.getParameter("modifyname"));
		if (user.getUserName() == "") {
			out.print("usernameempty");
		} else {
			if (service.select_username(user.getUserName()) == 0 || user.getUserName().equals(user3.getUserName())) {
				user.setEmail(request.getParameter("modifyemail"));
				user.setPhone(request.getParameter("modifyphone"));
				user.setSex(Integer.parseInt(request.getParameter("modifysex")));
				if (service.login(user3.getUserName(), user.getUserPass()) != null) {
					if (service.modify(user) != 0) {
						request.getSession().invalidate();
						User user2 = service.login(user.getUserName(), user.getUserPass());
						request.getSession().setAttribute("user", user2);
						out.print("success");
					}
				} else {
					out.print("passerror");
				}
			} else {
				out.print("username");
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
