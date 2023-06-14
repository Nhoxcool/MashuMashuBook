package com.entity;

public class Comment {
	private int commentid;
	private int bookid;
	private int userid;
	private String comment;
	private String email;
	
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Comment(int commentid, int bookid, int userid, String comment, String email) {
		super();
		this.commentid = commentid;
		this.bookid = bookid;
		this.userid = userid;
		this.comment = comment;
		this.email = email;
	}

	public int getCommentid() {
		return commentid;
	}

	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Comment [commentid=" + commentid + ", bookid=" + bookid + ", userid=" + userid + ", comment=" + comment
				+ ", email=" + email + "]";
	}
	
	

	
}
