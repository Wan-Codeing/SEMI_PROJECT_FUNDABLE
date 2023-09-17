package com.fun.admin.controller;

import com.fun.admin.service.MemberService;
import com.fun.member.model.vo.Member;
import com.fun.member.model.vo.Pay;
import com.fun.admin.service.ProductService;
import com.fun.product.model.vo.Image;
import com.fun.product.model.vo.Option;
import com.fun.product.model.vo.Product;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/detail.pa")
public class PayDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int orderNo = Integer.parseInt(request.getParameter("ono"));

        Pay pay = new MemberService().selectPay(orderNo);

        Member mem = new MemberService().selectMember(pay.getUserNo());

        Option op = new ProductService().selectOption(pay.getOptionNo());

        Product pro = new ProductService().selectProduct(pay.getProductNo());

        ArrayList<Image> list = new ProductService().selectProductImg();
        
        System.out.println(mem);
        
        request.setAttribute("list", list);
        request.setAttribute("pay", pay);
        request.setAttribute("mem", mem);
        request.setAttribute("op", op);
        request.setAttribute("pro", pro);

        request.getRequestDispatcher("views/member/admin/payDetailView.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
