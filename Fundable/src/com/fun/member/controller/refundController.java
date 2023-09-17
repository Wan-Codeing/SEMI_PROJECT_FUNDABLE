package com.fun.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fun.member.model.service.MemberService;
import com.fun.member.model.vo.Member;
import com.fun.member.model.vo.Pay;

/**
 * Servlet implementation class refundController
 */
@WebServlet("/refund.me")
public class refundController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public refundController() {
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
		
		String hiddenRequest = request.getParameter("hiddenRequest");
		
		String orderNo =  request.getParameter("hiddenOrderNo");
	
		int result = new MemberService().refundProduct(orderNo,hiddenRequest);
		
		Member m  = (Member) request.getSession().getAttribute("loginUser");
		
		ArrayList<Pay> pTextList = new MemberService().selectProfileProductText(m.getUserId()); 
	
		
		
		if(hiddenRequest.equals("refund")) {
		if(result > 0 ) {
			
			//request.removeAttribute("pTextList");
			//request.setAttribute("pTextList", pTextList);
			// request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
			response.sendRedirect(request.getContextPath()+"/myPage.me");
			
		}else {
			request.setAttribute("alertMsg", "예약취소에 실패하였습니다.");
			request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
		}
		}
		
		
		
		if(hiddenRequest.equals("request")) {
			if(result > 0 ) {
				
				//request.removeAttribute("pTextList");
				//request.setAttribute("pTextList", pTextList);
				// request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
				response.sendRedirect(request.getContextPath()+"/delivery.me");
				//request.getRequestDispatcher("views/member/myPageDelivery.jsp").forward(request, response);
				
			}else {
				request.setAttribute("alertMsg", "환불신청에 실패하였습니다.");
				request.getRequestDispatcher("views/member/myPageDelivery.jsp").forward(request, response);
			}
			
			}
	
		
	
	}

}
