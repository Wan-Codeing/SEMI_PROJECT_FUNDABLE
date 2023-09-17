package com.fun.product.model.dao;
import static com.fun.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.fun.common.model.vo.PageInfo;
import com.fun.member.model.vo.Member;
import com.fun.member.model.vo.Pay;
import com.fun.member.model.vo.Seller;
import com.fun.member.model.vo.Wishlist;
import com.fun.product.model.vo.Category;
import com.fun.product.model.vo.Image;
import com.fun.product.model.vo.Option;
import com.fun.product.model.vo.Product;

public class ProductDao {

    private Properties prop = new Properties();

    public ProductDao() {
        try {
            prop.loadFromXML(new FileInputStream(ProductDao.class.getResource("/sql/product/product-mapper.xml").getPath()));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public int selectFListCount(Connection conn) {

        int listCount = 0;

        PreparedStatement pstmt = null;

        ResultSet rset = null;

        String sql = prop.getProperty("selectFListCount");

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

    public ArrayList<Product> selectFList(Connection conn, PageInfo pi) {

        ArrayList<Product> list = new ArrayList<>();

        PreparedStatement pstmt = null;

        ResultSet rset = null;

        String sql = prop.getProperty("selectFList");

        try {
            pstmt = conn.prepareStatement(sql);

            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() - 1;

            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);

            rset = pstmt.executeQuery();

            while(rset.next()) {
                list.add(new Product(
                        rset.getInt("PRODUCT_NO"),
                        rset.getInt("CATEGORY_NO"),
                        rset.getString("DESCRIPTION"),
                        rset.getString("PRODUCT_TITLE"),
                        rset.getInt("PRICE"),
                        rset.getInt("COUNT"),
                        rset.getInt("FUND_PRICE"),
                        rset.getDate("ENROLL_DATE"),
                        rset.getDate("OPEN_DATE"),
                        rset.getDate("END_DATE"),
                        rset.getString("SELLER_NICKNAME"),
                        rset.getString("FUNDING_YN")
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

    public int denyFunding(Connection conn, int productNo) {

        int result = 0;

        PreparedStatement pstmt = null;

        String sql = prop.getProperty("denyFunding");

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, productNo);

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(pstmt);
        }

        return result;
    }

    public int accessFunding(Connection conn, int productNo) {

        int result = 0;

        PreparedStatement pstmt = null;

        String sql = prop.getProperty("accessFunding");

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, productNo);

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(pstmt);
        }

        return result;
    }

    public int selectPListCount(Connection conn) {

        int listCount = 0;

        PreparedStatement pstmt = null;

        ResultSet rset = null;

        String sql = prop.getProperty("selectPListCount");

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

    public ArrayList<Product> selectPList(Connection conn, PageInfo pi) {

        ArrayList<Product> list = new ArrayList<>();

        PreparedStatement pstmt = null;

        ResultSet rset = null;

        String sql = prop.getProperty("selectPList");

        try {
            pstmt = conn.prepareStatement(sql);

            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() - 1;

            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);

            rset = pstmt.executeQuery();

            while(rset.next()) {
                list.add(new Product(
                        rset.getInt("PRODUCT_NO"),
                        rset.getInt("CATEGORY_NO"),
                        rset.getString("DESCRIPTION"),
                        rset.getString("PRODUCT_TITLE"),
                        rset.getInt("PRICE"),
                        rset.getInt("COUNT"),
                        rset.getInt("FUND_PRICE"),
                        rset.getDate("ENROLL_DATE"),
                        rset.getDate("OPEN_DATE"),
                        rset.getDate("END_DATE"),
                        rset.getString("SELLER_NICKNAME"),
                        rset.getString("FUNDING_YN")
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

    public int searchPListCount(Connection conn, int category, String keyword) {

        int listCount = 0;

        PreparedStatement pstmt = null;

        ResultSet rset = null;

        String sql = "";

        if(category == 0) {
            sql = prop.getProperty("searchPListCount0");
        } else {
            sql = prop.getProperty("searchPListCount1");
        }

        try {
            pstmt = conn.prepareStatement(sql);

            if(category == 0) {
                pstmt.setString(1, "%"+keyword+"%");
            } else {
                pstmt.setString(1, "%"+keyword+"%");
                pstmt.setInt(2, category);
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

    public ArrayList<Product> searchPList(Connection conn, PageInfo pi, int category, String keyword) {

        ArrayList<Product> list = new ArrayList<>();

        PreparedStatement pstmt = null;

        ResultSet rset = null;


        String sql = "";

        if(category == 0) {
            sql = prop.getProperty("searchPList0");
        } else {
            sql = prop.getProperty("searchPList1");
        }

        try {
            pstmt = conn.prepareStatement(sql);

            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() - 1;

            if(category == 0) {
                pstmt.setString(1, "%"+keyword+"%");
                pstmt.setInt(2, startRow);
                pstmt.setInt(3, endRow);
            } else {
                pstmt.setString(1, "%"+keyword+"%");
                pstmt.setInt(2, category);
                pstmt.setInt(3, startRow);
                pstmt.setInt(4, endRow);
            }

            rset = pstmt.executeQuery();

            while(rset.next()) {
                list.add(new Product(
                        rset.getInt("PRODUCT_NO"),
                        rset.getInt("CATEGORY_NO"),
                        rset.getString("DESCRIPTION"),
                        rset.getString("PRODUCT_TITLE"),
                        rset.getInt("PRICE"),
                        rset.getInt("COUNT"),
                        rset.getInt("FUND_PRICE"),
                        rset.getDate("ENROLL_DATE"),
                        rset.getDate("OPEN_DATE"),
                        rset.getDate("END_DATE"),
                        rset.getString("SELLER_NICKNAME"),
                        rset.getString("FUNDING_YN")
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

    public Product selectProduct(Connection conn, int productNo) {

        Product p = null;

        PreparedStatement pstmt = null;

        ResultSet rset = null;

        String sql = prop.getProperty("selectProduct");

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, productNo);

            rset = pstmt.executeQuery();

            if(rset.next()) {
                p = new Product(
                        rset.getInt("PRODUCT_NO"),
                        rset.getInt("CATEGORY_NO"),
                        rset.getString("DESCRIPTION"),
                        rset.getString("PRODUCT_TITLE"),
                        rset.getInt("PRICE"),
                        rset.getInt("COUNT"),
                        rset.getInt("FUND_PRICE"),
                        rset.getDate("ENROLL_DATE"),
                        rset.getDate("OPEN_DATE"),
                        rset.getDate("END_DATE"),
                        rset.getString("SELLER_NICKNAME"),
                        rset.getString("FUNDING_YN")
                );
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close(rset);
            close(pstmt);
        }

        return p;

    }

    public Option selectOption(Connection conn, int optionNo) {

        Option option = null;

        PreparedStatement pstmt = null;

        ResultSet rset = null;

        String sql = prop.getProperty("selectOption");

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, optionNo);

            rset = pstmt.executeQuery();

            if(rset.next()) {
                option = new Option(
                        rset.getString("OPTION_NAME"),
                        rset.getInt("OPTION_PRICE")
	                );
	            }
	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        } finally {
	            close(rset);
	            close(pstmt);
	        }

	        return option;
	    }
    
    public ArrayList<Image> selectProductImg(Connection conn){
		ArrayList<Image> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		try {
			String sql = prop.getProperty("selectProductImg");
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Image(
						  rset.getInt("PRODUCT_NO"),
						  rset.getString("FILE_PATH"),
						  rset.getString("PRODUCT_TITLE"),
						  rset.getInt("PRICE"),
						  rset.getInt("COUNT"),
						  rset.getInt("FUND_PRICE"),
						  rset.getString("CHANGE_NAME")
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
    	// 준호형 파트
    
    public int insertThumbnailBoard(Connection conn, Product p, String oDate, String eDate) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertThumbnailBoard");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p.getCategoryNo());
			pstmt.setString(2, p.getDescription());
			pstmt.setString(3, p.getpTitle());
			pstmt.setInt(4, p.getPrice());
			pstmt.setInt(5, p.getCount());
			pstmt.setInt(6, p.getFundPrice());
			pstmt.setString(7, oDate);
			pstmt.setString(8, eDate);
			pstmt.setString(9, p.getSellerNickName());
			pstmt.setString(10, p.getTag());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertAttachmentList(Connection conn, ArrayList<Image> list, Member m) {
		int result = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachmentList");

		try {

			for (Image at : list) {
				// 반복문이 돌때마다 미 완성된 sql문을 담은 pstmt 객체 생성
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, m.getUserNo());
				pstmt.setString(2, at.getOriginName());
				pstmt.setString(3, at.getChangeName());
				pstmt.setInt(4, at.getFileLevel());
				pstmt.setString(5, at.getFilePath());

				result *= pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Pay> selectDeliveryList1(Connection conn,String sellerNick) {
		// SELECT문 => 여러행 => ResultSet => ArrayList
		ArrayList<Pay> list1 = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectDeliveryList1");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sellerNick);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Pay p = new Pay(rset.getInt("PRODUCT_NO"),rset.getString("PRODUCT_TITLE") ,rset.getInt("TOTAL_PRICE"), rset.getDate("FUNDING_DATE"),
						rset.getString("REFUND_STATUS"), rset.getString("USER_NAME"), rset.getString("USER_ADDRESS"),
						rset.getString("DELIVERY"));
				list1.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list1;
	}

	public ArrayList<Pay> selectDeliveryList2(Connection conn,String sellerNick) {
		// SELECT문 => 여러행 => ResultSet => ArrayList
		ArrayList<Pay> list2 = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectDeliveryList2");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sellerNick);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Pay p = new Pay(rset.getInt("PRODUCT_NO"),rset.getString("PRODUCT_TITLE"), rset.getInt("TOTAL_PRICE"), rset.getDate("FUNDING_DATE"),
						rset.getString("REFUND_STATUS"), rset.getString("USER_NAME"), rset.getString("USER_ADDRESS"),
						rset.getString("DELIVERY"));
				list2.add(p);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list2;
	}

	public ArrayList<Pay> selectDeliveryList3(Connection conn,String sellerNick) {
		// SELECT문 => 여러행 => ResultSet => ArrayList
		ArrayList<Pay> list3 = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectDeliveryList3");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, sellerNick);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Pay p = new Pay(rset.getInt("PRODUCT_NO"),rset.getString("PRODUCT_TITLE"), rset.getInt("TOTAL_PRICE"), rset.getDate("FUNDING_DATE"),
						rset.getString("REFUND_STATUS"), rset.getString("USER_NAME"), rset.getString("USER_ADDRESS"),
						rset.getString("DELIVERY"));
				list3.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list3;
	}

	public int insertReward(Connection conn, String optionName, int optionPrice, String description, int rewardpNo) {

		int result = 0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		String sql = prop.getProperty("insertReward");
		String sql2 = prop.getProperty("checkReward");
		try {
			
			pstmt= conn.prepareStatement(sql2);
			pstmt.setInt(1, rewardpNo);
			
			result=pstmt.executeUpdate();
			if(result>0) {
				result=4;
			}else {
				pstmt2 = conn.prepareStatement(sql);
				
				pstmt2.setInt(1, rewardpNo);
				pstmt2.setString(2, optionName);
				pstmt2.setInt(3, optionPrice);
				pstmt2.setString(4, description);
				
				result = pstmt2.executeUpdate();
			}			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt2);
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Product> searchAccount(Connection conn, int userNo) {
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchAccount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();
			while (rset.next()) {
				Product p = new Product(
						rset.getString("PRODUCT_TITLE"),
						rset.getInt("PRICE"),
						rset.getInt("COUNT"),
						rset.getDate("END_DATE"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public Product selectFund(Connection conn, int productNo) {
		
		Product p = new Product();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFund");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product(rset.getInt("PRODUCT_NO"),
								rset.getInt("CATEGORY_NO"),
								rset.getString("PRODUCT_TITLE"),
								rset.getInt("PRICE"),
								rset.getInt("COUNT"),
								rset.getInt("FUND_PRICE"),
								rset.getDate("END_DATE"),
								rset.getDate("SYSDATE"));
			};
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}

	public ArrayList<Image> selectProImg(Connection conn, int userNo) {
		ArrayList<Image> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProImg");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
	
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Image i = new Image(
						rset.getInt("PRODUCT_NO"),
						rset.getString("CHANGE_NAME"),
						rset.getString("FILE_PATH")
						);
				list.add(i);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}

	public Image selectProfile(Connection conn, int userNo) {
		Image i = new Image();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProfile");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				i = new Image(
						rset.getInt("PRODUCT_NO"),
						rset.getString("CHANGE_NAME"),
						rset.getString("FILE_PATH")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return i;
	}
	
	// 정준파트
	   // 정준파트
	   public ArrayList<Image> inputImg(Connection conn){
	         
	         ArrayList<Image> list = new ArrayList<Image>();
	         
	         
	         
	         PreparedStatement pstmt = null;
	         
	         ResultSet rset = null;
	         
	         String sql = prop.getProperty("inputImgchoi");
	         try {
	            pstmt = conn.prepareStatement(sql);
	            
	         
	            
	            rset = pstmt.executeQuery();
	            
	            
	            
	            while (rset.next()) {
	               
	                   list.add(new Image(
	                         
	                         rset.getInt("PRODUCT_NO"),
	                         rset.getInt("CATEGORY_NO"),
	                         rset.getString("CHANGE_NAME"),
	                         rset.getString("FILE_PATH"),
	                         rset.getString("FUNDING_YN"),
	                         rset.getString("PRODUCT_TITLE")
	                         
	                         ));
	                   
	                   
	               }
	            
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }finally {
	            close(rset);
	            close(pstmt);
	         }
	         
	         
	         
	         return list;
	      }

	   
	   public ArrayList<Image> inputSlideImg(Connection conn){
	      
	      ArrayList<Image> sList = new ArrayList<Image>();
	      
	      
	      
	      PreparedStatement pstmt = null;
	      
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("inputSlideImg");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         rset = pstmt.executeQuery();
	         
	         while (rset.next()) {
	               
	                sList.add(new Image(
	                      rset.getString("CHANGE_NAME"),
	                      rset.getString("FILE_PATH")
	                      ));
	                
	            }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      return sList;
	      
	      
	   }

	   // 오픈예정
	public ArrayList<Image> inputOpenSlideImg(Connection conn){
	      
	      ArrayList<Image> osList = new ArrayList<Image>();
	      
	      
	      
	      PreparedStatement pstmt = null;
	      
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("inputOpenSlideImg");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         rset = pstmt.executeQuery();
	         
	         while (rset.next()) {
	               
	                osList.add(new Image(
	                      rset.getString("CHANGE_NAME"),
	                      rset.getString("FILE_PATH")
	                      ));
	                
	            }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      return osList;
	      
	      
	   }

	   public ArrayList<Image> inputOpenViewSlideImg(Connection conn){
	   
	   ArrayList<Image> ovsList = new ArrayList<Image>();
	   
	   
	   
	   PreparedStatement pstmt = null;
	   
	   ResultSet rset = null;
	   
	   String sql = prop.getProperty("inputOpenViewSlideImg");
	   
	   try {
	      pstmt = conn.prepareStatement(sql);
	      
	      rset = pstmt.executeQuery();
	      
	      while (rset.next()) {
	            
	            ovsList.add(new Image(
	                  rset.getString("CHANGE_NAME"),
	                  rset.getString("FILE_PATH"),
	                  rset.getString("PRODUCT_TITLE")
	                  ));
	            
	            
	        }
	   } catch (SQLException e) {
	      e.printStackTrace();
	   }finally {
	      close(rset);
	      close(pstmt);
	   }
	   return ovsList;
	}
	   
	   
	   // 펀딩 스토리
	   
	   public Image fundingStoryImage(Connection conn,int productNo){
	      
	      Image i = null;
	      
	      
	      
	      PreparedStatement pstmt = null;
	      
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("fundingStoryImage");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setInt(1, productNo);
	         
	         rset = pstmt.executeQuery();
	         
	         while (rset.next()) {
	               
	               i = new Image(
	                     rset.getString("CHANGE_NAME"),
	                     rset.getString("FILE_PATH")
	                     );
	               
	           }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      return i;
	      
	      
	   }
	   
	   public Product fundingStoryProduct(Connection conn,int productNo){
	      
	      Product p = null;
	      
	      
	      
	      PreparedStatement pstmt = null;
	      
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("fundingStoryProduct");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setInt(1, productNo);
	         
	         rset = pstmt.executeQuery();
	         
	         while (rset.next()) {
	               
	               p= new Product(
	                     rset.getString("DESCRIPTION"),
	                     rset.getString("PRODUCT_TITLE"),
	                     rset.getInt("PRICE"),
	                     rset.getInt("COUNT"),
	                     rset.getInt("FUND_PRICE"),
	                     rset.getInt("DATE"),
	                     rset.getString("SELLER_NICKNAME"),
	                     rset.getInt("TOTAL"),
	                     rset.getString("FUNDING_YN")
	                     );
	               
	               
	           }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      return p;
	      
	      
	   }
	   
	   public ArrayList<Option> fundingStoryOption(Connection conn,int productNo){
	      
	      ArrayList<Option> po = new ArrayList();
	      
	      Option p = null;
	      
	      
	      PreparedStatement pstmt = null;
	      
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("fundingStoryOption");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setInt(1, productNo);
	         
	         rset = pstmt.executeQuery();
	         
	         while (rset.next()) {
	               
	               p= new Option(
	                     rset.getInt("OPTION_NO"),
	                     rset.getString("OPTION_NAME"),
	                     rset.getInt("OPTION_PRICE"),
	                     rset.getString("OPTION_DESCRIPTION")
	                     );
	               po.add(p);
	               
	               
	           }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      return po;
	      
	      
	   }
	   
	   public Seller fundingStorySeller(Connection conn,int productNo){
	      
	      Seller s = null;
	      
	      
	      
	      PreparedStatement pstmt = null;
	      
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("fundingStorySeller");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setInt(1, productNo);
	         
	         rset = pstmt.executeQuery();
	         
	         while (rset.next()) {
	               
	               s=new Seller(
	                     rset.getString("SELLER_NICKNAME"),
	                     rset.getString("PROFILE_IMG")
	                     );
	               
	               
	           }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      return s;
	      
	      
	   }
	   
	   public Category fundingStoryCategory(Connection conn,int productNo){
	      
	      Category c = null;
	      
	      
	      
	      PreparedStatement pstmt = null;
	      
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("fundingStoryCategory");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setInt(1, productNo);
	         
	         rset = pstmt.executeQuery();
	         
	         if (rset.next()) {
	               
	               c= new Category(
	                     rset.getInt("CATEGORY_NO"),
	                     rset.getString("CATEGORY_NAME")
	                     );
	         
	               
	               
	           }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      return c;
	      
	      
	   }
	   
	public Wishlist fundingStoryWishlist(Connection conn,int productNo, int userNo){
	      
	      Wishlist wl = null;
	      
	      
	      
	      PreparedStatement pstmt = null;
	      
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("fundingStoryWishlist");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         
	        
	         pstmt.setInt(1, userNo);
	         pstmt.setInt(2, productNo);
	         rset = pstmt.executeQuery();
	         
	         if (rset.next()) {
	               
	            wl= new Wishlist(
	                  rset.getString("WISH_STATUS")
	                  );

	               
	           }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      return wl;
	      
	      
	   }
	   
	   public int payResult(Connection conn,Pay p){
	      
	       int result = 0;
	      
	      PreparedStatement pstmt = null;
	      
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("payResult");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setInt(1, p.getUserNo());
	         pstmt.setInt(2, p.getProductNo());
	         pstmt.setString(3, p.getProductTitle());
	         pstmt.setInt(4, p.getOptionNo());
	         pstmt.setInt(5, p.getTotalPrice());
	         pstmt.setString(6, p.getSellerNickName());
	         

	         
	         rset = pstmt.executeQuery();
	         
	         if (rset.next()) {
	               
	               result = 1;
	                     
	           }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      return result;
	      
	      
	   }
	   
	   
	public int PlusWishList(Connection conn,int productNo, int userNo){
	      
	       int result  = 0;
	      
	      PreparedStatement pstmt = null;
	      
	      
	      String sql = prop.getProperty("updateWishList");
	      
	      
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
	      
	public int insertWishList(Connection conn,int productNo, int userNo){
	   
	    int result  = 0;
	   
	   PreparedStatement pstmt = null;
	   
	   ResultSet rset = null;
	   

	   String sql = prop.getProperty("insertWishList");
	   
	   try {
	      pstmt = conn.prepareStatement(sql);
	      
	      pstmt.setInt(1, userNo);
	      pstmt.setInt(2, productNo);
	      

	      
	      rset = pstmt.executeQuery();
	      
	      if (rset.next()) {
	           
	      result = 1;
	           
	           
	       }
	         
	   } catch (SQLException e) {
	      e.printStackTrace();
	   }finally {
	      close(rset);
	      close(pstmt);
	   }
	   return result;
	   
	   
	}

	public Image fundingStoryInputImage(Connection conn, int productNo){
	    
	    Image ii = null;
	    
	    PreparedStatement pstmt = null;
	    
	    ResultSet rset = null;
	    
	    String sql = prop.getProperty("fundingStoryInputImage");
	    
	    try {
	       pstmt = conn.prepareStatement(sql);
	       
	       pstmt.setInt(1, productNo);
	       
	       rset = pstmt.executeQuery();
	       
	       while (rset.next()) {
	             
	             ii = new Image(
	                   rset.getString("CHANGE_NAME"),
	                   rset.getString("FILE_PATH")
	                   );
	            
	             
	         }
	    } catch (SQLException e) {
	       e.printStackTrace();
	    }finally {
	       close(rset);
	       close(pstmt);
	    }
	    return ii;
	    
	    
	 }

	public int payCountPlus(Connection conn, Pay p){
	    
	    int result = 0;
	   
	   PreparedStatement pstmt = null;
	   
	   ResultSet rset = null;
	   
	   String sql = prop.getProperty("payCountPlus");
	   
	   
	   try {
	      pstmt = conn.prepareStatement(sql);
	      
	      pstmt.setInt(1, p.getProductNo());
	      
	      rset = pstmt.executeQuery();
	      
	      if (rset.next()) {
	            
	            result = 1;
	            
	   

	        }
	   } catch (SQLException e) {
	      e.printStackTrace();
	   }finally {
	      close(rset);
	      close(pstmt);
	   }
	   return result;
	   
	   
	}

	public ArrayList<Image> inputOpenImg(Connection conn){
	    
	    ArrayList<Image> list = new ArrayList<Image>();
	    
	    
	    
	    PreparedStatement pstmt = null;
	    
	    ResultSet rset = null;
	    
	    String sql = prop.getProperty("inputOpenImgchoi");
	    try {
	       pstmt = conn.prepareStatement(sql);
	       
	    
	       
	       rset = pstmt.executeQuery();
	       
	       
	       
	       while (rset.next()) {
	          
	              list.add(new Image(
	                    rset.getInt("CATEGORY_NO"),
	                    rset.getInt("PRODUCT_NO"),
	                    rset.getString("CHANGE_NAME"),
	                    rset.getString("FILE_PATH"),
	                    rset.getString("PRODUCT_TITLE")
	                    
	                    ));
	              
	              
	          }
	       
	    } catch (SQLException e) {
	       // TODO Auto-generated catch block
	       e.printStackTrace();
	    }finally {
	       close(rset);
	       close(pstmt);
	    }
	    
	    
	    
	    return list;
	 }

	public int deleteProduct(Connection conn, int productNo) {
		 int result = 0;

	        PreparedStatement pstmt = null;
	        
	        String sql = prop.getProperty("deleteProduct");

	        try {
	            pstmt = conn.prepareStatement(sql);

	            pstmt.setInt(1, productNo);

	            result = pstmt.executeUpdate();
	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        } finally {
	            close(pstmt);
	        }

	        return result;
	}

	public int selectProductNo(Connection conn) {
			ArrayList<Integer> list = new ArrayList(); 
			int productNo = 0;

	        PreparedStatement pstmt = null;
	        ResultSet rset = null;
	        String sql = prop.getProperty("selectProductNo");
	       
	        try {
	        	
	            pstmt = conn.prepareStatement(sql);
	            
	            rset = pstmt.executeQuery();
	            while(rset.next()) {
	            	
	            	list.add(rset.getInt("PRODUCT_NO"));
	            }
	            
	            productNo = list.get(0);
	            System.out.println(productNo);
	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        } finally {
	        	close(rset);
	            close(pstmt);
	        }

	        return productNo;	}
}
