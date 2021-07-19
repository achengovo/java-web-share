package com.service;

import java.util.List;

import com.bean.User;
import com.dao.BusinessDao;
import com.dao.UserDao;

public class UserService {

	/**
	 * 根据用户名密码查询用户是否存在，完成登录
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
	 * 用户注册
	 * 
	 * @param user
	 * @return
	 */
	public int registe(User user) {
		return udao.registe(user);
	}

	/**
	 * 根据用户名查询是否存在该用户
	 * 
	 * @param userName
	 * @return
	 */
	public int select_username(String userName) {
		return udao.select_username(userName);
	}

	/**
	 * 修改用户资料
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
	 * 插入业务数据
	 * 
	 * @param bus
	 * @return
	 */
	public int insbus(int userid, int rid, int state) {
		return bdao.insbus(userid, rid, state);
	}

	/**
	 * 用户积分榜单
	 * 
	 * @return
	 */
	public List<User> userhotlist() {
		// TODO Auto-generated method stub
		return udao.userhotlist();
	}

}
