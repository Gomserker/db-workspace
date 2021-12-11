package com.bg.m4;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.bg.m3.Movie;
import com.bg.main.DBManager;

public class ReviewDAO {

	public static void getAllReview(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from review_test order by r_date desc";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<Review> reviews = new ArrayList<Review>();
			Review r = null;
			
			while(rs.next()) {
				r = new Review();
				r.setNo(rs.getInt("r_no"));
				r.setTitle(rs.getString("r_title"));
				r.setTxt(rs.getString("r_txt"));
				r.setDate(rs.getDate("r_date"));
				reviews.add(r);
			}
			request.setAttribute("reviews", reviews);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static void regReview(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into review_test values (review_test_seq.nextval, ?, ?, sysdate)";
		
		try {
			request.setCharacterEncoding("utf-8");
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, request.getParameter("title"));
			pstmt.setString(2, request.getParameter("txt"));
			
			if(pstmt.executeUpdate() == 1) {
				System.out.println("등록 성공");
				request.setAttribute("r", "등록성공");
			} else {
				request.setAttribute("r", "등록 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("r", "DB 문제");
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	public static void getReview(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from review_test where r_no=?";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("no"));
			rs = pstmt.executeQuery();
			
			Review r = null;
			
			if (rs.next()) {
				r = new Review();
				r.setNo(rs.getInt("r_no"));
				r.setTitle(rs.getString("r_title"));
				r.setTxt(rs.getString("r_txt"));
				r.setDate(rs.getDate("r_date"));
				request.setAttribute("review", r);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}
	
public static void extReview(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from review_test where r_no=?";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(request.getParameter("no")));
			rs = pstmt.executeQuery();
			
			Review r = null;
			if (rs.next()) {
				r = new Review();
				r.setTitle(rs.getString("r_title"));
				r.setTxt(rs.getString("r_txt"));
				r.setNo(Integer.parseInt(request.getParameter("no")));
				request.setAttribute("review", r);
			}
			
			
			if(pstmt.executeUpdate() ==1) {
				request.setAttribute("r", "수정 성공");
			} else {
				request.setAttribute("r", "수정 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("r", "DB error");
		} finally {
			DBManager.close(con, pstmt, rs);
		}
}

public static void updateReview(HttpServletRequest request) {
	
	Connection con = null;
	PreparedStatement pstmt = null;
//	수정일로 추가하고 싶으면 r_date=sysdate 추가할것
	String sql = "update review_test set r_title=?, r_txt=? where r_no=?";
	
	try {
		request.setCharacterEncoding("utf-8");
		con = DBManager.connect();
		pstmt = con.prepareStatement(sql);
		
		String title = request.getParameter("title");
		String txt = request.getParameter("txt");
		String no = request.getParameter("no");
		
		pstmt.setString(1, title);
		pstmt.setString(2, txt);
		pstmt.setString(3, no);
		
		if(pstmt.executeUpdate() ==1) {
			request.setAttribute("r", "수정 성공");
		} else {
			request.setAttribute("r", "수정 실패");
		}
		
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("r", "DB 에러");
	} finally {
		DBManager.close(con, pstmt, null);
	}
	
	
}

public static void reviewSearch(HttpServletRequest request) {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from review_test where";
	
	try {
		con = DBManager.connect();
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		ArrayList<Review> reviews = new ArrayList<Review>();
		Review r = null;
		
		while(rs.next()) {
			r = new Review();
			r.setNo(rs.getInt("r_no"));
			r.setTitle(rs.getString("r_title"));
			r.setTxt(rs.getString("r_txt"));
			r.setDate(rs.getDate("r_date"));
			reviews.add(r);
		}
		request.setAttribute("reviews", reviews);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		DBManager.close(con, pstmt, rs);
	}
}


}
