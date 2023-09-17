package com.fun.common.service;
import static com.fun.common.JDBCTemplate.close;
import static com.fun.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.fun.common.model.dao.MainDao;
import com.fun.product.model.dao.ProductDao;
import com.fun.product.model.vo.Image;
import com.fun.product.model.vo.Product;

public class MainService {
	
	
	public ArrayList<Image> selectMainImage1(){
		Connection conn = getConnection();
		
		ArrayList<Image> list = new MainDao().selectMainImage1(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Image> selectMainImage2(){
		Connection conn = getConnection();
		
		ArrayList<Image> list = new MainDao().selectMainImage2(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Image> selectMainImage3(){
		Connection conn = getConnection();
		
		ArrayList<Image> list = new MainDao().selectMainImage3(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Image> selectMainImage4(){
		Connection conn = getConnection();
		
		ArrayList<Image> list = new MainDao().selectMainImage4(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Product> selectMainRanking(){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new MainDao().selectMainRanking(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Image> inputImg(String search) {
		 
		 Connection conn = getConnection();
		 
		 ArrayList<Image> list = new MainDao().inputImg(conn, search);
		 
		 close(conn);
		 
		
		 
		 return list;
		 
	 }
}
