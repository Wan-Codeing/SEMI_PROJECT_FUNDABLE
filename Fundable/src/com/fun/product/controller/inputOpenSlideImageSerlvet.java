package com.fun.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fun.product.model.service.ProductService;
import com.fun.product.model.vo.Image;

/**
 * Servlet implementation class inputOpenSlideImageSerlvet
 */
@WebServlet("/ioso.bo")
public class inputOpenSlideImageSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inputOpenSlideImageSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Image> osList = new ProductService().inputOpenSlideImg();
		ArrayList<Image> ovsList = new ProductService().inputOpenViewSlideImg();
		
		System.out.println(osList);
		System.out.println(ovsList);
		request.setAttribute("osList",osList);
		request.setAttribute("ovsList",ovsList);
		
		request.getRequestDispatcher("/views/product/opens.jsp").forward(request,response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
