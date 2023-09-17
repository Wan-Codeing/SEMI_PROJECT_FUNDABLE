package com.fun.admin.controller;

import com.fun.admin.service.BoardService;
import com.fun.board.model.vo.Notice;
import com.fun.member.model.vo.Member;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;


@WebServlet("/insert.no")
public class NoticeInsertController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("views/notice/noticeEnrollForm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String title = request.getParameter("title");
        String content = request.getParameter("content");

        Notice n = new Notice();

        n.setArticleTitle(title);
        n.setArticleContent(content);

        int result = new BoardService().insertNotice(n);

        if(result > 0) { // 성공시 => /jsp2/list.no 리스트 페이지가 보여지도록 url 재요청 보낼것.
            request.getSession().setAttribute("alertMsg", "성공적으로 공지사항이 등록되었습니다.");
            response.sendRedirect(request.getContextPath()+"/list.no");
        } else {
            request.setAttribute("errorMsg", "공지사항 등록 실패");
            request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
        }

    }
}
