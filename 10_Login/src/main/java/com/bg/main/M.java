package com.bg.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;

public class M {

	public static void login(HttpServletRequest request) {
		
		//로그인 하기 위해선
		//사용자가 입력한 id, pw
		//그걸 db에 들어가 있는 값 비교
		//다 맞으면 ok
		
		//1. 값(value)
		String userId = request.getParameter("id");
		String userPw = request.getParameter("pw");
		
		//2. DB와 비교 (아직 미개발 상태.) - 가데이터 처리
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		String sql = "select * from login_test where l_id = ?";
		
		con = DBManager.connect();
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userId);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
				//ID가 맞으면 PW 검사
			String dbPW = rs.getString("l_pw");
			
			if(userPw.equals(dbPW)) {
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

}
