package com.service;

import java.util.List;

import com.bean.User;
import com.dao.BusinessDao;
import com.dao.UserDao;

public class UserService {

	/**
	 * �����û��������ѯ�û��Ƿ���ڣ���ɵ�¼
	 * 
	 * @param loginName
	 * @param passWord
	 * @return
	 */
	UserDao udao = new UserDao();
	BusinessDao bdao = new BusinessDao();

	public User login(String userName, String passWord) {
		return udao.select(userName, passWord);
	}

	/**
	 * �û�ע��
	 * 
	 * @param user
	 * @return
	 */
	public int registe(User user) {
		return udao.registe(user);
	}

	/**
	 * �����û�����ѯ�Ƿ���ڸ��û�
	 * 
	 * @param userName
	 * @return
	 */
	public int select_username(String userName) {
		return udao.select_username(userName);
	}

	/**
	 * �޸��û�����
	 * 
	 * @param user
	 * @return
	 */
	public int modify(User user) {
		return udao.modify(user);
	}

	public int repass(int id, String newpass) {
		return udao.repass(id, newpass);
	}

	/**
	 * ����ҵ������
	 * 
	 * @param bus
	 * @return
	 */
	public int insbus(int userid, int rid, int state) {
		return bdao.insbus(userid, rid, state);
	}

	/**
	 * �û����ְ�
	 * 
	 * @return
	 */
	public List<User> userhotlist() {
		// TODO Auto-generated method stub
		return udao.userhotlist();
	}

}
