package com.bean;

public class Resources {
	private int rid;//资源ID
	private int userid;//用户ID
	private String rname;//用户名
	private String rinformation;//资源信息
	private String update;//上传日期时间
	private long browsenum;//购买量
	private String location;//文件名
	private float price;//积分
	private int category;//分类
	private String label1;//标签
	private String label2;
	private String label3;
	private String username;//用户名
	private int img;//是否有图片
	private int state;//资源状态(1:正常,0:封禁)

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