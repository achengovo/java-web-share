package com.bean;

public class Resources {
	private int rid;//��ԴID
	private int userid;//�û�ID
	private String rname;//�û���
	private String rinformation;//��Դ��Ϣ
	private String update;//�ϴ�����ʱ��
	private long browsenum;//������
	private String location;//�ļ���
	private float price;//����
	private int category;//����
	private String label1;//��ǩ
	private String label2;
	private String label3;
	private String username;//�û���
	private int img;//�Ƿ���ͼƬ
	private int state;//��Դ״̬(1:����,0:���)

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getImg() {
		return img;
	}

	public void setImg(int img) {
		this.img = img;
	}

	public String getUpdate() {
		return update;
	}

	public void setUpdate(String update) {
		this.update = update;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getRinformation() {
		return rinformation;
	}

	public void setRinformation(String rinformation) {
		this.rinformation = rinformation;
	}

	public long getBrowsenum() {
		return browsenum;
	}

	public void setBrowsenum(long browsenum) {
		this.browsenum = browsenum;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getLabel1() {
		return label1;
	}

	public void setLabel1(String label1) {
		this.label1 = label1;
	}

	public String getLabel2() {
		return label2;
	}

	public void setLabel2(String label2) {
		this.label2 = label2;
	}

	public String getLabel3() {
		return label3;
	}

	public void setLabel3(String label3) {
		this.label3 = label3;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String uname) {
		this.username = uname;
	}

}