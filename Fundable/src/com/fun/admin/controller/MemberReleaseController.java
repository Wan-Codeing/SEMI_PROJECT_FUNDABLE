package com.fun.admin.controller;

import com.fun.admin.service.MemberService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/release.me")
public class MemberReleaseController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int userNo = Integer.parseInt(request.getParameter("mno"));

        int result = new MemberService().releaseMember(userNo);

        if(result > 0) { // 성공시 => 목록페이지로 이동
            request.getSession().setAttribute("alertMsg", "성공적으로 차단 해제되었습니다.");
            response.sendRedirect(request.getContextPath() + "/list.me");
        } else { // 실패시 => 에러페이지로 이동
            request.setAttribute("errorMsg", "회원정보 차단 해제 실패");
            response.sendRedirect(request.getContextPath() + "/list.me");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
