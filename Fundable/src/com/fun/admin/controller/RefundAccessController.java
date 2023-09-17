package com.fun.admin.controller;

import com.fun.admin.service.MemberService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/delete.pa")
public class RefundAccessController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int orderNo = Integer.parseInt(request.getParameter("ono"));

        int result = new MemberService().deletePay(orderNo);

        if(result > 0) { // 성공시 => 목록페이지로 이동
            request.getSession().setAttribute("alertMsg", "성공적으로 환불되었습니다.");
            response.sendRedirect(request.getContextPath() + "/list.pa");
        } else { // 실패시 => 에러페이지로 이동
            request.setAttribute("errorMsg", "환불 승인 실패");
            response.sendRedirect(request.getContextPath() + "/list.pa");
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
