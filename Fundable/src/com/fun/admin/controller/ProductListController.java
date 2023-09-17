package com.fun.admin.controller;

import com.fun.common.model.vo.PageInfo;
import com.fun.admin.service.ProductService;
import com.fun.product.model.vo.Product;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/list.pr")
public class ProductListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // ----------------- 페이징 처리------------------------
        int listCount; // 현재 총 게시글 갯수(1000개)
        int currentPage; // 현재 페이지(즉, 사용자가 요청한 페이지)
        int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대 갯수(10개씩 할예정)
        int boardLimit; // 한 페이지에 보여질 게시글의 최대 갯수(10개씩 할 예정)

        int maxPage; // 가장 마지막 페이지가 몇번째 페이지인지(총 페이지 갯수)
        int startPage; // 페이지 하단에 보여질 페이징바의 시작수
        int endPage; // 페이지 하단에 보여질 페이징바의 끝수

        // * listCount : 총 게시글 갯수

        listCount = new ProductService().selectPListCount();

        // * currentPage : 현재페이지(즉, 사용자가 요청한 페이지)
        currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));

        // * pageLimit : 페이지 하단에 보여질 페이징바의 페이지 최대 갯수(페이지 목록들을 몇 개 단위로 출력할 것인지)
        pageLimit = 10;

        // * boardLimit : 한 페이지에 보여질 게시글의 최대 갯수(게시글 몇개 단위로 출력할 것인지)
        boardLimit = 10;


        maxPage = (int)Math.ceil((double)listCount / boardLimit);

        startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

        endPage = startPage + pageLimit - 1;
        // startPage 21이어서 endPage가 30으로 설정이 됐지만, maxPage가 고작 25페이지까지만 나온다면??
        // => endPage는 30이 아니라 25로 설정해야 옳다.
        if(endPage > maxPage) {
            endPage = maxPage;
        }

        PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

        request.setAttribute("pi", pi);

        // 2. 현재 사용자가 요청한 페이지(currentPage)에 맞는 게시글 리스트 가져오기

        ArrayList<Product> list = new ProductService().selectPList(pi);

        request.setAttribute("list", list);

        request.getRequestDispatcher("/views/member/admin/productListView.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
