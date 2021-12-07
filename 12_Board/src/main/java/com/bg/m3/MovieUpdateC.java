package com.bg.m3;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/MovieUpdateC")
public class MovieUpdateC extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//입력 받은 내용을 처리해줘야함
		if (request.getParameter("title") == null) {
			MovieDAO.extMovie(request);
			request.setAttribute("contentPage", "jsp/m3_detail.jsp");
		} else {
			MovieDAO.updateMovie(request);
			MovieDAO.getAllMovie(request);
			request.setAttribute("contentPage", "jsp/m3.jsp");
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
