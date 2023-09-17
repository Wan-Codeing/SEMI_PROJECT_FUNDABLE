package com.fun.board.model.dao;

import static com.fun.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.fun.board.model.vo.Notice;
import com.fun.board.model.vo.Qa;
import com.fun.board.model.vo.Report;
import com.fun.common.model.vo.PageInfo;
import com.fun.product.model.vo.Image;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Notice> selectBoardList(Connection conn){
		
		// SELECT문 => 여러행 => ResultSet => ArrayList
		ArrayList<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Notice n = new Notice(rset.getInt("ARTICLE_NO"),
									  rset.getInt("CLICKVIEW"),
									  rset.getString("ARTICLE_TITLE"),
									  rset.getDate("ARTICLE_CREATED_DATE"));
				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public ArrayList<Notice> selectList(Connection conn , PageInfo pi){
		
		ArrayList<Notice> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		try {
			String sql = prop.getProperty("selectList");
			pstmt = conn.prepareStatement(sql);
			/*
			 * rownum의 시작값과 종료값 공식
			 * boardLimit를 10이라고 가정
			 * currentPage = 1 => 시작값 1, 죵로값 10
			 * currentPage = 2 => 시작값 11, 종료값 20
			 * ...
			 * 
			 * 시작값 = (currentPage - 1) * boardLimit + 1
			 * 종료값 = 시작값 + boardLimit - 1
			 */
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			System.out.println(rset);
			while(rset.next()) {
				list.add(new Notice(
						  rset.getInt("ARTICLE_NO"),
						  rset.getInt("CLICKVIEW"),
						  rset.getString("ARTICLE_TITLE"),
						  rset.getDate("ARTICLE_CREATED_DATE")
						  ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int increaseCount(Connection conn, int noticeNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Notice selectNotice(Connection conn, int noticeNo) {
		
		Notice n = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice(
						rset.getInt("ARTICLE_NO"),
						rset.getString("ARTICLE_TITLE"),
						rset.getString("ARTICLE_CONTENT"),
						rset.getDate("ARTICLE_CREATED_DATE")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
		
	}
	
	public int selectListCount(Connection conn) {
		
		// SELECT문 => ResultSet객체 (한행)
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt(1); // 별칭, 칼럼의 순번 가능
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	public ArrayList<Notice> searchlist(Connection conn , String keyword, PageInfo pi){
		ArrayList<Notice> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		try {
			String sql = prop.getProperty("searchlist");
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(
						  rset.getInt("ARTICLE_NO"),
						  rset.getInt("CLICKVIEW"),
						  rset.getString("ARTICLE_TITLE"),
						  rset.getDate("ARTICLE_CREATED_DATE")
						  ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int searchListCount(Connection conn, String keyword) {
		
		// SELECT문 => ResultSet객체 (한행)
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt(1); // 별칭, 칼럼의 순번 가능
				System.out.println(listCount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	public int insertQa(Connection conn , Qa q) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertQa");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, q.getUserNo());
			pstmt.setString(2, q.getQaTitle());
			pstmt.setString(3, q.getQaContent());
			pstmt.setString(4, q.getQaEmail());
			pstmt.setString(5, q.getQaPhone());
			pstmt.setString(6, q.getQaPerson());
			result = pstmt.executeUpdate();
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertReport(Connection conn, Report r) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, r.getUserNo() );
			pstmt.setString(2, r.getUserId() );
			pstmt.setString(3, r.getUserEmail() );
			pstmt.setString(4, r.getReportTarget() );
			pstmt.setString(5, r.getReportCategory() );
			pstmt.setString(6, r.getReportTitle() );
			pstmt.setString(7, r.getReportContent() );
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertReportImg(Connection conn, ArrayList<Image> list, Report r) {
		PreparedStatement pstmt = null;
		int result = 1;
		String sql = prop.getProperty("insertReportImg");
		
		try {
			for(Image clue : list) {
				// 반복문이 돌떄마다 미완성된 sql문을 담은 pstmt객체를 생성
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, r.getUserNo());
				pstmt.setString(2, clue.getOriginName());
				pstmt.setString(3, clue.getChangeName());
				pstmt.setInt(4, clue.getFileLevel());
				pstmt.setString(5, clue.getFilePath());
				
				result *= pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteBoard(Connection conn, int boardNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	 public int insertNotice(Connection conn, Notice n) {

	        int result = 0;

	        PreparedStatement pstmt = null;

	        String sql = prop.getProperty("insertNotice");

	        try {
	            pstmt = conn.prepareStatement(sql);

	            pstmt.setString(1, n.getArticleTitle());
	            pstmt.setString(2, n.getArticleContent());

	            result = pstmt.executeUpdate();
	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        } finally {
	            close(pstmt);
	        }

	        return result;
	    }

	    public int selectListCount2(Connection conn) {

	        int listCount = 0;

	        PreparedStatement pstmt = null;

	        ResultSet rset = null;

	        String sql = prop.getProperty("selectListCount2");

	        try {
	            pstmt = conn.prepareStatement(sql);

	            rset = pstmt.executeQuery();

	            if(rset.next()) {
	                listCount = rset.getInt(1);
	            }
	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        } finally {
	            close(rset);
	            close(pstmt);
	        }

	        return listCount;

	    }

	    public ArrayList<Qa> selectList2(Connection conn, PageInfo pi) {

	        ArrayList<Qa> list = new ArrayList<>();

	        PreparedStatement pstmt = null;

	        ResultSet rset = null;

	        String sql = prop.getProperty("selectList2");

	        try {
	            pstmt = conn.prepareStatement(sql);

	            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
	            int endRow = startRow + pi.getBoardLimit() - 1;

	            pstmt.setInt(1, startRow);
	            pstmt.setInt(2, endRow);

	            rset = pstmt.executeQuery();

	            while(rset.next()) {
	                list.add(new Qa(
	                        rset.getInt("QA_NO"),
	                        rset.getInt("USER_NO"),
	                        rset.getString("QA_TITLE"),
	                        rset.getString("QA_CONTENT"),
	                        rset.getString("QA_EMAIL"),
	                        rset.getString("QA_PHONE"),
	                        rset.getDate("CREATE_DATE"),
	                        rset.getString("QA_STATUS"),
	                        rset.getString("QA_PERSON"),
	                        rset.getString("USER_ID")
	                ));
	            }
	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        } finally {
	            close(rset);
	            close(pstmt);
	        }

	        return list;
	    }

	    public Qa selectQuestion(Connection conn, int qaNo) {

	        Qa qa = null;

	        PreparedStatement pstmt = null;

	        ResultSet rset = null;

	        String sql = prop.getProperty("selectQuestion");

	        try {
	            pstmt = conn.prepareStatement(sql);

	            pstmt.setInt(1, qaNo);

	            rset = pstmt.executeQuery();

	            if(rset.next()) {
	                qa = new Qa(
	                        rset.getInt("QA_NO"),
	                        rset.getInt("USER_NO"),
	                        rset.getString("QA_TITLE"),
	                        rset.getString("QA_CONTENT"),
	                        rset.getString("QA_EMAIL"),
	                        rset.getString("QA_PHONE"),
	                        rset.getDate("CREATE_DATE"),
	                        rset.getString("QA_STATUS"),
	                        rset.getString("QA_PERSON")
	                );
	            }

	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        } finally {
	            close(rset);
	            close(pstmt);
	        }

	        return qa;

	    }

	    public int replyQuestion(Connection conn, int qaNo) {

	        int result = 0;

	        PreparedStatement pstmt = null;

	        String sql = prop.getProperty("replyQuestion");

	        try {
	            pstmt = conn.prepareStatement(sql);

	            pstmt.setInt(1, qaNo);

	            result = pstmt.executeUpdate();
	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        } finally {
	            close(pstmt);
	        }

	        return result;

	    }

	    public int selectReListCount(Connection conn) {

	        int listCount = 0;

	        PreparedStatement pstmt = null;

	        ResultSet rset = null;

	        String sql = prop.getProperty("selectReListCount");

	        try {
	            pstmt = conn.prepareStatement(sql);

	            rset = pstmt.executeQuery();

	            if(rset.next()) {
	                listCount = rset.getInt(1);
	            }
	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        } finally {
	            close(rset);
	            close(pstmt);
	        }

	        return listCount;

	    }

	    public ArrayList<Report> selectReList(Connection conn, PageInfo pi) {

	        ArrayList<Report> list = new ArrayList<>();

	        PreparedStatement pstmt = null;

	        ResultSet rset = null;

	        String sql = prop.getProperty("selectReList");

	        try {
	            pstmt = conn.prepareStatement(sql);

	            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
	            int endRow = startRow + pi.getBoardLimit() - 1;

	            pstmt.setInt(1, startRow);
	            pstmt.setInt(2, endRow);

	            rset = pstmt.executeQuery();

	            while(rset.next()) {
	                list.add(new Report(
	                        rset.getInt("REPORT_NO"),
	                        rset.getString("USER_ID"),
	                        rset.getString("REPORT_TARGET"),
	                        rset.getDate("CREATED_DATE"),
	                        rset.getString("REPORT_CONTENT"),
	                        rset.getString("REPORT_STATUS"),
	                        rset.getString("REPORT_TITLE")
	                ));
	            }
	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        } finally {
	            close(rset);
	            close(pstmt);
	        }

	        return list;
	    }

	    public Report selectReport(Connection conn, int reportNo) {

	        Report re = null;

	        PreparedStatement pstmt = null;

	        ResultSet rset = null;

	        String sql = prop.getProperty("selectReport");

	        try {
	            pstmt = conn.prepareStatement(sql);

	            pstmt.setInt(1, reportNo);

	            rset = pstmt.executeQuery();

	            if(rset.next()) {
	                re = new Report(
	                        rset.getInt("REPORT_NO"),
	                        rset.getString("USER_ID"),
	                        rset.getString("REPORT_TARGET"),
	                        rset.getDate("CREATED_DATE"),
	                        rset.getString("REPORT_CONTENT"),
	                        rset.getString("REPORT_STATUS"),
	                        rset.getString("REPORT_TITLE")
	                );
	            }

	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        } finally {
	            close(rset);
	            close(pstmt);
	        }

	        return re;

	    }
	    
	    public ArrayList<Image> selecReportImag(Connection conn, int reportNo){
			ArrayList<Image> list = new ArrayList();
			
			PreparedStatement pstmt = null;
			
			ResultSet rset = null;
			
			try {
				String sql = prop.getProperty("selecReportImag");
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, reportNo);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Image(
							  rset.getString("CHANGE_NAME"),
							  rset.getString("FILE_PATH")
							  ));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
		
	}
	    
	    public int accessReport(Connection conn, int reportNo) {

	        int result = 0;

	        PreparedStatement pstmt = null;

	        String sql = prop.getProperty("accessReport");

	        try {
	            pstmt = conn.prepareStatement(sql);

	            pstmt.setInt(1, reportNo);

	            result = pstmt.executeUpdate();

	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        } finally {
	            close(pstmt);
	        }

	        return result;

	    }
}
