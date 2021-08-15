package com.VO;

public class memberVO {
	
	private String member_id;
	private String member_pw;
	private String member_nick;
	private String member_name;
	private String member_call;
	private String member_birth;
	private String member_area;
	private String member_check;
	private String golf_name;
	
	public memberVO() {
		
	}
	
	public memberVO(String member_nick) {
		super();
		this.member_nick = member_nick;
	}

	public memberVO(String member_id, String member_pw, String member_nick, String member_name, String member_call,
			String member_birth, String member_area, String member_check, String golf_name) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_nick = member_nick;
		this.member_name = member_name;
		this.member_call = member_call;
		this.member_birth = member_birth;
		this.member_area = member_area;
		this.member_check = member_check;
		this.golf_name = golf_name;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_call() {
		return member_call;
	}

	public void setMember_call(String member_call) {
		this.member_call = member_call;
	}

	public String getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}

	public String getMember_area() {
		return member_area;
	}

	public void setMember_area(String member_area) {
		this.member_area = member_area;
	}

	public String getMember_check() {
		return member_check;
	}

	public void setMember_check(String member_check) {
		this.member_check = member_check;
	}

	public String getGolf_name() {
		return golf_name;
	}

	public void setGolf_name(String golf_name) {
		this.golf_name = golf_name;
	}
	
	
	
}
