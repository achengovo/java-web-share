package com.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bean.User;
import com.service.UserService;

/**
 * Servlet implementation class DownloadServlet
 */
@WebServlet("/Download")
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DownloadServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		User user = new User();
		user = (User) request.getSession().getAttribute("user");// ��session�л�ȡ�û�����
		if (user == null) {// �û�δ��¼
			PrintWriter out = response.getWriter();
			out.print("loginfail");
			out.flush();
			out.close();
		} else {// �ѵ�¼
			int userid = user.getUserId();// ��ȡ�û�ID
			String filename = request.getParameter("filename");// ��ȡ�ļ���
			int rid = Integer.parseInt(request.getParameter("rid"));// ��ԴID
			int state = Integer.parseInt(request.getParameter("state"));// �жϲ���(1:����,0:�ղ�)
			UserService service = new UserService();
			if (state == 1) {
				if (service.insbus(userid, rid, state) == 1) {
					// �ļ����ڵ��ļ���
					String folder = "./resources/";
					// ֪ͨ����������صķ�ʽ��
					response.addHeader("Content-Type", "application/octet-stream");
					String filename2 = URLEncoder.encode(filename, "UTF-8");
					response.addHeader("Content-Disposition", "attachment;filename=" + filename2);
					// ͨ���ļ���������ȡ�ļ�
					InputStream in = getServletContext().getResourceAsStream(folder + filename);
					OutputStream out = response.getOutputStream();
					byte[] bytes = new byte[1024];
					int len = 0;
					while ((len = in.read(bytes)) != -1) {
						out.write(bytes, 0, len);
					}
				} else {
					PrintWriter out = response.getWriter();
					out.print("downfail");
					out.flush();
					out.close();
				}
			} else if (state == 0) {
				PrintWriter out = response.getWriter();
				switch (service.insbus(userid, rid, state)) {
				case 3:
					// �ղسɹ�
					out.print("likesuccess");
					break;
				case 4:
					// �Ѿ��ղ�
					out.print("liked");
					break;
				default:
					// �ղ�ʧ��
					out.print("likefail");
					break;
				}
				out.flush();
				out.close();
			}else if(state==2){
				state=1;
				if(service.insbus(userid, rid, state) == 1){
					PrintWriter out = response.getWriter();
					out.print("downsuccess");
				}else {
					PrintWriter out = response.getWriter();
					out.print("downfail");
					out.flush();
					out.close();
				}
				
			}
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
