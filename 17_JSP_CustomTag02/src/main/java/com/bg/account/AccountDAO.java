package com.bg.account;

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
			// 로그인 실패
			request.setAttribute("loginPage", "member/login.jsp");
		} else {
			// 로그인 성공
			request.setAttribute("loginPage", "member/loginOK.jsp");
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

			if (rs.next()) {
				String dbPW = rs.getString("l_pw");
				
				if (userPw.equals(dbPW)) {
					// 값이 여러개니까 뭉쳐서
					Account a = new Account();
					a.setId(rs.getString("l_id"));
					a.setPw(rs.getString("l_pw"));
					a.setName(rs.getString("l_name"));
					
					HttpSession hs = request.getSession();
					hs.setAttribute("accountInfo", a);
					hs.setMaxInactiveInterval(60);
					
					
					
//					request.setAttribute("a", a);
					
					request.setAttribute("r", "로그인 성공!");
				} else {
					request.setAttribute("r", "비밀번호 오류!");
				}
			} else {
				request.setAttribute("r", "존재하지 않는 회원 입니다");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}

	}


	public static void logOut(HttpServletRequest request) {
		// 로그아웃 하는 일
		// 세션을 죽이자.
		//	애초에 만들어진적이 없을때, 설정한 시간이 만료 되었을때.
		HttpSession hs = request.getSession();
		hs.setAttribute("accountInfo", null);
//		hs.removeAttribute("accountInfo");
		
		request.setAttribute("r", "로그아웃 성공");
		
		
	}

}
