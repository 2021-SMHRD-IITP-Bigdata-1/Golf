package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.VO.golfVO;
import com.VO.memberVO;

public class golfDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	golfVO vo = null;
	memberVO mvo = null;
	int cnt = 0;
	
	public void getConn() {
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:XE";
		String dbid = "cgi_4_1";
		String dbpw = "smhrd1";
		conn = DriverManager.getConnection(url, dbid, dbpw);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			// 객체는 생성순서 역순으로 close()
			if(rs != null) {
			rs.close();
			}
			if(psmt != null) {
			psmt.close();
			}
			if(conn != null) {
			conn.close();	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public memberVO login(String id, String pw) {

		try {
			getConn();
			// sql문 작성
			String sql = "select * from memberinfo where member_id=? and member_pw=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			if (rs.next()) {
				//로그인에 성공했을 때
				String getid = rs.getString(1);
				String getpw = rs.getString(2);
				String getnick = rs.getString(3);
				String getname = rs.getString(4);
				String getcall = rs.getString(5);
				String getbirth = rs.getString(6);
				String getarea = rs.getString(7);
				String getcheck = rs.getString(8);
				String getgolf_name = rs.getString(9);
				
				mvo = new memberVO(getid, getpw, getnick, getname, getcall, getbirth, getarea, getcheck, getgolf_name);
				System.out.println("mvo삽입완료");
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return mvo;
	}
	
	public int Join(String name, String id, String pw, String pwck, String call, String nick, String select,
			String golf, String area, String birth) {
		try {
			getConn();
			String sql = "insert into memberinfo values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, nick);
			psmt.setString(4, name);
			psmt.setString(5, call);
			psmt.setString(6, birth);
			psmt.setString(7, area);
			psmt.setString(8, select);
			psmt.setString(9, golf);
			
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int updata(String pw, String call, String nick, String area, String birth, String id) {
		try {
			getConn();
			String sql = "update memberinfo set member_pw=?, member_call=?, member_nick=?, member_area=?, member_birth=? where member_id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pw);
			psmt.setString(2, call);
			psmt.setString(3, nick);
			psmt.setString(4, area);
			psmt.setString(5, birth);
			psmt.setString(6, id);
			cnt = psmt.executeUpdate();
			System.out.println("업데이트완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	
	public ArrayList<golfVO> selectALL(String sudo, String member, String caddy) {
		
		ArrayList<golfVO> arr = new ArrayList<golfVO>();
		
		try {
			getConn();
			// sql문 작성
			String sql = "select * from golfinfo where golf_area=? and golf_section=? and golf_caddy=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, sudo);
			psmt.setString(2, member);
			psmt.setString(3, caddy);
			rs = psmt.executeQuery();
			System.out.println("rs삽입완료");

			while (rs.next()) {
				int getnumber = rs.getInt(1);
				String getname = rs.getString(2);
				String getaddress = rs.getString(3);
				String getsection = rs.getString(4);
				String getholes = rs.getString(5);
				String getcourse = rs.getString(6);
				String getcall = rs.getString(7);
				String getcaddy = rs.getString(8);
				String getlick = rs.getString(9);
				String getarea = rs.getString(10);
				float getwedo = rs.getFloat(11);
				float getgongdo = rs.getFloat(12);
				vo = new golfVO(getnumber, getname, getaddress, getsection, getholes, getholes, caddy, getcall, getcourse, getcaddy, getwedo, getgongdo, getlick, getarea);
				arr.add(vo);
				System.out.println("arr 생성 완료");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return arr;
	}

}
