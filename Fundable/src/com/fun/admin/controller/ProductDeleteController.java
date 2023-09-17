package com.fun.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fun.admin.service.ProductService;

/**
 * Servlet implementation class ProductDeleteController
 */
@WebServlet("/delete.pr")
public class ProductDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productNo = Integer.parseInt(request.getParameter("pno"));

        int result = new ProductService().deleteProduct(productNo);

        if(result > 0) { // 성공시 => 목록페이지로 이동
            request.getSession().setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
            response.sendRedirect(request.getContextPath() + "/list.pr");
        } else { // 실패시 => 에러페이지로 이동
            request.setAttribute("errorMsg", "상품정보 삭제 실패");
            response.sendRedirect(request.getContextPath() + "/list.pr");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
