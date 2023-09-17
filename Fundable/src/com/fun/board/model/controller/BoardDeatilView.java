package com.fun.board.model.controller;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fun.board.model.service.BoardService;
import com.fun.board.model.vo.Notice;

/**
 * Servlet implementation class BoardDeatilView
 */
@WebServlet("/detail.bo")
public class BoardDeatilView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeatilView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클릭했던 공지사항의 글번호 얻어오기
		int noticeNo = Integer.parseInt(request.getParameter("ano"));
		// 게시글 클릭시 조회수 증가서비스 호출
		int result = new BoardService().increaseCount(noticeNo);
		// 내가선택한 게시글의 공지사항 정보 조회
		Notice n = new BoardService().selectNotice(noticeNo);
		
		request.getSession().setAttribute("n", n);
		response.sendRedirect(request.getContextPath()+"/views/notice/NoticeDetailBoard.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
