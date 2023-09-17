package com.fun.admin.controller;

import com.fun.admin.service.BoardService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/reply.qu")
public class QuestionReplyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int qaNo = Integer.parseInt(request.getParameter("qno"));
        String reply = request.getParameter("reply");
        
        int result = new BoardService().replyQuestion(qaNo);

        if(result > 0) { // 성공시 => 목록페이지로 이동
            request.getSession().setAttribute("alertMsg", "성공적으로 답변이 전송되었습니다.");
            response.sendRedirect(request.getContextPath() + "/list.qu");
        } else { // 실패시 => 에러페이지로 이동
            request.setAttribute("errorMsg", "문의 답변 실패");
            response.sendRedirect(request.getContextPath() + "/list.qu");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
