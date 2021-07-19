package com.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.User;

import util.JdbcUtils;

public class UserDao extends JdbcUtils {

	/**
	 * 根据用户名密码查询验证
	 * 
	 * @param loginName
	 * @param passWord
	 * @return
	 */
	public User select(String userName, String passWord) {
		User user = null;
		String sql = "SELECT * FROM `user` WHERE username=? AND userpass=? AND (state=1 OR state=0)";
		conn = getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, userName);
			pst.setString(2, passWord);
			rs = pst.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setUserId(rs.getInt("userid"));
				user.setUserName(rs.getString("username"));
				user.setUserPass(rs.getString("userpass"));
				user.setPhone(rs.getString("phone"));
				user.setEmail(rs.getString("email"));
				user.setSex(rs.getInt("sex"));
				user.setBalance(rs.getFloat("balance"));
				user.setState(rs.getInt("state"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(conn, pst, rs);
		}
		return user;
	}

	/**
	 * 根据用户名查询用户名是否存在
	 * 
	 * @param userName
	 * @return
	 */
	public int select_username(String userName) {
		int r = 0;
		String sql = "select `username` from `user` where `username`=?";
		conn = getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, userName);
			rs = pst.executeQuery();
			if (rs.next()) {
				return 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(conn, pst, rs);
		}
		return r;
	}

	/**
	 * 用户注册插入数据
	 * 
	 * @param user
	 * @return
	 */
	public int registe(User user) {
		int r = 0;
		String sql = "INSERT `user`(username,userpass,phone,email) VALUES(?,?,?,?)";
		conn = getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, user.getUserName());
			pst.setString(2, user.getUserPass());
			pst.setString(3, user.getPhone());
			pst.setString(4, user.getEmail());
			r = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(conn, pst, rs);
		}
		return r;
	}

	/**
	 * 修改用户信息
	 * 
	 * @param user
	 * @return
	 */
	public int modify(User user) {
		int r = 0;
		String sql = "UPDATE `user` SET username=?,phone=?,email=?,sex=? WHERE userid=? AND userpass=?";
		conn = getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, user.getUserName());
			pst.setString(2, user.getPhone());
			pst.setString(3, user.getEmail());
			pst.setInt(4, user.getSex());
			pst.setInt(5, user.getUserId());
			pst.setString(6, user.getUserPass());
			r = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(conn, pst, rs);
		}
		return r;
	}

	/**
	 * 积分榜单
	 * 
	 * @return
	 */
	public List<User> userhotlist() {
		List<User> list = new ArrayList<User>();
		String sql = "SELECT username,balance FROM `user` ORDER BY `balance` DESC LIMIT 0,5";
		conn = getConnection();
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				User res = new User();
				res.setUserName(rs.getString("username"));
				res.setBalance(rs.getFloat("balance"));
				list.add(res);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(conn, pst, rs);
		}
		return list;
	}

	/**
	 * 用户修改密码
	 * 
	 * @param user
	 * @return
	 */
	public int repass(int id, String newpass) {
		int r = 0;
		String sql = "UPDATE `user` SET userpass=? WHERE userid=?";
		conn = getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, newpass);
			pst.setInt(2, id);
			r = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(conn, pst, rs);
		}
		return r;
	}
}
