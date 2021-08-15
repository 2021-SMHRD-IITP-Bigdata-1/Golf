package com.Service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.golfDAO;
import com.VO.golfVO;
import com.inter.Command;



public class list implements Command{

	
public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
	String sudo = request.getParameter("sudo");
	String member = request.getParameter("member");
	String caddy = request.getParameter("caddy");
		
	golfDAO dao = new golfDAO();
	
	
	ArrayList<golfVO> arr2 = dao.selectALL(sudo, member, caddy);
	System.out.println("����Ʈ������ԿϷ�");
	
		if(arr2!=null) {
			HttpSession session = request.getSession();
			// session ������ ����ϰڴ� ����(server)

			session.setAttribute("golf_session", arr2);	
			System.out.println("���ǻ��ԿϷ�");
		}
		
		return "main.jsp";
	}
}
