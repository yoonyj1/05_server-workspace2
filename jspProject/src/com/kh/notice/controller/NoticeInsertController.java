package com.kh.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeInsertController
 */
@WebServlet("/insert.no")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1) 인코딩
		request.setCharacterEncoding("UTF-8");
		
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		
		// 로그인 한 회원정보를 얻어내는 방법
		// 1. input type = "hidden"으로 애초에 요청 시 숨겨서 전달
		// 2. session에 담겨있는 loginUser 활용하는 방법
		HttpSession session = request.getSession();
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		Notice n = new Notice();
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		// n.setNoticeWriter(userNo + "");
		n.setNoticeWriter(String.valueOf(userNo));
		
		int result = new NoticeService().insertNotice(n);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "공지사항이 작성되었습니다.");
			
			response.sendRedirect(request.getContextPath()+"/list.no");
		} else {
			request.setAttribute("errorMsg", "공지사항 등록 실패");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
