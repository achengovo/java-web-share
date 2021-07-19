package com.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.Resources;

import util.JdbcUtils;

public class BusinessDao extends JdbcUtils {
	/**
	 * 插入业务数据
	 * 
	 * @param bus
	 * @return
	 */
	public int insbus(int userid, int rid, int state) {
		int r = 0;
		String sql = "call insbus(?,?,?)";
		conn = getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userid);
			pst.setInt(2, rid);
			pst.setInt(3, state);
			rs = pst.executeQuery();
			if (rs.next()) {
				r = rs.getInt("res");
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
	 * 查询收藏列表
	 * 
	 * @param userid
	 * @param star
	 * @param num
	 * @return
	 */
	public List<Resources> likelist(int userid, int star, int num) {
		List<Resources> list = new ArrayList<Resources>();
		String sql = "CALL likelist(?,?,?)";
		conn = getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userid);
			pst.setInt(2, star);
			pst.setInt(3, num);
			rs = pst.executeQuery();
			while (rs.next()) {
				Resources res = new Resources();
				res.setRname(rs.getString("rname"));
				res.setRid(rs.getInt("rid"));
				res.setUserid(rs.getInt("userid"));
				res.setUsername(rs.getString("username"));
				res.setUpdate(rs.getString("update"));
				res.setRinformation(rs.getString("rinformation"));
				res.setBrowsenum(rs.getLong("browsenum"));
				res.setLabel1(rs.getString("label1"));
				res.setLabel2(rs.getString("label2"));
				res.setLabel3(rs.getString("label3"));
				res.setPrice(rs.getFloat("price"));
				res.setCategory(rs.getInt("category"));
				res.setLocation(rs.getString("location"));
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
}
