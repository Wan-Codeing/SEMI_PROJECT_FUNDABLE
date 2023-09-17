package com.fun.product.controller;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.SendResult;

import com.fun.member.model.vo.Pay;
import com.fun.product.model.service.ProductService;

/**
 * Servlet implementation class payResultServlet
 */
@WebServlet("/sa.po")
public class payResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public payResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		String pTitle = request.getParameter("pTitle");
		int oNo = Integer.parseInt(request.getParameter("oNo"));
		int tPrice = Integer.parseInt(request.getParameter("tPrice"));
		String nick = request.getParameter("nick");
		
		Pay p = new Pay();
		
		p.setUserNo(userNo);
		p.setProductNo(productNo);
		p.setProductTitle(pTitle);
		p.setOptionNo(oNo);
		p.setTotalPrice(tPrice);
		p.setSellerNickName(nick);
		int result = new ProductService().payResult(p);
		System.out.println(result);
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "결제가 완료 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/ipi.bo?yn=y");
		}
		
		
	}

}
