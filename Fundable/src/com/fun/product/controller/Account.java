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
import com.fun.product.model.service.ProductService;
import com.fun.product.model.vo.Product;

/**
 * Servlet implementation class Account
 */
@WebServlet("/search.ac")
public class Account extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Account() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
//				int userNo = Integer.parseInt(request.getParameter("userNo"));
				ArrayList<Product> list1 = new ProductService().searchAccount(userNo);
				request.setAttribute("list1", list1);
				request.getRequestDispatcher("views/seller/accountingManagement.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}