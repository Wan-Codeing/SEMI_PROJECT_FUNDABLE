package com.fun.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fun.member.model.service.MemberService;
import com.fun.member.model.vo.Member;

/**
 * Servlet implementation class checkPwdController
 */
@WebServlet("/check.me")
public class checkPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("views/member/myPageCheckPwd.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		String pwd = request.getParameter("password");
		Member m = (Member) request.getSession().getAttribute("loginUser");
		System.out.println(pwd);
		System.out.println(m.getUserPwd());
		int result = new MemberService().infoCheckPwd(pwd,m.getUserId());
		
		//String [] iArr = m.getUserInterest().split(",");
		
		String [] iArr = new String[6];



		



		// 
		
		
		if(result > 0) {
			if(m.getUserInterest() != null) {
	            iArr = m.getUserInterest().split(",");
	            request.getSession().setAttribute("iArr", iArr);
	         }else {
	            for(int i = 0 ; i < iArr.length; i++) {
	               iArr[i] = "";
	            }
	            request.getSession().setAttribute("iArr", iArr);
	         }			
			request.getRequestDispatcher("views/member/myPageInfoSet.jsp").forward(request, response);
			
		}else {
			
			request.getSession().setAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
			request.getRequestDispatcher("views/member/myPageCheckPwd.jsp").forward(request, response);
			
		}
	
	
	}

}
