package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Resources;
import com.bean.User;
import com.google.gson.Gson;
import com.service.ResourcesService;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LikeServlet() {
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
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		User user = new User();
		user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			out.print("loginfail");
		} else {
			int star = Integer.parseInt(request.getParameter("star"));
			int num = Integer.parseInt(request.getParameter("num"));
			int userid = user.getUserId();
			ResourcesService service = new ResourcesService();
			List<Resources> list = service.likelist(userid, star, num);
			request.setAttribute("list", list);
			Gson gson = new Gson();
			String info = gson.toJson(list);
			out.print(info);
		}
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
