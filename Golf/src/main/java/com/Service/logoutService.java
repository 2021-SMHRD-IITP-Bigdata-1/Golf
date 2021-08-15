package com.Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.inter.Command;

public class logoutService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
			//1. session을 사용할 수 있게 객체를 선언하시오.
			HttpSession session = request.getSession();
			//2. session영역에서 email_session을 삭제하시오.
			session.removeAttribute("login_session");
			//3. main.jsp로 이동하시오
			//response.sendRedirect("main.jsp");
			
			return "main.jsp";
	}

}
