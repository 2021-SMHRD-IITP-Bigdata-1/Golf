package com.Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.golfDAO;
import com.inter.Command;





public class joinService implements Command{
	public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		String name = request.getParameter("joinName");
		String id = request.getParameter("joinid");
		String pw = request.getParameter("joinPw");
		String pwck = request.getParameter("joinPwCheck");
		String call = request.getParameter("joinCall");
		String nick = request.getParameter("joinNick");
		String select = request.getParameter("joinselect");
		String golf = request.getParameter("joingolf");
		String area = request.getParameter("joinarea");
		String birth = request.getParameter("joinBirth");
	
		golfDAO dao = new golfDAO();
		int cnt = dao.Join(name, id, pw, pwck, call, nick, select, golf, area, birth);
		
		return "main.jsp";
	}
}
