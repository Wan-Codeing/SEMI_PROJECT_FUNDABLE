package com.fun.board.model.controller;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fun.board.model.service.BoardService;
import com.fun.board.model.vo.Report;
import com.fun.common.MyFileRenamePolicy;
import com.fun.product.model.vo.Image;
import com.oreilly.servlet.MultipartRequest;
/**
 * Servlet implementation class BoardReport
 */
@WebServlet("/report.bo")
public class BoardReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReport() {
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
	         String savePath = request.getServletContext().getRealPath("/views/img/uproadfiles/");
			
			// 2. 전달된 파일명 수정 작업 후 서버에 업로드
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize,"UTF-8",new MyFileRenamePolicy());
			
			// 3. DB에 전달할 값 뽑기
			// Board 테이블에 insert시 필요한 데이터 뽑기
			Report r = new Report();
			r.setUserNo(Integer.parseInt(multi.getParameter("userNo")));
			r.setUserId(multi.getParameter("userId"));
			r.setUserEmail(multi.getParameter("userEmail"));
			r.setReportCategory(multi.getParameter("report-category"));
			r.setReportTitle(multi.getParameter("title"));
			r.setReportTarget(multi.getParameter("target"));
			r.setReportContent(multi.getParameter("content"));
			
			// Attachment테이블에 여러번 insert할 데이터 뽑기
			//  단, 여러개의 첨부파일이 있을것이기 때문에 Attachment들을 ArrayList에 담기
			// => 적어도 1개이상은 담길것(썸네일은 필수입력사항 이였으므로)
			
			ArrayList<Image> list = new ArrayList();
			
			for(int i=1; i<=2; i++) { // 파일 최대갯수가 4이기때문
				
				String key = "file"+i;
				System.out.println(key);
				if(multi.getOriginalFileName(key) != null) {
					// 첨부파일 존재함
					// Attachment 객체 생성, 원본명, 수정명, 저장경로, 파일레벨 담아서 list에 넘겨주기
					Image clue= new Image();
					clue.setOriginName(multi.getOriginalFileName(key));
					clue.setChangeName(multi.getFilesystemName(key));
					clue.setFilePath("views/img/uproadfiles/");
					
					if(i==1) {
						clue.setFileLevel(7);
					}else {
						clue.setFileLevel(8);
					}
					
					list.add(clue);
				}
			}
			
			int result = new BoardService().insertReport(r, list);
				
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "성공적 업로드");
				response.sendRedirect(request.getContextPath()+"/list.no");
			}else {
				request.setAttribute("alertMsg", "업로드에 실패 했습니다.");
				request.getRequestDispatcher("views/notice/list.no").forward(request, response);
			}
			
		}
	}

}
