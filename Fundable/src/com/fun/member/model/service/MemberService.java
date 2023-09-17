package com.fun.member.model.service;
import static com.fun.common.JDBCTemplate.close;
import static com.fun.common.JDBCTemplate.commit;
import static com.fun.common.JDBCTemplate.getConnection;
import static com.fun.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.fun.board.model.vo.Qa;
import com.fun.member.model.dao.MemberDao;
import com.fun.member.model.vo.Member;
import com.fun.member.model.vo.Pay;
import com.fun.product.model.vo.Image;
import com.fun.product.model.vo.Product;

public class MemberService {
	
	public int idCheck(String userId) {
		Connection conn = getConnection();
		int result = new MemberDao().idCheck(conn,userId);
		close(conn);
		return result;
	}
	
	public int insertMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn, m);
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
	
	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn,userId,userPwd);
		
		close(conn);
		
		return loginUser;
		
	}
	
	public Image selectProfileImg(String userId) {
		
		Connection conn = getConnection();
		
		Image profileImg = new MemberDao().selectProfileImg(conn,userId);
		
		close(conn);
		
		return profileImg;
	}
	
	public ArrayList<Image> selectProfileProductImg(String userId){
	
		Connection conn = getConnection();
	
		ArrayList<Image> pList = new MemberDao().selectProfileProductImg(conn,userId);
	
		close(conn);
	
		return pList;
	}
	
	
	public ArrayList<Pay> selectProfileProductText(String userId){
		
		Connection conn = getConnection();
		
		ArrayList<Pay> pTextList = new MemberDao().selectProfileProductText(conn,userId);
		
		close(conn);
		
		return pTextList;
		
	}
	
	
	public ArrayList<Image> selectWishImg(int userNo){
		
		Connection conn = getConnection();
		
		ArrayList<Image> wishImg = new MemberDao().selectWishImg(conn,userNo);
		
		close(conn);
		
		return wishImg;
	}
	
	
	public ArrayList<Product> selectWishp(int userNo){
		
		Connection conn = getConnection();
		
		ArrayList<Product> wishP = new MemberDao().selectWishp(conn,userNo);
		
		close(conn);
		
		return wishP;
		
	}
	
	public int refundProduct(String orderNo,String refundRequest) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().refundProduct(conn,orderNo,refundRequest);
		
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	
	   public int myPageUpdateCount(String orderNo) {
		      
		      Connection conn = getConnection();
		      
		      int result = new MemberDao().myPageUpdateCount(conn,orderNo);
		      
		      
		      if(result > 0 ) {
		         commit(conn);
		      }else {
		         rollback(conn);
		      }
		      close(conn);
		      
		      return result;
		      
		   }
	
	
	public int infoCheckPwd(String pwd , String id) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().infoCheckPwd(conn,pwd,id);
		
		close(conn);
		
		return result;
		
	}
	
	public Member updateMember(String userId ,String nick, String email, String changePwd, String interest) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn,userId,nick,email,changePwd,interest);
		
		Member updateMember = null;
		
		try {
			conn.setAutoCommit(false);
			if(result > 0) {
				commit(conn);
				updateMember = new MemberDao().selectMember(conn,userId);
				
			}else {
				rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(conn);
		
		return updateMember;
		
		
	}
	
	
	public Image updateImg(Image img,String userId,String hiddenSql) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updateImg(conn,img,hiddenSql);
		
		Image updateImg = null;
		
		try {
			conn.setAutoCommit(false);
			if(result > 0 ) {
				commit(conn);
				
				updateImg = new MemberDao().selectProfileImg(conn, userId);
			}else {
				rollback(conn);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(conn);
		return updateImg;
		
	}
	
	
	public int deleteImg(int userNo) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteImg(conn,userNo);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	public int updateWish(int userNo , int productNo) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updateWish(conn,userNo,productNo);
		
		try {
			conn.setAutoCommit(false);
			if(result > 0 ) {
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
	
	
	public ArrayList<Qa> selectQaList(int userNo) {
		
		
		Connection conn = getConnection();
		
		ArrayList<Qa> qaList = new MemberDao().selectQaList(conn,userNo);
		
		close(conn);
		
		return qaList;
		
		
	}
	
	
	
	public ArrayList<Image> selectSearchP(int userNo, String startDate, String endDate){
		
		Connection conn = getConnection();
		
		ArrayList<Image> selectSearchP = new MemberDao().selectSearchP(conn,userNo,startDate,endDate);
		
		close(conn);
		
		return selectSearchP;
		
		
	}
	
	
	public ArrayList<Pay> searchTextList(int userNo, String startDate, String endDate){
		
		Connection conn = getConnection();
		
		ArrayList<Pay> searchTextList = new MemberDao().searchTextList(conn,userNo,startDate,endDate);
		
		close(conn);
		
		return searchTextList;
		
	}
	
public int myPageInsertSeller(int userNo) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().myPageInsertSeller(conn,userNo);
		
		try {
			conn.setAutoCommit(false);
			if(result > 0 ) {
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


	public int jhDeleteMember(int userNo) {
	
	Connection conn = getConnection();
	
	int result = new MemberDao().jhDeleteMember(conn,userNo);
	
	try {
		conn.setAutoCommit(false);
		if(result > 0 ) {
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
