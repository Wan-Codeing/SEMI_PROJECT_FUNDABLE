package com.fun.common.model.dao;

import static com.fun.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.fun.product.model.vo.Image;
import com.fun.product.model.vo.Product;

public class MainDao {
	
	private Properties prop = new Properties();
	
	public MainDao() {
		String fileName = MainDao.class.getResource("/sql/common/main-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Image> selectMainImage1(Connection conn){
			ArrayList<Image> list = new ArrayList();
			
			PreparedStatement pstmt = null;
			
			ResultSet rset = null;
			
			try {
				String sql = prop.getProperty("selectMainImage1");
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();
				while(rset.next()) {
					list.add(new Image(
							  rset.getString("CHANGE_NAME"),
							  rset.getString("FILE_PATH"),
							  rset.getString("PRODUCT_TITLE"),
							  rset.getInt("PRICE"),
							  rset.getInt("COUNT"),
							  rset.getInt("FUND_PRICE"),
							  rset.getInt("PRODUCT_NO")
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
	
	public ArrayList<Image> selectMainImage2(Connection conn){
		ArrayList<Image> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		try {
			String sql = prop.getProperty("selectMainImage2");
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Image(
						  rset.getString("CHANGE_NAME"),
						  rset.getString("FILE_PATH"),
						  rset.getString("PRODUCT_TITLE"),
						  rset.getInt("PRICE"),
						  rset.getInt("COUNT"),
						  rset.getInt("FUND_PRICE"),
						  rset.getInt("PRODUCT_NO")
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
	public ArrayList<Image> selectMainImage3(Connection conn){
		ArrayList<Image> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		try {
			String sql = prop.getProperty("selectMainImage3");
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Image(
						  rset.getString("CHANGE_NAME"),
						  rset.getString("FILE_PATH"),
						  rset.getString("PRODUCT_TITLE"),
						  rset.getInt("PRICE"),
						  rset.getInt("COUNT"),
						  rset.getInt("FUND_PRICE"),
						  rset.getInt("PRODUCT_NO")
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
	public ArrayList<Image> selectMainImage4(Connection conn){
		ArrayList<Image> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		try {
			String sql = prop.getProperty("selectMainImage4");
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Image(
						  rset.getString("CHANGE_NAME"),
						  rset.getString("FILE_PATH"),
						  rset.getString("PRODUCT_TITLE"),
						  rset.getInt("PRICE"),
						  rset.getInt("COUNT"),
						  rset.getInt("FUND_PRICE"),
						  rset.getInt("PRODUCT_NO")
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
	
	public ArrayList<Product> selectMainRanking(Connection conn){
		ArrayList<Product> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		try {
			String sql = prop.getProperty("selectMainRanking");
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(
						  rset.getInt("PRODUCT_NO"),
						  rset.getString("PRODUCT_TITLE"),
						  rset.getInt("PRICE"),
						  rset.getInt("COUNT"),
						  rset.getInt("FUND_PRICE")
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
	
	public ArrayList<Image> inputImg(Connection conn, String search){
	      
	      ArrayList<Image> list = new ArrayList<Image>();
	      
	      
	      
	      PreparedStatement pstmt = null;
	      
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("inputImgchoi");
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, "%"+search+"%");
	         
	         rset = pstmt.executeQuery();
	         
	         
	         while (rset.next()) {
	            
	                list.add(new Image(
	                      rset.getInt("CATEGORY_NO"),
	                      rset.getInt("PRODUCT_NO"),
	                      rset.getString("CHANGE_NAME"),
	                      rset.getString("FILE_PATH"),
	                      rset.getString("PRODUCT_TITLE")
	                      
	                      ));
	                
	                System.out.println(list);
	                
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
}
