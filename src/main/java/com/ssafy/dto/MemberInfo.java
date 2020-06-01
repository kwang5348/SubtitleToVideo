package com.ssafy.dto;

public class MemberInfo {
	private String id;
	private String pw;
	private String mname;
	private String address;
	private String phone;
	public String getUser_id() {
		return id;
	}
	public void setUser_id(String user_id) {
		this.id = user_id;
	}
	public String getUser_pw() {
		return pw;
	}
	public void setUser_pw(String user_pw) {
		this.pw = user_pw;
	}
	public String getUser_name() {
		return mname;
	}
	public void setUser_name(String user_name) {
		this.mname = user_name;
	}
	public String getUser_address() {
		return address;
	}
	public void setUser_address(String user_address) {
		this.address = user_address;
	}
	public String getUser_phoneNumber() {
		return phone;
	}
	public void setUser_phoneNumber(String user_phoneNumber) {
		this.phone = user_phoneNumber;
	}

	
}
