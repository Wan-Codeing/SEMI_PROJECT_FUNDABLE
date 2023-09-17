package com.fun.admin.service;

import com.fun.board.model.dao.BoardDao;
import com.fun.board.model.vo.Notice;
import com.fun.board.model.vo.Qa;
import com.fun.board.model.vo.Report;
import com.fun.common.model.dao.MainDao;
import com.fun.common.model.vo.PageInfo;
import com.fun.member.model.dao.MemberDao;
import com.fun.member.model.vo.Member;
import com.fun.product.model.vo.Image;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import static com.fun.common.JDBCTemplate.*;

public class BoardService {

    public int insertNotice(Notice n) {

        Connection conn = getConnection();

        int result = new BoardDao().insertNotice(conn, n);

        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }

        close(conn);

        return result;

    }

    public int selectListCount() {

        Connection conn = getConnection();

        int listCount = new BoardDao().selectListCount2(conn);

        close(conn);

        return listCount;

    }

    public ArrayList<Qa> selectList(PageInfo pi) {
        Connection conn = getConnection();

        ArrayList<Qa> list = new BoardDao().selectList2(conn, pi);

        close(conn);

        return list;

    }

    public Qa selectQuestion(int qaNo) {
        Connection conn = getConnection();

        Qa qa = new BoardDao().selectQuestion(conn, qaNo);

        close(conn);

        return qa;
    }

    public int replyQuestion(int qaNo) {
        Connection conn = getConnection();

        int result = new BoardDao().replyQuestion(conn, qaNo);
        
        try {
			conn.setAutoCommit(false);
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
        

        close(conn);

        return result;
    }

    public int selectReListCount() {

        Connection conn = getConnection();

        int listCount = new BoardDao().selectReListCount(conn);

        close(conn);

        return listCount;

    }

    public ArrayList<Report> selectReList(PageInfo pi) {
        Connection conn = getConnection();

        ArrayList<Report> list = new BoardDao().selectReList(conn, pi);

        close(conn);

        return list;

    }

    public Report selectReport(int reportNo) {
        Connection conn = getConnection();

        Report re = new BoardDao().selectReport(conn, reportNo);

        close(conn);

        return re;
    }

	public ArrayList<Image> selecReportImag(int reportNo){
		Connection conn = getConnection();
		
		ArrayList<Image> list = new BoardDao().selecReportImag(conn, reportNo);
		
		close(conn);
		
		return list;
	}
	
	public int accessReport(int reportNo) {
        Connection conn = getConnection();

        int result = new BoardDao().accessReport(conn, reportNo);

        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }

        close(conn);

        return result;

    }

}
