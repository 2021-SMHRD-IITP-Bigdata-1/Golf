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
import com.google.gson.Gson;


@WebServlet("/GetSrcList")
public class GetSrcList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		HttpSession session = request.getSession();
		ArrayList<golfVO> list = (ArrayList<golfVO>)session.getAttribute("golf_session");
		ArrayList<golfVO> al = new ArrayList<golfVO>();
		if(list == null) {
			System.out.println("���� ����Ʈ �� ����");
		}else {
			System.out.println("���� ����Ʈ �� ����");
		}
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:XE";
			String dbid = "cgi_4_1";
			String dbpw = "smhrd1";
			conn = DriverManager.getConnection(url, dbid, dbpw);
			String sql = "select * from golfinfo";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			System.out.println("sql�� �غ�Ϸ�");
			while(rs.next()) {
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
				String getimg = rs.getString(13);
				golfVO vo = new golfVO(getnumber,getname, getaddress, getsection, getholes,getcourse ,getcall, getcaddy, getlick, getarea, getwedo, getgongdo, getimg);
				al.add(vo);
				System.out.println("al���ԿϷ�");
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
		
		Gson gson = new Gson();	//java object -> json���·� ��ȯ���ֱ�� �ϴµ� ��ȯ������Ÿ����(String)��
		JSONArray jArray = new JSONArray();	//�迭 (json ��ü(JSONObject) Ÿ��) -> ����
		JSONParser parser = new JSONParser();	// String -> JSONObject��
		
		if(list == null) {
			for (int i = 0; i < al.size(); i++) {
				golfVO vo = al.get(i);
				String jsonStr = gson.toJson(vo); // JAVA Object -> String(json)
				JSONObject jObj = null;
				try {
					jObj = (JSONObject) parser.parse(jsonStr);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				jArray.add(jObj);
				System.out.println("ó�� ����Ʈ jarray ���ԿϷ�");
			}
		}else{
			System.out.println("list�� ����������");
			for (int i = 0; i < list.size(); i++) {
				golfVO vo = list.get(i);
				String jsonStr = gson.toJson(vo); // JAVA Object -> String(json)
				JSONObject jObj = null;
				try {
					jObj = (JSONObject) parser.parse(jsonStr);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				jArray.add(jObj);
				System.out.println("������ ����Ʈ jarray ���ԿϷ�");
			}
		}
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jArray.toString());
		System.out.println("������� ����");
	}
}
