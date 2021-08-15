package com.inter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	//중괄호 절 때 넣으면 안되고 세미콜론으로 마무리해야됨.
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
}