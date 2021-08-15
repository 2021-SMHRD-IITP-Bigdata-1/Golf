package com.Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.golfDAO;
import com.VO.memberVO;
import com.inter.Command;

public class loginService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		String id = request.getParameter("loginId");
		String pw = request.getParameter("loginPw");
		
		golfDAO dao = new golfDAO();
		memberVO loginservicevo = dao.login(id, pw);
		System.out.println(loginservicevo.getMember_nick());
		if(loginservicevo!=null) {
			HttpSession session = request.getSession();
			// session 영역을 사용하겠다 선언(server)

			session.setAttribute("login_session", loginservicevo);	
			System.out.println("로그인세션삽입완료");
		}
		
		return "main.jsp";
	}

}
