package com.fun.common.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fun.common.service.MainService;
import com.fun.product.model.vo.Image;
import com.fun.product.model.vo.Product;

/**
 * Servlet implementation class MainImage
 */
@WebServlet("/main.do")
public class MainImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Image> list1 = new MainService().selectMainImage1();
		ArrayList<Image> list2 = new MainService().selectMainImage2();
		ArrayList<Image> list3 = new MainService().selectMainImage3();
		ArrayList<Image> list4 = new MainService().selectMainImage4();
		ArrayList<Product> plist = new MainService().selectMainRanking();
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("list4", list4);
		request.setAttribute("plist", plist);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
