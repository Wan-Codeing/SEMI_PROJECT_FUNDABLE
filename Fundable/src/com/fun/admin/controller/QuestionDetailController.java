package com.fun.admin.controller;

import com.fun.admin.service.BoardService;
import com.fun.board.model.vo.Qa;
import com.fun.admin.service.MemberService;
import com.fun.member.model.vo.Member;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/detail.qu")
public class QuestionDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int qaNo = Integer.parseInt(request.getParameter("qno"));

        Qa qa = new BoardService().selectQuestion(qaNo);
        System.out.println(qa);
        Member mem = new MemberService().selectMember(qa.getUserNo());

        request.setAttribute("qa", qa);
        request.setAttribute("mem", mem);

        request.getRequestDispatcher("views/member/admin/questionDetailView.jsp").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
