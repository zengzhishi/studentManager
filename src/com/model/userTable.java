package com.model;

public class userTable {
	private String username;
	private String password;
	private String type;//这里有四种种类型的用户，学生，老师，教务员，管理员
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
