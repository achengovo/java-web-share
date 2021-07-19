package com.service;

import java.util.List;

import com.bean.*;
import com.dao.AdminDao;
import com.dao.ResourcesDao;

public class AdminService {
	AdminDao ad = new AdminDao();
	ResourcesDao rdao = new ResourcesDao();

	/**
	 * 查询用户列表
	 * 
	 * @param searchName
	 * @param star
	 * @param num
	 * @return
	 */
	public List<User> selectu(String searchName, int star, int num) {
		return ad.selectu(searchName, star, num);
	}

	/**
	 * 查询业务列表
	 * 
	 * @param star
	 * @param num
	 * @return
	 */
	public List<Business> selectb(int star, int num) {
		return ad.selectb(star, num);
	}

	/**
	 * 账号封禁/解封
	 * 
	 * @param id
	 * @param state
	 * @return
	 */
	public int updateur(int id, int state) {
		return ad.updateur(id, state);
	}

	/**
	 * 查询资源列表
	 * 
	 * @param star
	 * @param num
	 * @return
	 */
	public List<Resources> selectres(int star, int num) {
		return ad.selectres(star, num);
	}

	/**
	 * 资源封禁/解封
	 * 
	 * @param rid
	 * @param state
	 * @return
	 */
	public int updateres(int rid, int state) {
		return ad.updateres(rid, state);
	}
}
