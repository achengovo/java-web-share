package util;

import java.sql.*;
import java.util.ResourceBundle;;

public class JdbcUtils {
	public Connection conn;// ���Ӷ���
	public PreparedStatement pst;// ִ��SQL������
	public ResultSet rs;// ���������

	public Connection getConnection() {
		// 1.��������
		try {
			Class.forName("com.mysql.jdbc.Driver");
			ResourceBundle jdbc = ResourceBundle.getBundle("JDBC");
			String url = jdbc.getString("url");
			String user = jdbc.getString("user");
			String password = jdbc.getString("password");
			// 2.��������
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
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
		return r;
	}

	/**
	 * �ͷ���Դ conn pst rs
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