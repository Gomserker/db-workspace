package com.bg.account;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 로그아웃하는 일
		AccountDAO.logOut(request);
		AccountDAO.loginCheck(request);
		
		request.setAttribute("contentPage", "home.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 일
		AccountDAO.login(request);
		AccountDAO.loginCheck(request);
		
		// 1. 두개 써야된다
		// 2. 먼저 체크해야된다
		// 3. 나중에 체크해야된다.
		// 4. 순서는 상관이 없다.
		
		request.setAttribute("contentPage", "home.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
