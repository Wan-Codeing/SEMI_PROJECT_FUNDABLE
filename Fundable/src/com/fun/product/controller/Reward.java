package com.fun.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fun.product.model.service.ProductService;

/**
 * Servlet implementation class Reward
 */
@WebServlet("/reward.pr")
public class Reward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reward() {
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
		
		request.setCharacterEncoding("UTF-8");
		
		int rewardpNo = Integer.parseInt(request.getParameter("rewardpNo"));
		String optionName = request.getParameter("rewardname");
		int optionPrice = Integer.parseInt(request.getParameter("rewardprice"));
		String description = request.getParameter("rewarddescription");
	
		int result = new ProductService().insertReward(optionName,optionPrice,description,rewardpNo);
		
		if(result > 0) { // 성공시 => list.th 요청 => 사진게시판 리스트 이미지
			if(result==4) {
				request.getSession().setAttribute("alertMsg","프로젝트 작성을 먼저해주세요.");
				response.sendRedirect(request.getContextPath()+"/views/seller/projectManagement.jsp");
			}else {
				request.getSession().setAttribute("alertMsg","성공적으로 저장되었습니다.");
				response.sendRedirect(request.getContextPath()+"/views/seller/projectManagement.jsp");
			}
			return;// 사진게시판 리스트작업 완료후 변경예정
		}else { // 실패 => 에러페이지
			request.getSession().setAttribute("alertMsg","저장 실패");
			request.getRequestDispatcher("/views/seller/projectInf.jsp").forward(request, response);
		}
	
	
	}

}
