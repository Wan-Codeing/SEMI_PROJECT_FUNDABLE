package com.fun.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fun.member.model.vo.Member;
import com.fun.member.model.vo.Pay;
import com.fun.member.model.vo.Seller;
import com.fun.member.model.vo.Wishlist;
import com.fun.product.model.service.ProductService;
import com.fun.product.model.vo.Category;
import com.fun.product.model.vo.Image;
import com.fun.product.model.vo.Option;
import com.fun.product.model.vo.Product;

/**
 * Servlet implementation class fundingStroyInput
 */
@WebServlet("/fsi.bo")
public class fundingStroyInput extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fundingStroyInput() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 int productNo = Integer.parseInt(request.getParameter("productNo"));
	     Member m = (Member)request.getSession().getAttribute("loginUser");
	     int userNo = m.getUserNo();
		
		 
	      
	      Image i = new ProductService().fundingStoryImage(productNo);
	      Image ii = new ProductService().fundingStoryInputImage(productNo);
	      Product p = new ProductService().fundingStoryProduct(productNo);
	      ArrayList<Option> po = new ProductService().fundingStoryOption(productNo);
//	      Seller s = new ProductService().fundingStorySeller(productNo);
	      Category c = new ProductService().fundingStoryCategory(productNo);
	      Wishlist wl = new ProductService().fundingStoryWishlist(productNo, userNo);
	     
	    		  
	    		  
	     
	      request.setAttribute("i",i);
	      request.setAttribute("ii",ii);
	      request.setAttribute("p",p);
	      request.setAttribute("po",po);
//	      request.setAttribute("s",s);
	      request.setAttribute("c",c);
	      request.setAttribute("productNo",productNo );
	      
	      
	      if(wl == null) {
	    	  
	    	  Wishlist wl2 = new Wishlist("N");
	    	  System.out.println("이프문 "+wl);
	    	  request.setAttribute("wl",wl2);
	      }else {
	    	  request.setAttribute("wl",wl);
	    	  
	      }
	      

		request.getRequestDispatcher("views/product/fundingStory.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
