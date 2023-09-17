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
 * Servlet implementation class userAddressController
 */
@WebServlet("/address.me")
public class userAddressController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userAddressController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member m = (Member) request.getSession().getAttribute("loginUser");
		
		
		
//		Member addressM = new Member(
//						m.getUserNo(),
//						m.getUserId(),
//						m.getUserPwd(),
//						m.getUserName(),
//						m.getUserNickName(),
//						m.getUserSsg(),
//						m.getEmail(),
//						m.getAddress(),
//						m.getPhone(),
//						m.getEnterDate(),
//						m.getUserInterest(),
//						m.getUserStatus()
//						);
//				
				
		//request.getSession().setAttribute("addressM", addressM); 
		
		request.getRequestDispatcher("views/member/myPageAddress.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member addressM = (Member) request.getSession().getAttribute("addressM");

		String addressName = request.getParameter("addressName");
		String addressPhone = request.getParameter("addressPhone");
		String [] Arr = request.getParameterValues("address");
		
		String address = "";
		
		if(Arr != null) {
			address = String.join(",", Arr);
		}
		
		
		
			addressM.setUserName(addressName);
			addressM.setPhone(addressPhone);
			addressM.setAddress(address);
			
			
			request.getSession().setAttribute("alertMsg","성공적으로 주소지를 수정했습니다.");
			request.getSession().setAttribute("addressM", addressM); // 같은 키값으로 존재할 수 없음 => 즉 덮어쓰기 가능
			
			// 응답페이지 url재요청
			request.getRequestDispatcher("views/member/myPageAddress.jsp").forward(request, response);
	
	
	}

}
