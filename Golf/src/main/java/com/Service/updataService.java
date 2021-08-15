package com.Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.golfDAO;
import com.VO.memberVO;
import com.inter.Command;

public class updataService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		HttpSession session = request.getSession();
		memberVO loginvo = (memberVO)session.getAttribute("login_session");
		
		String pw = request.getParameter("updataPw");
		String call = request.getParameter("updataCall");
		String nick = request.getParameter("updataNick");
		String area = request.getParameter("updataArea");
		String birth = request.getParameter("updataBirth");
		
		
		System.out.println("updata준비");
		golfDAO dao = new golfDAO();
		int cnt = dao.updata(pw, call, nick, area, birth, loginvo.getMember_id());
		System.out.println("updat완료");
		
		return "main.jsp";

	}

}
