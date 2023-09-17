package com.fun.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fun.member.model.vo.Member;
import com.fun.member.model.vo.Pay;
import com.fun.product.model.service.ProductService;
import com.fun.product.model.vo.Product;

/**
 * Servlet implementation class plusWishListServlet
 */
@WebServlet("/pwl.wl")
public class plusWishListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public plusWishListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		
		int result = new ProductService().iPlusWishList(productNo,userNo);
		
		
		request.getRequestDispatcher("/fsi.bo").forward(request,response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
