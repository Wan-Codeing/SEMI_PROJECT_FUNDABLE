package com.fun.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fun.product.model.service.ProductService;
import com.fun.product.model.vo.Product;

/**
 * Servlet implementation class FundDeatilView
 */
@WebServlet("/seller.fu")
public class FundDeatilView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FundDeatilView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				int productNo = Integer.parseInt(request.getParameter("pno"));
//				int productNo = 2;
				
				Product p = new ProductService().selectFund(productNo);
				
				request.setAttribute("p", p);
				request.getRequestDispatcher("views/seller/projectDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
