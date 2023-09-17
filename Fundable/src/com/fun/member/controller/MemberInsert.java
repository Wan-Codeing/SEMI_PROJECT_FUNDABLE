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
 * Servlet implementation class MemberInsert
 */
@WebServlet("/insert.me")
public class MemberInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsert() {
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
		String userId = request.getParameter("userid");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String userNick = request.getParameter("userNick");
		String userSsg1 = request.getParameter("userSsg1");
		String userSsg2 = request.getParameter("userSsg2");
		String userSsg = userSsg1 + " - " + userSsg2;
		String email = request.getParameter("email");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address3 = request.getParameter("address3");
		String address4 = request.getParameter("address4");
		String address = address1 + "," + address2 +"," + address3 +"," + address4;
		String phone = request.getParameter("phone");
		String[] interestArr = request.getParameterValues("interest");
		
		String interest = "";
		
		if(interestArr != null) {
			interest = String.join(", ", interestArr);
		}
		Member m = new Member(userId, userPwd, userName, userNick, userSsg, email, address, phone, interest);
		int result = new MemberService().insertMember(m);

		if(result > 0) { // 성공 -> 메인페이지로 url재요청보내기
			request.getSession().setAttribute("alertMsg", "회원가입에 성공했습니다.");
			response.sendRedirect(request.getContextPath()+"/main.do");
		}else { // 에러페이지로 포워딩
			request.getSession().setAttribute("alertMsg", "회원가입에 실패했습니다.");
			response.sendRedirect(request.getContextPath()+"/main.do");
		}
	}

}
