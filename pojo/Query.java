package com.voidmain.pojo;

public class Query {

	private int id;
	private String postedBy;
	private String postedTo;
	private String queryDate;
	private String query;
	private String reply;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPostedBy() {
		return postedBy;
	}
	public void setPostedBy(String postedBy) {
		this.postedBy = postedBy;
	}
	public String getPostedTo() {
		return postedTo;
	}
	public void setPostedTo(String postedTo) {
		this.postedTo = postedTo;
	}
	public String getQueryDate() {
		return queryDate;
	}
	public void setQueryDate(String queryDate) {
		this.queryDate = queryDate;
	}
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
}
