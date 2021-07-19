package com.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.bean.Business;
import com.bean.Resources;
import com.bean.User;

import util.JdbcUtils;

public class AdminDao extends JdbcUtils {
	/**
	 * 查询业务列表
	 * 
	 * @param star
	 * @param num
	 * @return
	 */
	public List<Business> selectb(int star, int num) {
		List<Business> list = new ArrayList<Business>();
		String sql = "SELECT * FROM business ORDER BY busdate DESC LIMIT ?,?;";
		conn = getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, star);
			pst.setInt(2, num);
			rs = pst.executeQuery();
			while (rs.next()) {
				Business bus = new Business();
				bus.setBusId(rs.getInt("busid"));
				bus.setUserId(rs.getInt("userid"));
				bus.setrId(rs.getInt("rid"));
				bus.setBusDate(rs.getString("busdate"));
				bus.setState(rs.getInt("state"));
				bus.setBusPrice(rs.getFloat("busprice"));
				list.add(bus);
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
	 * 查询用户列表
	 * 
	 * @param searchName
	 * @param star
	 * @param num
	 * @return
	 */
	public List<User> selectu(String searchName, int star, int num) {
		List<User> list = new ArrayList<User>();
		String sql = "call selectu(?,?,?)";
		conn = getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, "%" + searchName + "%");
			pst.setInt(2, star);
			pst.setInt(3, num);
			rs = pst.executeQuery();
			while (rs.next()) {
				User us = new User();
				us.setUserId(rs.getInt("userid"));
				us.setUserName(rs.getString("username"));
				us.setPhone(rs.getString("phone"));
				us.setEmail(rs.getString("email"));
				us.setSex(rs.getInt("sex"));
				us.setBalance(rs.getFloat("balance"));
				us.setState(rs.getInt("state"));
				list.add(us);
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
	 * 查询资源列表
	 * 
	 * @param star
	 * @param num
	 * @return
	 */
	public List<Resources> selectres(int star, int num) {
		List<Resources> list = new ArrayList<Resources>();
		String sql = "SELECT * FROM resources ORDER BY `update` DESC LIMIT ?,?";
		conn = getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, star);
			pst.setInt(2, num);
			rs = pst.executeQuery();
			while (rs.next()) {
				Resources res = new Resources();
				res.setRid(rs.getInt("rid"));
				res.setUserid(rs.getInt("userid"));
				res.setRname(rs.getString("rname"));
				res.setUpdate(rs.getString("update"));
				res.setPrice(rs.getFloat("price"));
				res.setLabel1(rs.getString("label1"));
				res.setLabel2(rs.getString("label2"));
				res.setLabel3(rs.getString("label3"));
				res.setBrowsenum(rs.getLong("browsenum"));
				res.setState(rs.getInt("state"));
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
	 * 账号封禁/解封
	 * 
	 * @param id
	 * @param state
	 * @return
	 */
	public int updateur(int id, int state) {
		int r = 0;
		String sql = "UPDATE `user` SET state=? WHERE userid=?;";
		conn = getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, state);
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

	/**
	 * 资源封禁/解封
	 * 
	 * @param rid
	 * @param state
	 * @return
	 */
	public int updateres(int rid, int state) {
		int r = 0;
		String sql = "UPDATE resources SET state=? WHERE rid=?";
		conn = getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, state);
			pst.setInt(2, rid);
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
