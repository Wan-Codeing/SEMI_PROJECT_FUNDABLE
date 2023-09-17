package com.fun.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fun.admin.service.ProductService;
import com.fun.product.model.vo.Image;
import com.fun.product.model.vo.Product;

@WebServlet("/detail.pr")
public class ProductDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int productNo = Integer.parseInt(request.getParameter("pno"));
        
        ProductService pService = new ProductService();

        Product p = pService.selectProduct(productNo);

        ArrayList<Image> list = pService.selectProductImg();
        System.out.println(list);
        request.setAttribute("p", p);
        request.setAttribute("list", list);
        request.getRequestDispatcher("views/member/admin/productDetailView.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
