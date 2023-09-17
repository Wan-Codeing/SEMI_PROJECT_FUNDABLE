package com.fun.admin.controller;

import com.fun.admin.service.ProductService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/access.fu")
public class FundAccessController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int productNo = Integer.parseInt(request.getParameter("pno"));

        int result = new ProductService().accessFunding(productNo);

        if(result > 0) { // 성공시 => 목록페이지로 이동
            request.getSession().setAttribute("alertMsg", "펀딩 승인이 완료되었습니다.");
            response.sendRedirect(request.getContextPath() + "/list.fu");
        } else { // 실패시 => 에러페이지로 이동
            request.setAttribute("errorMsg", "펀딩 승인 실패");
            response.sendRedirect(request.getContextPath() + "/list.fu");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
