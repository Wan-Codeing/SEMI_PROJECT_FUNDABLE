package com.fun.member.model.dao;

import static com.fun.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.fun.board.model.vo.Qa;
import com.fun.common.model.vo.PageInfo;
import com.fun.member.model.service.MemberService;
import com.fun.member.model.vo.Member;
import com.fun.member.model.vo.Pay;
import com.fun.product.model.vo.Image;
import com.fun.product.model.vo.Product;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int idCheck(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = 1;
			}else {
				result = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertMember(Connection conn, Member m) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getUserNick());
			pstmt.setString(5, m.getUserSsg());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getAddress());
			pstmt.setString(8, m.getPhone());
			pstmt.setString(9, m.getUserInterest());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
public Member loginMember(Connection conn, String userId,String userPwd) {
		
		Member m = null;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("loginMember");
		
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(
						rset.getInt("USER_NO"),
						rset.getString("USER_ID"),
						rset.getString("USER_PWD"),
						rset.getString("USER_NAME"),
						rset.getString("USER_NICKNAME"),
						rset.getString("USER_SSG"),
						rset.getString("USER_EMAIL"),
						rset.getString("USER_ADDRESS"),
						rset.getString("USER_PHONE"),
						rset.getDate("ENTER_DATE"),
						rset.getString("USER_INTEREST"),
						rset.getString("USER_STATUS")
						);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
		
		
	}
	
	public int selectListCount(Connection conn) {

        int listCount = 0;

        PreparedStatement pstmt = null;

        ResultSet rset = null;

        String sql = prop.getProperty("selectListCount");

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

    public ArrayList<Member> selectList(Connection conn, PageInfo pi) {

        ArrayList<Member> list = new ArrayList<>();

        PreparedStatement pstmt = null;

        ResultSet rset = null;

        String sql = prop.getProperty("selectList");

        try {
            pstmt = conn.prepareStatement(sql);

            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() - 1;

            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);

            rset = pstmt.executeQuery();

            while(rset.next()) {
                list.add(new Member(
                        rset.getInt("USER_NO"),
                        rset.getString("USER_ID"),
                        rset.getString("USER_NAME"),
                        rset.getString("USER_NICKNAME"),
                        rset.getString("USER_EMAIL"),
                        rset.getString("USER_ADDRESS"),
                        rset.getString("USER_PHONE"),
                        rset.getDate("ENTER_DATE"),
                        rset.getString("USER_STATUS"),
                        rset.getString("SELLER_YN")
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

    public int searchListCount(Connection conn, int category, String keyword, String seller, String banned) {

        int listCount = 0;

        PreparedStatement pstmt = null;

        ResultSet rset = null;

        String sql = "";

        if(category == 0) {
            sql = prop.getProperty("searchListCount0");
        } else {
            sql = prop.getProperty("searchListCount1");
        }

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, "%"+keyword+"%");
            pstmt.setString(2, banned);
            pstmt.setString(3, seller);

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

    public ArrayList<Member> searchList(Connection conn, PageInfo pi, int category, String keyword, String seller, String banned) {

        ArrayList<Member> list = new ArrayList<>();

        PreparedStatement pstmt = null;

        ResultSet rset = null;


        String sql = "";

        if(category == 0) {
            sql = prop.getProperty("searchList0");
        } else {
            sql = prop.getProperty("searchList1");
        }

        try {
            pstmt = conn.prepareStatement(sql);

            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() - 1;

            pstmt.setString(1, "%"+keyword+"%");
            pstmt.setString(2, banned);
            pstmt.setString(3, seller);

            pstmt.setInt(4, startRow);
            pstmt.setInt(5, endRow);

            rset = pstmt.executeQuery();

            while(rset.next()) {
                list.add(new Member(
                        rset.getInt("USER_NO"),
                        rset.getString("USER_ID"),
                        rset.getString("USER_NAME"),
                        rset.getString("USER_NICKNAME"),
                        rset.getString("USER_EMAIL"),
                        rset.getString("USER_ADDRESS"),
                        rset.getString("USER_PHONE"),
                        rset.getDate("ENTER_DATE"),
                        rset.getString("USER_STATUS"),
                        rset.getString("SELLER_YN")
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

    public int deleteMember(Connection conn, int userNo) {

        int result = 0;

        PreparedStatement pstmt = null;

        String sql = prop.getProperty("deleteMember");

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, userNo);

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(pstmt);
        }

        return result;
    }

    public int banMember(Connection conn, int userNo) {

        int result = 0;

        PreparedStatement pstmt = null;

        String sql = prop.getProperty("banMember");

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, userNo);

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(pstmt);
        }

        return result;
    }

    public int releaseMember(Connection conn, int userNo) {

        int result = 0;

        PreparedStatement pstmt = null;

        String sql = prop.getProperty("releaseMember");

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, userNo);

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(pstmt);
        }

        return result;
    }

    public int selectPayListCount(Connection conn) {

        int listCount = 0;

        PreparedStatement pstmt = null;

        ResultSet rset = null;

        String sql = prop.getProperty("selectPayListCount");

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

    public ArrayList<Pay> selectPayList(Connection conn, PageInfo pi) {

        ArrayList<Pay> list = new ArrayList<>();

        PreparedStatement pstmt = null;

        ResultSet rset = null;

        String sql = prop.getProperty("selectPayList");

        try {
            pstmt = conn.prepareStatement(sql);

            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() - 1;

            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);

            rset = pstmt.executeQuery();

            while(rset.next()) {
                list.add( new Pay(
                        rset.getString("PRODUCT_TITLE"),
                        rset.getInt("ORDER_NO"),
                        rset.getDate("FUNDING_DATE"),
                        rset.getString("REFUND_STATUS"),
                        rset.getString("DELIVERY"),
                        rset.getString("USER_ID"),
                        rset.getString("USER_NAME")
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

    public int searchPayListCount(Connection conn, int category, String keyword, String delivery) {

        int listCount = 0;

        PreparedStatement pstmt = null;

        ResultSet rset = null;

        String sql = "";

        if(delivery == "") {
            if(category == 0) {
                sql = prop.getProperty("searchPayListCount0-a");
            } else if (category == 1){
                sql = prop.getProperty("searchPayListCount1-a");
            } else {
                sql = prop.getProperty("searchPayListCount2-a");
            }
        } else {
            if(category == 0) {
                sql = prop.getProperty("searchPayListCount0");
            } else if (category == 1){
                sql = prop.getProperty("searchPayListCount1");
            } else {
                sql = prop.getProperty("searchPayListCount2");
            }
        }

        try {
            pstmt = conn.prepareStatement(sql);

            if(delivery == "") {
                if(category == 2) {
                    pstmt.setInt(1, Integer.parseInt(keyword));
                } else {
                    pstmt.setString(1, "%"+keyword+"%");
                }
            } else {
                if(category == 2) {
                    pstmt.setInt(1, Integer.parseInt(keyword));
                    pstmt.setString(2, delivery);
                } else {
                    pstmt.setString(1, "%"+keyword+"%");
                    pstmt.setString(2, delivery);
                }
            }

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


    public ArrayList<Pay> searchPayList(Connection conn, PageInfo pi, int category, String keyword, String delivery) {

        ArrayList<Pay> list = new ArrayList<>();

        PreparedStatement pstmt = null;

        ResultSet rset = null;

        String sql = "";

        if(delivery == "") {
            if(category == 0) {
                sql = prop.getProperty("searchPayList0-a");
            } else if (category == 1){
                sql = prop.getProperty("searchPayList1-a");
            } else {
                sql = prop.getProperty("searchPayList2-a");
            }
        } else {
            if(category == 0) {
                sql = prop.getProperty("searchPayList0");
            } else if (category == 1){
                sql = prop.getProperty("searchPayList1");
            } else {
                sql = prop.getProperty("searchPayList2");
            }
        }

        try {
            pstmt = conn.prepareStatement(sql);

            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() - 1;

            if(delivery == "") {
                if(category == 2) {
                    pstmt.setInt(1, Integer.parseInt(keyword));
                    pstmt.setInt(2, startRow);
                    pstmt.setInt(3, endRow);
                } else {
                    pstmt.setString(1, "%"+keyword+"%");
                    pstmt.setInt(2, startRow);
                    pstmt.setInt(3, endRow);
                }
            } else {
                if(category == 2) {
                    pstmt.setInt(1, Integer.parseInt(keyword));
                    pstmt.setString(2, delivery);
                    pstmt.setInt(3, startRow);
                    pstmt.setInt(4, endRow);
                } else {
                    pstmt.setString(1, "%"+keyword+"%");
                    pstmt.setString(2, delivery);
                    pstmt.setInt(3, startRow);
                    pstmt.setInt(4, endRow);
                }
            }


            rset = pstmt.executeQuery();

            while(rset.next()) {
                list.add(new Pay(
                        rset.getString("PRODUCT_TITLE"),
                        rset.getInt("ORDER_NO"),
                        rset.getDate("FUNDING_DATE"),
                        rset.getString("REFUND_STATUS"),
                        rset.getString("DELIVERY"),
                        rset.getString("USER_ID"),
                        rset.getString("USER_NAME")
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

    public int selectRefundListCount(Connection conn, String rStatus) {

        int listCount = 0;

        PreparedStatement pstmt = null;

        ResultSet rset = null;

        String sql = prop.getProperty("selectRefundListCount");

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, rStatus);

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


    public ArrayList<Pay> selectRefundList(Connection conn, PageInfo pi, String rStatus) {

        ArrayList<Pay> list = new ArrayList<>();

        PreparedStatement pstmt = null;

        ResultSet rset = null;

        String sql = prop.getProperty("selectRefundList");

        try {
            pstmt = conn.prepareStatement(sql);

            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() - 1;

            pstmt.setString(1, rStatus);
            pstmt.setInt(2, startRow);
            pstmt.setInt(3, endRow);

            rset = pstmt.executeQuery();

            while(rset.next()) {
                list.add(new Pay(
                        rset.getString("PRODUCT_TITLE"),
                        rset.getInt("ORDER_NO"),
                        rset.getDate("FUNDING_DATE"),
                        rset.getString("REFUND_STATUS"),
                        rset.getString("DELIVERY"),
                        rset.getString("USER_ID"),
                        rset.getString("USER_NAME")
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

    public Pay selectPay(Connection conn, int orderNo) {

        Pay pay = null;

        PreparedStatement pstmt = null;

        ResultSet rset = null;

        String sql = prop.getProperty("selectPay");

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, orderNo);

            rset = pstmt.executeQuery();

            if(rset.next()) {
                pay = new Pay(
                    rset.getInt("ORDER_NO"),
                    rset.getInt("USER_NO"),
                    rset.getInt("PRODUCT_NO"),
                    rset.getString("PRODUCT_TITLE"),
                    rset.getInt("COUNT"),
                    rset.getDate("FUNDING_DATE"),
                    rset.getString("FUNDING_YN"),
                    rset.getString("DELIVERY"),
                    rset.getInt("OPTION_NO"),
                    rset.getString("REFUND_STATUS"),
                    rset.getInt("TOTAL_PRICE")
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(rset);
            close(pstmt);
        }

        return pay;
    }

    public Member selectMember(Connection conn, int userNo) {

        Member mem = null;
        PreparedStatement pstmt = null;

        ResultSet rset = null;

        String sql = prop.getProperty("selectMember");

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, userNo);

            rset = pstmt.executeQuery();

            if(rset.next()) {
                mem = new Member(
                        rset.getInt("USER_NO"),
                        rset.getString("USER_ID"),
                        rset.getString("USER_NAME"),
                        rset.getString("USER_NICKNAME"),
                        rset.getString("USER_EMAIL"),
                        rset.getString("USER_ADDRESS"),
                        rset.getString("USER_PHONE"),
                        rset.getDate("ENTER_DATE"),
                        rset.getString("USER_STATUS"),
                        rset.getString("SELLER_YN")
                        
                );
                System.out.println(mem);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(rset);
            close(pstmt);
        }

        return mem;

    }

    public int deletePay(Connection conn, int orderNo) {

        int result = 0;

        PreparedStatement pstmt = null;

        String sql = prop.getProperty("deletePay");

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, orderNo);

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(pstmt);
        }

        return result;
    }

    public Member selectMemberById(Connection conn, String userId) {

        Member mem = null;

        PreparedStatement pstmt = null;

        ResultSet rset = null;

        String sql = prop.getProperty("selectMemberById");

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, userId);

            rset = pstmt.executeQuery();

            if(rset.next()) {
                mem = new Member(
                        rset.getInt("USER_NO"),
                        rset.getString("USER_ID"),
                        rset.getString("USER_NAME"),
                        rset.getString("USER_NICKNAME"),
                        rset.getString("USER_EMAIL"),
                        rset.getString("USER_ADDRESS"),
                        rset.getString("USER_PHONE"),
                        rset.getDate("ENTER_DATE"),
                        rset.getString("USER_STATUS"),
                        rset.getString("SELLER_YN")
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(rset);
            close(pstmt);
        }

        return mem;
	
    }
    
public Image selectProfileImg(Connection conn, String userId) {
		
		
		Image profileImg = null;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectProfileImg");
		
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				profileImg = new Image(
						rset.getString("CHANGE_NAME"),
						rset.getString("FILE_PATH")
						);
						
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return profileImg;
		
	}
	
	
	public ArrayList<Image> selectProfileProductImg(Connection conn, String userId){
		
		ArrayList<Image> pList = new ArrayList();
		Image img = null;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectProfileProductImg");
		
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				
				img = new Image(
						rset.getString("CHANGE_NAME"),
						rset.getString("FILE_PATH")
						);
				
				pList.add(img);
						
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return pList;
		
		
	}
	
	public ArrayList<Pay> selectProfileProductText(Connection conn, String userId){
		
		ArrayList<Pay> pTextList = new ArrayList();
		
		
		
			Pay pay = null;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectProfileProductText");
		
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				
				pay = new Pay(
						rset.getInt("ORDER_NO"),
						rset.getInt("PRODUCT_NO"),
						rset.getString("PRODUCT_TITLE"),
						rset.getString("OPTION_NAME"),
						rset.getInt("TOTAL_PRICE"),
						rset.getDate("FUNDING_DATE"),
						rset.getString("FUNDING_YN"),
						rset.getString("SELLER_NICKNAME"),
						rset.getString("DELIVERY"),
						rset.getString("REFUND_STATUS"),
						rset.getDate("END_DATE")
						);
				
				
				pTextList.add(pay);
						
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return pTextList;
		
	}
	
	
	public ArrayList<Image> selectWishImg(Connection conn , int userNo){
		
			
		ArrayList<Image> wishImg = new ArrayList();
		Image img = null;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectWishImg");
		
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				
				img = new Image(
						rset.getString("ORIGIN_NAME"),
						rset.getString("FILE_PATH")
						);
				
				wishImg.add(img);
						
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return wishImg;
		
	}
	
	
	
	public ArrayList<Product> selectWishp(Connection conn, int userNo){
		
		ArrayList<Product> wishP = new ArrayList();
		
		Product p = null;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectWishp");
		
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				
				p = new Product(
							rset.getString("PRODUCT_TITLE"),
							rset.getString("SELLER_NICKNAME"),
							rset.getInt("PRODUCT_NO")
						);
						
					wishP.add(p);	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return wishP;
	}
	
	
	public int refundProduct(Connection conn, String orderNo,String refundRequest) {
		
		String hidden = refundRequest.equals("request") ? "refundRequest" :  "refundProduct"; 
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty(hidden);
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, orderNo);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		   if(result > 0) {
		         int result2 =new MemberService().myPageUpdateCount(orderNo);
		      }
		return result;
		
	}
	
	
	public int myPageUpdateCount(Connection conn, String orderNo) {
        
        
        int result = 0;
        
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("myPageUpdateCount");
        
        
        try {
           pstmt = conn.prepareStatement(sql);
           
           pstmt.setString(1, orderNo);
           
           
           result = pstmt.executeUpdate();
           
        } catch (SQLException e) {
           e.printStackTrace();
        }finally {
           close(pstmt);
        }
        
        return result;
     }

	
	
	
	public int infoCheckPwd(Connection conn, String pwd, String id) {
		
		int result = 0;
		 
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("infoCheckPwd");
		
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pwd);
			pstmt.setString(2, id);
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = 1;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	
	public int updateMember(Connection conn, String userId,String nick, String email, String changePwd , String interest) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		
		String sql = prop.getProperty("updateMember");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, nick);
			pstmt.setString(2, email);
			pstmt.setString(3, changePwd);
			pstmt.setString(4, interest);
			pstmt.setString(5, userId);
			
			
			result = pstmt.executeUpdate();
			
			 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public Member selectMember(Connection conn, String userId) {
		
		
		Member m = null;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectMember1");
		
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(
						rset.getInt("USER_NO"),
						rset.getString("USER_ID"),
						rset.getString("USER_PWD"),
						rset.getString("USER_NAME"),
						rset.getString("USER_NICKNAME"),
						rset.getString("USER_SSG"),
						rset.getString("USER_EMAIL"),
						rset.getString("USER_ADDRESS"),
						rset.getString("USER_PHONE"),
						rset.getDate("ENTER_DATE"),
						rset.getString("USER_INTEREST"),
						rset.getString("USER_STATUS")
						);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
		
	}
	
	
	
	public int updateImg(Connection conn, Image img,String hiddenSql) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		
		String sql = prop.getProperty(hiddenSql);
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, img.getOriginName());
			pstmt.setString(2, img.getChangeName());
			pstmt.setString(3, img.getFilePath());
			pstmt.setInt(4, img.getUserNo());
			
			result = pstmt.executeUpdate();
			
			 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	
	public int deleteImg(Connection conn, int userNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		
		String sql = prop.getProperty("deleteImg");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	
	public int updateWish(Connection conn, int userNo,int productNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		
		String sql = prop.getProperty("updateWish");
		
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, productNo);
			
			result = pstmt.executeUpdate();
			 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public ArrayList<Qa> selectQaList(Connection conn, int userNo){
		
		ArrayList<Qa> qaList = new ArrayList();
		
		Qa q = null;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectQaList");
		
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				
				q = new Qa(
						rset.getInt("QA_NO"),
						rset.getInt("USER_NO"),
						rset.getString("QA_TITLE"),
						rset.getString("QA_CONTENT"),
						rset.getDate("CREATE_DATE"),
						rset.getString("QA_STATUS")
						);
						
					qaList.add(q);	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return qaList;
	}
	
	
	
	public ArrayList<Image> selectSearchP(Connection conn,int userNo, String startDate, String endDate){
		
		ArrayList<Image> selectSearchP = new ArrayList();
		Image img = null;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectSearchP");
		
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				
				img = new Image(
						rset.getString("CHANGE_NAME"),
						rset.getString("FILE_PATH")
						);
				
				selectSearchP.add(img);
						
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return selectSearchP;
		
		
	}
	
		public ArrayList<Pay> searchTextList(Connection conn, int userNo, String startDate,String endDate){
		
		ArrayList<Pay> searchTextList = new ArrayList();
		
		
		
			Pay pay = null;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("searchTextList");
		
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				
				pay = new Pay(
						rset.getInt("ORDER_NO"),
						rset.getInt("PRODUCT_NO"),
						rset.getString("PRODUCT_TITLE"),
						rset.getString("OPTION_NAME"),
						rset.getInt("TOTAL_PRICE"),
						rset.getDate("FUNDING_DATE"),
						rset.getString("FUNDING_YN"),
						rset.getString("SELLER_NICKNAME"),
						rset.getString("DELIVERY"),
						rset.getString("REFUND_STATUS"),
						rset.getDate("END_DATE")
						);
				
				
				searchTextList.add(pay);
						
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return searchTextList;
		
	}
		
		
		
public int myPageInsertSeller(Connection conn, int userno) {
			
			int result = 0;
			
			PreparedStatement pstmt = null;
			
			
			String sql = prop.getProperty("myPageInsertSeller");
			
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, userno);
				
				
				result = pstmt.executeUpdate();
				
				 
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			
			return result;
			
		}


	public int jhDeleteMember(Connection conn,int userNo) {
	
	int result = 0;
	
	PreparedStatement pstmt = null;
	
	String sql = prop.getProperty("jhDeleteMember");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, userNo);
		
		result = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	return result;
}
	
}
