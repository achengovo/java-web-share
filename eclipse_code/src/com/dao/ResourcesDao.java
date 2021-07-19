package com.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.Resources;
import util.JdbcUtils;

public class ResourcesDao extends JdbcUtils {
	/**
	 * 查询资源/模糊查询/分类查询
	 * 
	 * @param searchname
	 * @param star
	 * @param num
	 * @param orderby
	 * @param page
	 * @return
	 */
	public List<Resources> selectr(String searchname, int star, int num, String orderby, int page) {
		List<Resources> list = new ArrayList<Resources>();
		String sql = "SELECT * FROM rlist WHERE CONCAT(rname,label1,label2,label3,rinformation,username) LIKE ? AND state=1";
		if (page != 0) {
			sql = sql + " AND category=?";
		}
		if ("update".equals(orderby)) {
			sql = sql + " ORDER BY `update` DESC";
		} else if ("hot".equals(orderby)) {
			sql = sql + " ORDER BY `browsenum` DESC";
		} else if ("price".equals(orderby)) {
			sql = sql + " ORDER BY `price` DESC";
		}
		sql = sql + " LIMIT ?,?";
		conn = getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, "%" + searchname + "%");
			if (page != 0) {
				pst.setInt(2, page);
				pst.setInt(3, star);
				pst.setInt(4, num);
			} else {
				pst.setInt(2, star);
				pst.setInt(3, num);
			}
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
				res.setImg(rs.getInt("img"));
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
	 * 插入资源
	 * 
	 * @param rid
	 * @param userid
	 * @param rname
	 * @param rinformation
	 * @param location
	 * @param price
	 * @param category
	 * @param label1
	 * @param label2
	 * @param label3
	 * @return
	 */
	public int upres(int rid, int userid, String rname, String rinformation, String location, float price, int category,
			String label1, String label2, String label3) {
		int r = 0;
		String sql = " CALL insres(?,?,?,?,?,?,?,?,?,?)";
		conn = getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, rid);
			pst.setInt(2, userid);
			pst.setString(3, rname);
			pst.setString(4, rinformation);
			pst.setString(5, location);
			pst.setFloat(6, price);
			pst.setInt(7, category);
			pst.setString(8, label1);
			pst.setString(9, label2);
			pst.setString(10, label3);
			rs = pst.executeQuery();
			if (rs.next()) {
				r = rs.getInt("rid");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(conn, pst, rs);
		}
		return r;
	}
}
