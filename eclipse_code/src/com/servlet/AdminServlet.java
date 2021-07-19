package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Business;
import com.bean.Resources;
import com.bean.User;
import com.google.gson.Gson;
import com.service.AdminService;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminServlet() {
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
		String page = request.getParameter("page");// page用于判断操作类别
		AdminService service = new AdminService();
		Gson gson = new Gson();
		if ("user".equals(page)) {// 查询用户
			String searchName = request.getParameter("searchName");
			int star = Integer.parseInt(request.getParameter("star"));
			int num = Integer.parseInt(request.getParameter("num"));
			List<User> list = service.selectu(searchName, star, num);
			String info = gson.toJson(list);
			out.print(info);
		} else if ("res".equals(page)) {// 查询资源
			int star = Integer.parseInt(request.getParameter("star"));
			int num = Integer.parseInt(request.getParameter("num"));
			List<Resources> list = service.selectres(star, num);
			String info = gson.toJson(list);
			out.print(info);
		} else if ("bus".equals(page)) {// 查询业务
			int star = Integer.parseInt(request.getParameter("star"));
			int num = Integer.parseInt(request.getParameter("num"));
			List<Business> list = service.selectb(star, num);
			String info = gson.toJson(list);
			out.print(info);
		} else if ("mes".equals(page)) {// 查询反馈信息

		} else if ("fenghao".equals(page)) {// 封号/解封操作
			int id = Integer.parseInt(request.getParameter("userid"));
			int state = Integer.parseInt(request.getParameter("state"));
			if (service.updateur(id, state) > 0) {
				if (state == 1) {
					out.print("jiesuccess");
				} else if (state == 2) {
					out.print("fengsuccess");
				}
			}
		} else if ("fengres".equals(page)) {// 封禁/解封资源
			int rid = Integer.parseInt(request.getParameter("rid"));
			int state = Integer.parseInt(request.getParameter("state"));
			if (service.updateres(rid, state) > 0) {
				if (state == 1) {
					out.print("jiesuccess");
				} else if (state == 0) {
					out.print("fengsuccess");
				}
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
