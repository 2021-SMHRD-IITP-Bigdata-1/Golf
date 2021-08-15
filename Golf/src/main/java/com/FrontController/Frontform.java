package com.FrontController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.Service.joinService;
import com.Service.list;
import com.Service.loginService;
import com.Service.logoutService;
import com.Service.updataService;
import com.inter.Command;




@WebServlet("*.do")
public class Frontform extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("front요청성공");
		
		//현재 들어오는 요청이 Login인지 Join인지를 파악
		String uri = request.getRequestURI();
		System.out.println("요청 URI : " + uri);
		String path = request.getContextPath();
		System.out.println("현재프로젝트 이름: " + path);
		
		String res_uri = uri.substring(path.length()+1);
		// uri : /MessageSystem.login.do
		// path : /MessageSystem
		System.out.println("최종uri : "+ res_uri);
		
		//부모의 이름으로 생성 가능
		//이게 커맨드 패턴입니다.
		Command command = null;
		
		if(res_uri.equals("front.do")) {
			
			command = new list();
			
		}else if(res_uri.equals("join.do")) {
			
			command = new joinService();
			
		}else if(res_uri.equals("login.do")) {
			
			command = new loginService();
			
		}else if(res_uri.equals("updata.do")) {
			System.out.println("updata실행준비");
			command = new updataService();
			
		}else if(res_uri.equals("logout.do")) {
			
			command = new logoutService();
			
		}
		
		String nextPage = command.execute(request, response);
		response.sendRedirect(nextPage);
		
	}

}
