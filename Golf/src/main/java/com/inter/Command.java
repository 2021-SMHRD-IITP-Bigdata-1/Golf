package com.inter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	//�߰�ȣ �� �� ������ �ȵǰ� �����ݷ����� �������ؾߵ�.
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
}