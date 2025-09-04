package com.voidmain.pojo;

public class StartupRequest {

	private int id;
	private String userid;
	private String mentorid;
	private String idea;
	private String description;
	private String status;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getMentorid() {
		return mentorid;
	}
	public void setMentorid(String mentorid) {
		this.mentorid = mentorid;
	}
	public String getIdea() {
		return idea;
	}
	public void setIdea(String idea) {
		this.idea = idea;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
