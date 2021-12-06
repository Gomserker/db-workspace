package com.bg.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public class M {

	public static void call(HttpServletRequest request) {
		
		String name = request.getParameter("n");
		String age = request.getParameter("a");
		
		System.out.println(name);
		System.out.println(age);
	}
	
	
	public static void reg(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
		String name = request.getParameter("n");
		String age = request.getParameter("a");
		String sql = "insert into nameage values(?, ?)";
		
		con = DBManager.connect();
		System.out.println("연결 성공");
		
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, age);
		
		if(pstmt.executeUpdate() == 1) {
			request.setAttribute("r", "success!");
		} else {
			request.setAttribute("r", "error occured");
		}
		
		} catch (Exception e) {
			request.setAttribute("r", "DB Server Error");
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}


	public static void showAll(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		String name = request.getParameter("n");
		String age = request.getParameter("a");
		String sql = "select * from nameage";
			
		con = DBManager.connect();
		System.out.println("연결 성공");
		
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		ArrayList<Human> humans = new ArrayList<Human>();
		Human h = null;
		
		while (rs.next()) {
			System.out.println(rs.getString("n_name"));
			System.out.println(rs.getInt("n_age"));
			System.out.println("-----");
			h = new Human(rs.getString("n_name"), rs.getInt("n_age"));
			humans.add(h);
		}
		
			request.setAttribute("humans", humans);
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}
}
