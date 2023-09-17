package com.fun.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fun.admin.service.BoardService;

/**
 * Servlet implementation class ReportAccessController
 */
@WebServlet("/access.re")
public class ReportAccessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportAccessController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reportNo = Integer.parseInt(request.getParameter("rno"));

        int result = new BoardService().accessReport(reportNo);

        if(result > 0) {
            request.getSession().setAttribute("alertMsg", "성공적으로 답변이 전송되었습니다.");
            response.sendRedirect(request.getContextPath() + "/list.re");
        } else {
            request.setAttribute("errorMsg", "문의 답변 실패");
            response.sendRedirect(request.getContextPath() + "/list.re");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
