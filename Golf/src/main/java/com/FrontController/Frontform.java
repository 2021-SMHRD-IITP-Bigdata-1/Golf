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
		
		System.out.println("front��û����");
		
		//���� ������ ��û�� Login���� Join������ �ľ�
		String uri = request.getRequestURI();
		System.out.println("��û URI : " + uri);
		String path = request.getContextPath();
		System.out.println("����������Ʈ �̸�: " + path);
		
		String res_uri = uri.substring(path.length()+1);
		// uri : /MessageSystem.login.do
		// path : /MessageSystem
		System.out.println("����uri : "+ res_uri);
		
		//�θ��� �̸����� ���� ����
		//�̰� Ŀ�ǵ� �����Դϴ�.
		Command command = null;
		
		if(res_uri.equals("front.do")) {
			
			command = new list();
			
		}else if(res_uri.equals("join.do")) {
			
			command = new joinService();
			
		}else if(res_uri.equals("login.do")) {
			
			command = new loginService();
			
		}else if(res_uri.equals("updata.do")) {
			System.out.println("updata�����غ�");
			command = new updataService();
			
		}else if(res_uri.equals("logout.do")) {
			
			command = new logoutService();
			
		}
		
		String nextPage = command.execute(request, response);
		response.sendRedirect(nextPage);
		
	}

}
