package com.fun.board.model.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fun.board.model.service.BoardService;
import com.fun.board.model.vo.Notice;
import com.fun.common.model.vo.PageInfo;

/**
 * Servlet implementation class BoardSearch
 */
@WebServlet("/searchlist.no")
public class BoardSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearch() {
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
		String keyword = request.getParameter("boardsearch");
		// ---------------------------------------페이징 처리---------------------------------------------------------------
		int listCount; // 현재 총 게시글 갯수(1000개)
		int currentPage; // 현재 페이지(즉, 사용자가 요청한 페이지)
		int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대 갯수(10개씩 할 예정)
		int boardLimit; // 한페이지에 보여질 게시글의 최대 갯수(10개씩 할예정)
		
		int maxPage; // 가장 마지막 페이지가 몇번쨰 페이지인지 (총 페이지 갯수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝수
		
		// * listCount : 총 게시글 글수
		listCount = new BoardService().searchListCount(keyword);
		
		// * currentPage : 현재 내가 보고있는 페이지(즉, 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
		
		// * pageLmit : 페이지 하단에 보여질 페이징바의 페이지 최대 갯수(페이지 목록들을 몇개 단위로 출력할 것인지)
		pageLimit = 5;
		
		// * boardLimit : 한페이지에 보여질 게시글의 최대 갯수(게시글 몇개 단위로 출력할것인지)
		boardLimit = 5;
	
		maxPage = (int)Math.ceil((double)listCount / boardLimit); 
	
		startPage = ((currentPage-1) / pageLimit) * pageLimit + 1;
	
		endPage = startPage + pageLimit - 1;
		// startPage 21이여서 endPage가 30으로 설정이 됐지만, maxPage가 고작 25페이지까지만 나온다면??
		// => endPage = 25로 설정해야한다.
		if(endPage> maxPage) {
			endPage = maxPage;
		}
		// 페이지 정보들을 하나로 모아서 vo클래스에 담기
		// 1. 페이징바를 만들때 필요한 객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 공지사항 전체 리스트 조회후 조회결과 담아주기
		ArrayList<Notice> list = new BoardService().searchlist(keyword, pi);
		
		request.setAttribute("keyword", keyword);
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/notice/SearchBoard.jsp").forward(request, response);
	}

}
