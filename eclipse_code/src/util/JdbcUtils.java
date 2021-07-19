package util;

import java.sql.*;
import java.util.ResourceBundle;;

public class JdbcUtils {
	public Connection conn;// 连接对象
	public PreparedStatement pst;// 执行SQL语句对象
	public ResultSet rs;// 结果集对象

	public Connection getConnection() {
		// 1.加载驱动
		try {
			Class.forName("com.mysql.jdbc.Driver");
			ResourceBundle jdbc = ResourceBundle.getBundle("JDBC");
			String url = jdbc.getString("url");
			String user = jdbc.getString("user");
			String password = jdbc.getString("password");
			// 2.建立连接
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}

	public int executeUpdate(String sql, Object[] p) {
		int r = 0;
		conn = getConnection();
		try {
			pst = conn.prepareStatement(sql);
			if (p != null) {
				for (int i = 0; i < p.length; i++) {
					pst.setObject((i + 1), p[i]);
				}
			}
			r = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return r;
	}

	/**
	 * 释放资源 conn pst rs
	 */
	public void closeAll(Connection conn, PreparedStatement pst, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pst != null) {
				pst.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}