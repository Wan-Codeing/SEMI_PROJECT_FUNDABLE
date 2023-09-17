package com.fun.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fun.common.MyFileRenamePolicy;
import com.fun.member.model.vo.Member;
import com.fun.product.model.service.ProductService;
import com.fun.product.model.vo.Image;
import com.fun.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ProjectInf
 */
@WebServlet("/insert.pr")
public class ProjectInf extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectInf() {
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

		if(ServletFileUpload.isMultipartContent(request)) {
			
			//1_1. 전송용량제한
			int maxSize = 10*1024*1024;
			
			//1_2. 저장할 폴더의 물리적인 경로
			String savePath = request.getServletContext().getRealPath("views/img/");
		
			//2. 전달된 파일명 수정 작업 후 서버에 업로드
			MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			String eDate = (multi.getParameter("end-date").replace("-",""));
			String oDate = (multi.getParameter("open-date").replace("-",""));;
			//3. DB에 전달할 값 뽑기.
			// Board테이블에 Insert시 필요한 테이터 뽑기
			int categoryNo = 0;
			if(multi.getParameter("category").equals("테크 · 가전")) {
				categoryNo = 1;
			} else if (multi.getParameter("category").equals("패션 · 잡화")) {
				categoryNo = 2;
			} else if (multi.getParameter("category").equals("홈 · 리빙")) {
				categoryNo = 3;
			} else if (multi.getParameter("category").equals("뷰티")) {
				categoryNo = 4;
			} else if (multi.getParameter("category").equals("푸드")) {
				categoryNo = 5;	
			} else if (multi.getParameter("category").equals("출판")) {
				categoryNo = 6;	}
			Product p = new Product();
			p.setCategoryNo(categoryNo);
			p.setFundPrice(Integer.parseInt(multi.getParameter("funding-price")));
			p.setpTitle(multi.getParameter("project-name"));
			p.setTag(multi.getParameter("tag"));
			p.setDescription(multi.getParameter("description"));
			p.setCount(Integer.parseInt(multi.getParameter("project-count")));
			p.setPrice(Integer.parseInt(multi.getParameter("project-price")));
			p.setSellerNickName(multi.getParameter("seller-nickname"));
			
			Member m = new Member();
			m.setUserNo(Integer.parseInt(multi.getParameter("userNo")));
			ArrayList<Image> list = new ArrayList();
			
			for(int i = 1; i<=2; i++) { // 파일의 최대갯수는 4개이므로 최대 4회 반복
				
				String key = "file"+i;
				
				if(multi.getOriginalFileName(key) != null) {
					// 첨부파일이 존재할 경우
					// Attachment객체 생성 + 원본명,수정명,저장경로,파일레벨을 담아서, list에 넣어주기
					Image at = new Image();
					at.setOriginName(multi.getOriginalFileName(key));
					at.setChangeName(multi.getFilesystemName(key));
					at.setFilePath("views/img/");
					
					if( i == 1) { // 대표이미지라면
						at.setFileLevel(1);
					}else { // 상세이미지라면
						at.setFileLevel(2);
					}
					
					list.add(at);
				}
			}
			int result = new ProductService().insertThumbnailBoard(p, list, oDate, eDate, m);
			if(result > 0) { // 성공시 => list.th 요청 => 사진게시판 리스트 이미지
				request.getSession().setAttribute("alertMsg","성공적으로 저장되었습니다.");
				response.sendRedirect(request.getContextPath()+"/views/seller/projectManagement.jsp");
				return;// 사진게시판 리스트작업 완료후 변경예정
			}else { // 실패 => 에러페이지
				request.getSession().setAttribute("alertMsg","저장 실패");
				request.getRequestDispatcher("/views/seller/projectInf.jsp").forward(request, response);
			}
			
		}
	}

	}