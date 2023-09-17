package com.fun.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fun.member.model.service.MemberService;
import com.fun.member.model.vo.Member;
import com.fun.product.model.service.ProductService;
import com.fun.product.model.vo.Image;

/**
 * Servlet implementation class IngProject
 */
@WebServlet("/IngProject")
public class IngProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IngProject() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Member m = (Member) request.getSession().getAttribute("loginUser");
		
		int userNo = m.getUserNo();
		
		int result = new MemberService().myPageInsertSeller(userNo);
		
		//int userNo = 2;
		ArrayList<Image> list = new ProductService().selectProImg(userNo);
		Image profile = new ProductService().selectProfile(userNo);
		request.getSession().setAttribute("list", list);
		request.getSession().setAttribute("profile", profile);
		
		request.getRequestDispatcher("views/seller/projectManagement.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		//response.sendRedirect(request.getContextPath());
		
	
	}

}
