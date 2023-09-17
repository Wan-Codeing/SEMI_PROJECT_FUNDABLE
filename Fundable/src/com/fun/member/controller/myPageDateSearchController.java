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
import com.fun.member.model.vo.Pay;
import com.fun.product.model.vo.Image;

/**
 * Servlet implementation class myPageDateSearchController
 */
@WebServlet("/dateSearch.me")
public class myPageDateSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myPageDateSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Member m = (Member) request.getSession().getAttribute("loginUser");
		
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		System.out.println(startDate);
		System.out.println(endDate);
		
		
		ArrayList<Image> searchP = new MemberService().selectSearchP(m.getUserNo(),startDate,endDate); 
		ArrayList<Pay> searchTextList = new MemberService().searchTextList(m.getUserNo(),startDate,endDate); 
		
		for(Image i : searchP) {
			System.out.println(i);
		}
		for(Pay p : searchTextList) {
			System.out.println(p);
		}
		
		
		request.getSession().setAttribute("searchP", searchP);
		request.getSession().setAttribute("searchTextList", searchTextList);
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		
		request.getRequestDispatcher("views/member/myPageDateSearch.jsp").forward(request, response);
	}

}
