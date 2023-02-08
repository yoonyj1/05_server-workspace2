package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1) 인코딩 작업
		request.setCharacterEncoding("UTF-8");
		
		// 2) 요청 시 전달값 뽑아서 변수 및 객체에 기록하기
		String userId = request.getParameter("userId"); // "user03"
		String userPwd = request.getParameter("userPwd"); // "pass03"
		String userName = request.getParameter("userName"); // "이름"
		String phone = request.getParameter("phone"); // "010-1234-5678" || ""
		String email = request.getParameter("email"); // "etw@naver.com" || ""
		String address = request.getParameter("address"); // "주소" || ""
		String[] interestArr = request.getParameterValues("interest"); // ["1", "2", ...] || null
		
		// String[] --> String
		// ["운동", "등산"] => "운동,등산"
		String interest = "";
		if (interestArr != null) {
			interest = String.join(",", interestArr);
		}
		
		// 요청 시 전달값이 많기 때문에 객체 생성 후 넘기기
		// 기본생성자로 생성 한 후 setter 메소드 이용해서 담기 => 담으려고 하는 게 소량일 때
		// 매개변수 생성자를 이용해서 생성과 동시에 담기 => 담으려고 하는 게 많을 때
		
		Member m = new Member(userId, userPwd, userName, phone, email, address, interest); // 기본생성자
		
		// 3) 요청처리 (db에 sql문 실행) => 서비스 메소드 호출 및 결과 받기
		
		// 4) 처리결과를 가지고 사용자가 보게 될 응답 뷰 지정 후 포워딩 or url 재요청
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
