package com.service;

import java.util.List;

import com.bean.Resources;
import com.dao.BusinessDao;
import com.dao.ResourcesDao;

public class ResourcesService {
	ResourcesDao rdao = new ResourcesDao();
	BusinessDao bdao = new BusinessDao();

	/**
	 * 查询资源列表
	 * 
	 * @param searchname
	 * @param star
	 * @param num
	 * @param orderby
	 * @param page
	 * @return
	 */
	public List<Resources> liebiao(String searchname, int star, int num, String orderby, int page) {
		return rdao.selectr(searchname, star, num, orderby, page);
	}

	/**
	 * 收藏列表
	 * 
	 * @param userid
	 * @param star
	 * @param num
	 * @return
	 */
	public List<Resources> likelist(int userid, int star, int num) {
		return bdao.likelist(userid, star, num);
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
		return rdao.upres(rid, userid, rname, rinformation, location, price, category, label1, label2, label3);
	}
}
