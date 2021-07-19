package com.servlet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.ExceptionUtils;

import com.bean.User;
import com.service.ResourcesService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Iterator;
import java.util.List;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadServlet() {
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
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		ResourcesService service = new ResourcesService();
		String rname = "´íÎó";
		String rinformation = "´íÎó";
		Float price = (float) 0;
		int category = 0;
		String label1 = "´íÎó";
		String label2 = "´íÎó";
		String label3 = "´íÎó";
		String location = "´íÎó";
		int rid = 0;

		User user = new User();
		user = (User) request.getSession().getAttribute("user");
		int userid = user.getUserId();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(new File(this.getServletContext().getRealPath("/") + "resources"));
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(200 * 1024 * 1024);
		List<?> items;
		try {
			items = upload.parseRequest(request);
			Iterator iter = items.iterator();
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();

				if (!item.isFormField()) {

					String fieldName = item.getFieldName();
					String fileName = item.getName();
					location = fileName;
					rid = service.upres(userid, userid, rname, rinformation, location, price, category, label1, label2,
							label3);
					File saveFile = null;
					InputStream input = null;
					OutputStream output = null;
					input = item.getInputStream();
					File newFile = new File(this.getServletContext().getRealPath("/") + "resources" + File.separator
							+ rid + "-" + fileName);
					output = new BufferedOutputStream(new FileOutputStream(newFile));
					int temp = 0;
					byte data[] = new byte[512];
					while ((temp = input.read(data, 0, 512)) != -1) {
						output.write(data);
					}
					response.sendRedirect("index.jsp");
					input.close();
					output.close();
					item.delete();

				} else {
					String name = item.getFieldName();
					if ("rname".equals(name)) {
						rname = item.getString("UTF-8");
					} else if ("rinformation".equals(name)) {
						rinformation = item.getString("UTF-8");
					} else if ("label1".equals(name)) {
						label1 = item.getString("UTF-8");
					} else if ("label2".equals(name)) {
						label2 = item.getString("UTF-8");
					} else if ("label3".equals(name)) {
						label3 = item.getString("UTF-8");
					} else if ("price".equals(name)) {
						price = Float.parseFloat(item.getString());
					} else if ("category".equals(name)) {
						category = Integer.parseInt(item.getString());
					}
				}
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
