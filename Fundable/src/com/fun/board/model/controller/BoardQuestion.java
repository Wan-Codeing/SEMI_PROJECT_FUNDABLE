package com.fun.board.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fun.board.model.service.BoardService;
import com.fun.board.model.vo.Qa;


/**
 * Servlet implementation class BoardQuestion
 */
@WebServlet("/question.bo")
public class BoardQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardQuestion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String email = request.getParameter("email");
		String person = request.getParameter("person");
		String content = request.getParameter("content");
		String phone = request.getParameter("phone");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
	
		Qa q = new Qa();
		q.setQaTitle(title);
		q.setQaEmail(email);
		q.setQaPerson(person);
		q.setQaContent(content);
		q.setQaPhone(phone);
		q.setUserNo(userNo);
		
		int result = new BoardService().insertQa(q);

		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "문의신청이 정상적으로 접수됬습니다.");
			response.sendRedirect(request.getContextPath()+"/list.no");
		}else {
			request.getSession().setAttribute("alertMsg", "문의신청 접수에 실패했습니다.");
			response.sendRedirect(request.getContextPath()+"/list.no");
		}
	}
}
