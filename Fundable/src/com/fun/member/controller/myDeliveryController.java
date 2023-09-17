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

/**
 * Servlet implementation class myDeliveryController
 */
@WebServlet("/delivery.me")
public class myDeliveryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myDeliveryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Member m  = (Member) request.getSession().getAttribute("loginUser");
		ArrayList<Pay> pTextList = new MemberService().selectProfileProductText(m.getUserId());
		request.setAttribute("pTextList", pTextList);
		request.getRequestDispatcher("views/member/myPageDelivery.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m  = (Member) request.getSession().getAttribute("loginUser");
		ArrayList<Pay> pTextList = new MemberService().selectProfileProductText(m.getUserId()); 
		request.getRequestDispatcher("views/member/myPageDelivery.jsp").forward(request, response);
	
	}

}
