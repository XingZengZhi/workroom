package edu.gznc.cxcyzx.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Room {
	private Integer roomId;
	private String roomName;
	private String roomSum;
	private Date roomFoundTime;
	private String roomContactWay;
	private Set<User> users = new HashSet<User>();
	private Set<Article> articles = new HashSet<Article>();
	private Set<Video> videos = new HashSet<Video>();
	public Integer getRoomId() {
		return roomId;
	}
	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getRoomSum() {
		return roomSum;
	}
	public void setRoomSum(String roomSum) {
		this.roomSum = roomSum;
	}
	public Date getRoomFoundTime() {
		return roomFoundTime;
	}
	public void setRoomFoundTime(Date roomFoundTime) {
		this.roomFoundTime = roomFoundTime;
	}
	public String getRoomContactWay() {
		return roomContactWay;
	}
	public void setRoomContactWay(String roomContactWay) {
		this.roomContactWay = roomContactWay;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	public Set<Article> getArticles() {
		return articles;
	}
	public void setArticles(Set<Article> articles) {
		this.articles = articles;
	}
	public Set<Video> getVideos() {
		return videos;
	}
	public void setVideos(Set<Video> videos) {
		this.videos = videos;
	}
}
