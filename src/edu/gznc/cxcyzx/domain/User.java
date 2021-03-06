package edu.gznc.cxcyzx.domain;

import java.util.Date;

public class User {
	private Integer userId;
	private String userName;
	private String userStuID;
	private String userPhone;
	private String userPassword;
	private Date userRegistTime;
	private String userText;
	private Room room;
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public Date getUserRegistTime() {
		return userRegistTime;
	}
	public void setUserRegistTime(Date userRegistTime) {
		this.userRegistTime = userRegistTime;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public String getUserStuID() {
		return userStuID;
	}
	public void setUserStuID(String userStuID) {
		this.userStuID = userStuID;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserText() {
		return userText;
	}
	public void setUserText(String userText) {
		this.userText = userText;
	}
}
