package com.fun.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fun.member.model.service.MemberService;
import com.fun.member.model.vo.Member;
import com.fun.product.model.vo.Image;
import com.fun.product.model.vo.Product;

/**
 * Servlet implementation class wishListController
 */
@WebServlet("/wish.me")
public class wishListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public wishListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Member m = (Member) request.getSession().getAttribute("loginUser");
		int userNo = m.getUserNo();
		
		ArrayList <Image> wishImg = new MemberService().selectWishImg(userNo);
		
		ArrayList <Product> wishP = new MemberService().selectWishp(userNo);
		
		
		
		if(wishImg != null && wishP != null) {
			
			request.getSession().setAttribute("wishImg", wishImg);
			request.getSession().setAttribute("wishP", wishP);
			
			request.getRequestDispatcher("views/member/myPageWish.jsp").forward(request, response);
			
			
			
			
		}else {
			request.getRequestDispatcher("views/member/myPageWish.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		int result = new MemberService().updateWish(userNo,productNo);
		
		System.out.println(userNo);
		System.out.println(productNo);
		
			response.getWriter().print(result);
	}

}
