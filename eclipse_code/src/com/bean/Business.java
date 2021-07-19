package com.bean;

public class Business {
	private int busId;//业务ID
	private int userId;//用户ID
	private int rId;//资源ID
	private String busDate;//日期时间
	private int state;//状态(0:收藏,1:下载,2:发布资源)
	private float busPrice;//积分

	public float getBusPrice() {
		return busPrice;
	}

	public void setBusPrice(float busPrice) {
		this.busPrice = busPrice;
	}

	public int getBusId() {
		return busId;
	}

	public void setBusId(int busId) {
		this.busId = busId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getBusDate() {
		return busDate;
	}

	public void setBusDate(String busDate) {
		this.busDate = busDate;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

}
