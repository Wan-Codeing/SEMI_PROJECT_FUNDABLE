package com.fun.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fun.admin.service.BoardService;
import com.fun.admin.service.MemberService;
import com.fun.board.model.vo.Qa;
import com.fun.member.model.vo.Member;

/**
 * Servlet implementation class QuestionReplyWriteController
 */
@WebServlet("/reView.qu")
public class QuestionReplyWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionReplyWriteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qaNo = Integer.parseInt(request.getParameter("qno"));
		
        Qa qa = new BoardService().selectQuestion(qaNo);
        Member mem = new MemberService().selectMember(qa.getUserNo());
        request.setAttribute("qa", qa);
        request.setAttribute("mem", mem);

        request.getRequestDispatcher("views/member/admin/questionReplyView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
