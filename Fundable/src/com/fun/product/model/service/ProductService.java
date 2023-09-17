package com.fun.product.model.service;

import static com.fun.common.JDBCTemplate.close;
import static com.fun.common.JDBCTemplate.commit;
import static com.fun.common.JDBCTemplate.getConnection;
import static com.fun.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.fun.member.model.vo.Member;
import com.fun.member.model.vo.Pay;
import com.fun.member.model.vo.Seller;
import com.fun.member.model.vo.Wishlist;
import com.fun.product.model.dao.ProductDao;
import com.fun.product.model.vo.Category;
import com.fun.product.model.vo.Image;
import com.fun.product.model.vo.Option;
import com.fun.product.model.vo.Product;

public class ProductService {
	
	public int insertThumbnailBoard(Product p, ArrayList<Image> list, String oDate, String eDate, Member m) {
		Connection conn = getConnection();

		int result1 = new ProductDao().insertThumbnailBoard(conn, p, oDate, eDate);

		int result2 = new ProductDao().insertAttachmentList(conn, list, m);

		try {
			conn.setAutoCommit(false);
			if (result1 > 0 && result2 > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		close(conn);

		return result1 * result2;
	}

	public ArrayList<Pay> selectDeliveryList1(String sellerNick) {
		Connection conn = getConnection();

		ArrayList<Pay> list1 = new ProductDao().selectDeliveryList1(conn,sellerNick);

		close(conn);

		return list1;
	}

	public ArrayList<Pay> selectDeliveryList2(String sellerNick) {
		Connection conn = getConnection();

		ArrayList<Pay> list2 = new ProductDao().selectDeliveryList2(conn,sellerNick);

		close(conn);

		return list2;
	}

	public ArrayList<Pay> selectDeliveryList3(String sellerNick) {
		Connection conn = getConnection();

		ArrayList<Pay> list3 = new ProductDao().selectDeliveryList3(conn,sellerNick);

		close(conn);

		return list3;
	}

	public int insertReward(String optionName, int optionPrice, String description, int rewardpNo) {
		Connection conn = getConnection();

		int result = new ProductDao().insertReward(conn, optionName, optionPrice, description, rewardpNo);
		try {
			conn.setAutoCommit(false);
			if (result > 0) {
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

	public ArrayList<Product> searchAccount(int userNo) {
		Connection conn = getConnection();

		ArrayList<Product> list = new ProductDao().searchAccount(conn, userNo);
		
		close(conn);
		return list;
	}
	
	public Product selectFund(int productNo) {
		Connection conn = getConnection();
		
		Product p = new ProductDao().selectFund(conn, productNo);
		
		close(conn);
		
		return p;
	}

	public ArrayList<Image> selectProImg(int userNo) {
		Connection conn = getConnection();
		
		ArrayList<Image> list = new ProductDao().selectProImg(conn, userNo);

		close(conn);

		return list;

	}

	public Image selectProfile(int userNo) {
		Connection conn = getConnection();
		
		Image i = new ProductDao().selectProfile(conn, userNo);

		close(conn);

		return  i;
	}

	// 정준 파트
	// 정준 파트
	 public ArrayList<Image> inputImg() {
	       
	       Connection conn = getConnection();
	       
	       ArrayList<Image> list = new ProductDao().inputImg(conn);
	       
	       close(conn);
	       
	      
	       
	       return list;
	       
	    }
	   
	    public ArrayList<Image> inputSlideImg(){
	       
	       Connection conn = getConnection();
	       
	       ArrayList<Image> sList = new ProductDao().inputSlideImg(conn);
	       
	       close(conn);
	       
	      
	       
	       return sList;
	       
	    }
	   
	    public ArrayList<Image> inputOpenSlideImg(){
	       
	       Connection conn = getConnection();
	       
	       ArrayList<Image> osList = new ProductDao().inputOpenSlideImg(conn);
	       
	       close(conn);
	       
	      
	       
	       return osList;
	       
	    }
	 
	    public ArrayList<Image> inputOpenViewSlideImg(){
	    
	    Connection conn = getConnection();
	    
	    ArrayList<Image> ovsList = new ProductDao().inputOpenViewSlideImg(conn);
	    
	    close(conn);
	    
	   
	    
	    return ovsList;
	    
	 }
	    
	    
	    // 펀딩 스토리
	    
	    public Image fundingStoryImage(int productNo){
	      
	      Connection conn = getConnection();
	      
	      Image i = new ProductDao().fundingStoryImage(conn,productNo);
	       
	       close(conn);
	       
	       return i;
	      
	   }
	    
	    
	    public Product fundingStoryProduct(int productNo){
	       
	       Connection conn = getConnection();
	       
	       Product p = new ProductDao().fundingStoryProduct(conn,productNo);
	        
	        close(conn);
	        
	        return p;
	       
	    }
	   
	    public ArrayList<Option> fundingStoryOption(int productNo){
	       
	       Connection conn = getConnection();
	       
	       ArrayList<Option> po = new ProductDao().fundingStoryOption(conn,productNo);
	        
	        close(conn);
	        
	        return po;
	       
	    }
	   
	    public Seller fundingStorySeller(int productNo){
	       
	      Connection conn = getConnection();
	      
	      Seller s = new ProductDao().fundingStorySeller(conn,productNo);
	       
	       close(conn);
	       
	       return s;
	      
	   }

	    public Category fundingStoryCategory(int productNo){
	      
	      Connection conn = getConnection();
	      
	      Category c = new ProductDao().fundingStoryCategory(conn,productNo);
	       
	       close(conn);
	       
	       return c;
	      
	   }
	    
	public  Wishlist fundingStoryWishlist(int productNo, int userNo){
	      
	      Connection conn = getConnection();
	      
	       Wishlist wl = new ProductDao().fundingStoryWishlist(conn,productNo,userNo);
	       
	       close(conn);
	       
	       return wl;
	      
	   }
	    
	    
	    

	   public int payResult(Pay p) {
	       Connection conn = getConnection();
	       
	       int result = new ProductDao().payResult(conn,p);
	       
	     
	       
	       try {
	         conn.setAutoCommit(false);
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	       
	       if (result>0) {
	         result = new ProductDao().payCountPlus(conn,p);
	         
	         commit(conn);
	         
	      }else {
	         rollback(conn);
	      }
	       
	       close(conn);
	       
	       return result;
	   }
	    

	    public int iPlusWishList(int productNo , int userNo) {
	       
	       Connection conn = getConnection();
	       
	       int result = new ProductDao().PlusWishList(conn,productNo, userNo);
	       
	       try {
			conn.setAutoCommit(false);
			if(result<1) {
				result = new ProductDao().insertWishList(conn, productNo, userNo);
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
	    
	    public Image fundingStoryInputImage(int productNo) {
	        
	        Connection conn = getConnection();
	       
	       Image ii = new ProductDao().fundingStoryInputImage(conn,productNo);
	        
	        close(conn);
	        
	        return ii;
	        
	     }
	    
	 public ArrayList<Image> inputOpenImg() {
	       
	       Connection conn = getConnection();
	       
	       ArrayList<Image> list = new ProductDao().inputOpenImg(conn);
	       
	       close(conn);
	       
	      
	       
	       return list;
	       
	    }

	public int selectProdcutNo() {
		
		Connection conn = getConnection();
		int productNo = new ProductDao().selectProductNo(conn);
		
		close(conn);
		
		return productNo;
	}

}
