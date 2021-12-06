package com.bg.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class AccountDAO {

	public static void loginCheck(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		Account a = (Account) hs.getAttribute("accountInfo");
		
		if(a == null) {
			//로그인 실패
			request.setAttribute("loginPage", "login.jsp");
		} else {
			//로그인 성공
			request.setAttribute("loginPage", "loginOK.jsp");
		}
	}

	public static void login(HttpServletRequest request) {
		
				String userId = request.getParameter("id");
				String userPw = request.getParameter("pw");
				
				
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try {
				String sql = "select * from login_test2 where l_id = ?";
				
				con = DBManager.connect();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, userId);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					String dbPW = rs.getString("l_pw");
					
					if(userPw.equals(dbPW)) {
						Account a = new Account();
						a.setId(rs.getString("l_id"));
						a.setPw(rs.getString("l_pw"));
						a.setName(rs.getString("l_name"));
						
						HttpSession hs = request.getSession();
						hs.setAttribute("accountInfo", a);
						hs.setMaxInactiveInterval(10);
						
						
//						request.setAttribute("a", a);
						
						request.setAttribute("r", "로그인 성공");
					} else {
						request.setAttribute("r", "비번 틀렸다");
					}
						
				} else {
					request.setAttribute("r", "그런거 없다");
				}
					
					
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					DBManager.close(con, pstmt, rs);
				}
				
	}

	public static void logOut(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		hs.setAttribute("accountInfo", null);

	}

	public static void reg(HttpServletRequest request) {
		String regId = request.getParameter("regId");
		String regPw = request.getParameter("regPw");
		String regName = request.getParameter("regName");
	}

	
	
}
