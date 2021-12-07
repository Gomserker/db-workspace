package com.bg.m3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.bg.main.DBManager;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MovieDAO {

	public static void getAllMovie(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from movie_test";
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<Movie> movies = new ArrayList<Movie>();
			Movie m = null;
			while (rs.next()) {
				m = new Movie();
				m.setNo(rs.getInt("m_no"));
				m.setTitle(rs.getString("m_title"));
				m.setActor(rs.getString("m_actor"));
				m.setImg(rs.getString("m_img"));
				m.setStory(rs.getString("m_story"));
				movies.add(m);
			}
			
			request.setAttribute("movies", movies);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	

	public static void registMovie(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DBManager.connect();
			
			String sql = "insert into movie_test values (movie_test_seq.nextval, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			
			String saveDirectory = request.getServletContext().getRealPath("img");
			
			MultipartRequest mr = new MultipartRequest(request, saveDirectory, 31457280, "utf-8", new DefaultFileRenamePolicy());
			
			String name = mr.getParameter("title");
			String actor = mr.getParameter("actor");
			String story = mr.getParameter("story");
			String fName = mr.getFilesystemName("file");
			
			// 일단 값이 잘 나오긴 하는지 확인.
			System.out.println(name);	// 이게 널이라는건 어딜 봐야되는지
			System.out.println(actor);
			System.out.println(story);
			System.out.println(fName);
			
			pstmt.setString(1, name);
			pstmt.setString(2, actor);
			pstmt.setString(3, fName);
			pstmt.setString(4, story);
			
			if(pstmt.executeUpdate() == 1) {
				request.setAttribute("r", "등록 성공");
			} else {
				request.setAttribute("r", "등록 실패");
			}
			
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
		
		
	}



	public static void deleteMovie(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DBManager.connect();
			
			String sql = "delete movie_test where m_no = ?";
			pstmt = con.prepareStatement(sql);
			
			
			int no = Integer.parseInt(request.getParameter("no"));
			
			pstmt.setInt(1, no);
			
			if(pstmt.executeUpdate() == 1) {
				request.setAttribute("r", "등록 성공");
			} else {
				request.setAttribute("r", "등록 실패");
			}
			
		
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("r", "db 서버 오류");
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	public static void updateMovie(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "update movie_test set m_title=?, m_actor=?, m_story=? where m_no=?";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("title"));
			pstmt.setString(2, request.getParameter("actor"));
			pstmt.setString(3, request.getParameter("story"));
			pstmt.setInt(4, Integer.parseInt(request.getParameter("no")));
			
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

	public static void extMovie(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from movie_test where m_no=?";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(request.getParameter("num")));
			rs = pstmt.executeQuery();
			
			Movie m = null;
			if (rs.next()) {
				m = new Movie();
				m.setNo(rs.getInt("m_no"));
				m.setTitle(rs.getString("m_title"));
				m.setActor(rs.getString("m_actor"));
				m.setImg(rs.getString("m_img"));
				m.setStory(rs.getString("m_story"));
				request.setAttribute("movie", m);
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



	

}
