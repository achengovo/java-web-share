package com.bean;

public class Business {
	private int busId;//ҵ��ID
	private int userId;//�û�ID
	private int rId;//��ԴID
	private String busDate;//����ʱ��
	private int state;//״̬(0:�ղ�,1:����,2:������Դ)
	private float busPrice;//����

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
