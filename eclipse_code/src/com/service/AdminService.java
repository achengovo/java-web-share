package com.service;

import java.util.List;

import com.bean.*;
import com.dao.AdminDao;
import com.dao.ResourcesDao;

public class AdminService {
	AdminDao ad = new AdminDao();
	ResourcesDao rdao = new ResourcesDao();

	/**
	 * ��ѯ�û��б�
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
	 * ��ѯҵ���б�
	 * 
	 * @param star
	 * @param num
	 * @return
	 */
	public List<Business> selectb(int star, int num) {
		return ad.selectb(star, num);
	}

	/**
	 * �˺ŷ��/���
	 * 
	 * @param id
	 * @param state
	 * @return
	 */
	public int updateur(int id, int state) {
		return ad.updateur(id, state);
	}

	/**
	 * ��ѯ��Դ�б�
	 * 
	 * @param star
	 * @param num
	 * @return
	 */
	public List<Resources> selectres(int star, int num) {
		return ad.selectres(star, num);
	}

	/**
	 * ��Դ���/���
	 * 
	 * @param rid
	 * @param state
	 * @return
	 */
	public int updateres(int rid, int state) {
		return ad.updateres(rid, state);
	}
}
