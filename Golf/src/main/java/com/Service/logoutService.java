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
			//1. session�� ����� �� �ְ� ��ü�� �����Ͻÿ�.
			HttpSession session = request.getSession();
			//2. session�������� email_session�� �����Ͻÿ�.
			session.removeAttribute("login_session");
			//3. main.jsp�� �̵��Ͻÿ�
			//response.sendRedirect("main.jsp");
			
			return "main.jsp";
	}

}
