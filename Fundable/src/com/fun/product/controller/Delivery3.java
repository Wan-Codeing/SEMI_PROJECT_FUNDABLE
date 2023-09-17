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

/**
 * Servlet implementation class Delivery
 */
@WebServlet("/search.de3")
public class Delivery3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delivery3() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member)request.getSession().getAttribute("loginUser");
		String sellerNick = m.getUserNick();
		
		ArrayList<Pay> list1 = new ProductService().selectDeliveryList1(sellerNick);
		ArrayList<Pay> list2 = new ProductService().selectDeliveryList2(sellerNick);
		ArrayList<Pay> list3 = new ProductService().selectDeliveryList3(sellerNick);
		
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.getRequestDispatcher("views/seller/deliveryManagement3.jsp").forward(request, response);
		//response.sendRedirect(request.getContextPath()+"/search.de");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}