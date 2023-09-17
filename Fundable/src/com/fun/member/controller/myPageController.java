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
import com.fun.product.model.vo.Image;

/**
 * Servlet implementation class myPageController
 */
@WebServlet("/myPage.me")
public class myPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Member m  = (Member) request.getSession().getAttribute("loginUser");
		
		
		Image profileImg = new MemberService().selectProfileImg(m.getUserId());
		
		ArrayList<Image> pList = new MemberService().selectProfileProductImg(m.getUserId()); 
		
		ArrayList<Pay> pTextList = new MemberService().selectProfileProductText(m.getUserId()); 
		
		
		Image imgNone = new Image();
			
			
				if(profileImg != null) {
					request.getSession().setAttribute("profileImg", profileImg);
					
				}else {
					request.getSession().setAttribute("profileImg", imgNone);
				}
			
				request.getSession().setAttribute("pList", pList);
			
				request.getSession().setAttribute("pTextList", pTextList);
			
			//request.getSession().setAttribute("alertMsg","로그인이 성공적으로 완료되었습니다.");
			request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		Member m  = (Member) request.getSession().getAttribute("loginUser");
		
		
		Image profileImg = new MemberService().selectProfileImg(m.getUserId());
		
		ArrayList<Image> pList = new MemberService().selectProfileProductImg(m.getUserId()); 
		
		ArrayList<Pay> pTextList = new MemberService().selectProfileProductText(m.getUserId()); 
		
		System.out.println(pList);
		System.out.println(pTextList);
	
//		for(Image i : pList) {
//			System.out.println(i);
//		}
//		for(Pay p : pTextList) {
//			System.out.println(p);
//		}
//		
			
		Image imgNone = new Image();
				
		
		
		if(profileImg != null) {
			request.getSession().setAttribute("profileImg", profileImg);
			
		}else {
			request.getSession().setAttribute("profileImg", imgNone);
		}
			
				request.getSession().setAttribute("pList", pList);
			
				request.getSession().setAttribute("pTextList", pTextList);
			
			//request.getSession().setAttribute("alertMsg","로그인이 성공적으로 완료되었습니다.");
			request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
			//response.sendRedirect(request.getContextPath()+"/index.jsp");
		
		
	}

}
