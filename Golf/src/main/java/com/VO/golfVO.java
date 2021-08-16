package com.VO;

public class golfVO {
	private int golf_id;
	private String golf_name;
	private String golf_address;
	private String golf_section;
	private String golf_holes;
	private String golf_course;
	private String golf_call;
	private String golf_caddy;
	private String golf_link;
	private String detail_course;
	private String golf_area;
	private float lat;
	private float lag;
	private String golf_img;
	private String detail_eaplan;
	
	public golfVO() {
		
	}
	
	
	public golfVO(int golf_id, String golf_name, String golf_address, String golf_section, String golf_holes,
			String golf_course, String golf_call, String golf_caddy, String golf_link, String golf_area, float lat,
			float lag, String golf_img) {
		super();
		this.golf_id = golf_id;
		this.golf_name = golf_name;
		this.golf_address = golf_address;
		this.golf_section = golf_section;
		this.golf_holes = golf_holes;
		this.golf_course = golf_course;
		this.golf_call = golf_call;
		this.golf_caddy = golf_caddy;
		this.golf_link = golf_link;
		this.golf_area = golf_area;
		this.lat = lat;
		this.lag = lag;
		this.golf_img = golf_img;
	}




	public golfVO(int golf_id, String golf_name, String golf_address, String golf_section, String golf_holes,
			String golf_call, String golf_caddy, String golf_link, String golf_area, float lat, float lag,
			String golf_img) {
		super();
		this.golf_id = golf_id;
		this.golf_name = golf_name;
		this.golf_address = golf_address;
		this.golf_section = golf_section;
		this.golf_holes = golf_holes;
		this.golf_call = golf_call;
		this.golf_caddy = golf_caddy;
		this.golf_link = golf_link;
		this.golf_area = golf_area;
		this.lat = lat;
		this.lag = lag;
		this.golf_img = golf_img;
	}



	public golfVO(int golf_id, String golf_name, String golf_address, String golf_section, String golf_holes,
			String golf_call, String golf_caddy, String golf_link, String detail_course, String golf_area, float lat,
			float lag, String golf_img, String detail_eaplan) {
		super();
		this.golf_id = golf_id;
		this.golf_name = golf_name;
		this.golf_address = golf_address;
		this.golf_section = golf_section;
		this.golf_holes = golf_holes;
		this.golf_call = golf_call;
		this.golf_caddy = golf_caddy;
		this.golf_link = golf_link;
		this.detail_course = detail_course;
		this.golf_area = golf_area;
		this.lat = lat;
		this.lag = lag;
		this.golf_img = golf_img;
		this.detail_eaplan = detail_eaplan;
	}

	public int getGolf_id() {
		return golf_id;
	}

	public void setGolf_id(int golf_id) {
		this.golf_id = golf_id;
	}

	public String getGolf_name() {
		return golf_name;
	}

	public void setGolf_name(String golf_name) {
		this.golf_name = golf_name;
	}

	public String getGolf_address() {
		return golf_address;
	}

	public void setGolf_address(String golf_address) {
		this.golf_address = golf_address;
	}

	public String getGolf_section() {
		return golf_section;
	}

	public void setGolf_section(String golf_section) {
		this.golf_section = golf_section;
	}

	public String getGolf_holes() {
		return golf_holes;
	}

	public void setGolf_holes(String golf_holes) {
		this.golf_holes = golf_holes;
	}

	public String getGolf_call() {
		return golf_call;
	}

	public void setGolf_call(String golf_call) {
		this.golf_call = golf_call;
	}

	public String getGolf_caddy() {
		return golf_caddy;
	}

	public void setGolf_caddy(String golf_caddy) {
		this.golf_caddy = golf_caddy;
	}

	public String getGolf_link() {
		return golf_link;
	}

	public void setGolf_link(String golf_link) {
		this.golf_link = golf_link;
	}

	public String getDetail_course() {
		return detail_course;
	}

	public void setDetail_course(String detail_course) {
		this.detail_course = detail_course;
	}

	public String getGolf_area() {
		return golf_area;
	}

	public void setGolf_area(String golf_area) {
		this.golf_area = golf_area;
	}

	public float getLat() {
		return lat;
	}

	public void setLat(float lat) {
		this.lat = lat;
	}

	public float getLag() {
		return lag;
	}

	public void setLag(float lag) {
		this.lag = lag;
	}

	public String getGolf_img() {
		return golf_img;
	}

	public void setGolf_img(String golf_img) {
		this.golf_img = golf_img;
	}

	public String getDetail_eaplan() {
		return detail_eaplan;
	}

	public void setDetail_eaplan(String detail_eaplan) {
		this.detail_eaplan = detail_eaplan;
	}




	public String getGolf_course() {
		return golf_course;
	}




	public void setGolf_course(String golf_course) {
		this.golf_course = golf_course;
	}
	
	
	   
}