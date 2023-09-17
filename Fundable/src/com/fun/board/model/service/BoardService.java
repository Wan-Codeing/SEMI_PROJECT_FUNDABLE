package com.fun.board.model.service;

import static com.fun.common.JDBCTemplate.close;
import static com.fun.common.JDBCTemplate.commit;
import static com.fun.common.JDBCTemplate.getConnection;
import static com.fun.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.fun.board.model.dao.BoardDao;
import com.fun.board.model.vo.Notice;
import com.fun.board.model.vo.Qa;
import com.fun.board.model.vo.Report;
import com.fun.common.model.vo.PageInfo;
import com.fun.product.model.vo.Image;

public class BoardService {
	
	public ArrayList<Notice> selectBoardList(){
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new BoardDao().selectBoardList(conn);
		close(conn);
		
		return list;
	}
	
	public ArrayList<Notice> selectList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new BoardDao().selectList(conn,pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Notice> searchlist(String keyword, PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new BoardDao().searchlist(conn,keyword,pi);
		
		close(conn);
		
		return list;
	}
	
	
	
	public int increaseCount(int noticeNo) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().increaseCount(conn, noticeNo);
		try {
			conn.setAutoCommit(false);
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(conn);
		
		return result;
	}
	
	public Notice selectNotice(int noticeNo) {
		Connection conn = getConnection();
		
		Notice n  = new BoardDao().selectNotice(conn, noticeNo);
		
		close(conn);
		
		return n;
	}
	
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	} 
	
	public int searchListCount(String keyword) {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().searchListCount(conn, keyword);
		
		close(conn);
		
		return listCount;
	}
	
	public int insertQa(Qa q) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertQa(conn,q);
		
		close(conn);
		
		return result;
	}
	
	public int insertReport(Report r , ArrayList<Image> list) {
		Connection conn = getConnection();
		
		int result1 = new BoardDao().insertReport(conn, r);
		int result2 = new BoardDao().insertReportImg(conn, list,r);
		
		try {
			conn.setAutoCommit(false);
			if(result1 > 0 && result2 > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		close(conn);
		
		return result1 * result2;
	}
	
	public int deleteBoard(int boardNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoard(conn, boardNo);
		
		try {
			conn.setAutoCommit(false);
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(conn);
		
		return result;
		
	}
}
