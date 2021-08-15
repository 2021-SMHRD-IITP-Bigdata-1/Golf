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
import com.VO.memberVO;
import com.google.gson.Gson;


@WebServlet("/GetUserInfo")
public class GetUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			memberVO uservo = new memberVO();
			HttpSession session = request.getSession();
			memberVO loginvo = (memberVO)session.getAttribute("login_session");
			ArrayList<memberVO> al = new ArrayList<memberVO>();
			al.add(loginvo);
			
			
			Gson gson = new Gson();	//java object -> json형태로 반환해주기는 하는데 반환햇을때타입이(String)임
			JSONArray jArray = new JSONArray();	//배열 (json 객체(JSONObject) 타입) -> 응답
			JSONParser parser = new JSONParser();	// String -> JSONObject로
			
			if(loginvo == null) {
				for (int i = 0; i < al.size(); i++) {
					memberVO vo = al.get(i);
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
					memberVO vo = al.get(i);
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
			
		}
}
