package com.VO;

public class reviewVO {
	
	private int review_number;
	private int golf_number;
	private String member_nick;
	private int golf_star;
	private String golf_review;
	
	public reviewVO() {
		
	}
	
	
	
	public reviewVO(String member_nick, int golf_star, String golf_review) {
		super();
		this.member_nick = member_nick;
		this.golf_star = golf_star;
		this.golf_review = golf_review;
	}



	public reviewVO(int review_number, int golf_number, String member_nick, int golf_star, String golf_review) {
		super();
		this.review_number = review_number;
		this.golf_number = golf_number;
		this.member_nick = member_nick;
		this.golf_star = golf_star;
		this.golf_review = golf_review;
	}

	public int getReview_number() {
		return review_number;
	}

	public void setReview_number(int review_number) {
		this.review_number = review_number;
	}

	public int getGolf_number() {
		return golf_number;
	}

	public void setGolf_number(int golf_number) {
		this.golf_number = golf_number;
	}

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public int getGolf_star() {
		return golf_star;
	}

	public void setGolf_star(int golf_star) {
		this.golf_star = golf_star;
	}

	public String getGolf_review() {
		return golf_review;
	}

	public void setGolf_review(String golf_review) {
		this.golf_review = golf_review;
	}
	
	
	
}
