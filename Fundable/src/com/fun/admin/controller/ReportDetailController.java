package com.fun.admin.controller;

import com.fun.admin.service.BoardService;
import com.fun.board.model.vo.Report;
import com.fun.common.service.MainService;
import com.fun.admin.service.MemberService;
import com.fun.member.model.vo.Member;
import com.fun.product.model.vo.Image;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/detail.re")
public class ReportDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int reportNo = Integer.parseInt(request.getParameter("rno"));

        Report re = new BoardService().selectReport(reportNo);
        Member mem = new MemberService().selectMemberById(re.getUserId());
        Member target = new MemberService().selectMemberById(re.getReportTarget());
        ArrayList<Image> list = new BoardService().selecReportImag(re.getReportNo());
        
        System.out.println(list);

        request.setAttribute("re", re);
        request.setAttribute("mem", mem);
        request.setAttribute("target", target);
        request.setAttribute("list", list);
        
        request.getRequestDispatcher("views/member/admin/reportDetailView.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
