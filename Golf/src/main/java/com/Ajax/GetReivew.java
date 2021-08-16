package com.Ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.VO.golfVO;
import com.VO.reviewVO;
import com.google.gson.Gson;


@WebServlet("/GetReivew")
public class GetReivew extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String scnt = null;
		HttpSession session = request.getSession();
		ArrayList<golfVO> list = (ArrayList<golfVO>)session.getAttribute("golf_session");
		ArrayList<reviewVO> al = new ArrayList<reviewVO>();
		if(list == null) {
			System.out.println("세션 리스트 값 없음");
		}else {
			//여기 바꿔줘야함
			int cnt = list.get(0).getGolf_id()+1;
			scnt = String.valueOf(cnt);
			System.out.println("세션 리스트 값 있음");
		}
			
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:XE";
			String dbid = "cgi_4_1";
			String dbpw = "smhrd1";
			conn = DriverManager.getConnection(url, dbid, dbpw);
			String sql = "select c.golf_number, r.member_nick, r.golf_star, r.golf_review from golfinfo c, review r where c.golf_number=? and c.golf_number = r.golf_number";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, scnt);
			rs = psmt.executeQuery();
			System.out.println("sql문 준비완료");
			while(rs.next()) {
				String getnick = rs.getString(2);
				int getstar = rs.getInt(3);
				String getreivew = rs.getString(4);
				reviewVO rvo = new reviewVO(getnick, getstar, getreivew);
				al.add(rvo);
				System.out.println("al삽입완료");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				psmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		Gson gson = new Gson();	//java object -> json형태로 반환해주기는 하는데 반환햇을때타입이(String)임
		JSONArray jArray = new JSONArray();	//배열 (json 객체(JSONObject) 타입) -> 응답
		JSONParser parser = new JSONParser();	// String -> JSONObject로
		
		if(list == null) {
			for (int i = 0; i < al.size(); i++) {
				reviewVO vo = al.get(i);
				String jsonStr = gson.toJson(vo); // JAVA Object -> String(json)
				JSONObject jObj = null;
				try {
					jObj = (JSONObject) parser.parse(jsonStr);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				jArray.add(jObj);
				System.out.println("처음 리스트 jarray 삽입완료");
			}
		}else{
			System.out.println("list에 데이터있음");
			for (int i = 0; i < al.size(); i++) {
				reviewVO vo = al.get(i);
				String jsonStr = gson.toJson(vo); // JAVA Object -> String(json)
				JSONObject jObj = null;
				try {
					jObj = (JSONObject) parser.parse(jsonStr);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				jArray.add(jObj);
				System.out.println("세션의 리스트 jarray 삽입완료");
			}
		}
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jArray.toString());
		System.out.println("여기까지 끝냄");
	}
}
