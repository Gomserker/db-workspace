package com.bg.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;

public class M {

	public static void login(HttpServletRequest request) {
		
		//�α��� �ϱ� ���ؼ�
		//����ڰ� �Է��� id, pw
		//�װ� db�� �� �ִ� �� ��
		//�� ������ ok
		
		//1. ��(value)
		String userId = request.getParameter("id");
		String userPw = request.getParameter("pw");
		
		//2. DB�� �� (���� �̰��� ����.) - �������� ó��
		
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
				//ID�� ������ PW �˻�
			String dbPW = rs.getString("l_pw");
			
			if(userPw.equals(dbPW)) {
				request.setAttribute("r", "�α��� ����");
			} else {
				request.setAttribute("r", "��� Ʋ�ȴ�");
			}
				
		} else {
			request.setAttribute("r", "�׷��� ����");
		}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
		
		
		
		
	}

}
