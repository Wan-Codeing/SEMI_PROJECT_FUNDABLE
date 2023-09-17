package com.fun.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fun.board.model.vo.Qa;
import com.fun.member.model.service.MemberService;
import com.fun.member.model.vo.Member;

/**
 * Servlet implementation class myPageQaListController
 */
@WebServlet("/qa.me")
public class myPageQaListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myPageQaListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Member m = (Member) request.getSession().getAttribute("loginUser");
		
		ArrayList<Qa> qaList = new MemberService().selectQaList(m.getUserNo());
		
		
		
		
		request.getSession().setAttribute("qaList", qaList);
		
		request.getRequestDispatcher("views/member/myPageQaList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
