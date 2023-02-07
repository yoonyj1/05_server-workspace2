package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1) 전달 값에 한글이 있을 경우 인코딩 처리해야함(post 방식에만)
		request.setCharacterEncoding("UTF-8");
		
		// 2) 요청 시 전달값을 뽑아서 변수 또는 객체에 기록하기
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		// 3) 요청처리(DB에 SQL문 실행)
		//	 	해당 요청을 처리하는 서비스 클래스의 메소드 호출 및 결과 받기
		Member loginUser = new MemberService().loginMember(userId, userPwd); // null | 로그인한 Member 객체가 담겨있음
		System.out.println(loginUser);
		
		// 4) 처리 된 결과를 가지고 사용자가 보게될 응답뷰(jsp) 지정 후 포워딩 또는 url 재요청
		/*
		 * 응답페이지에 전달할 값이 있을 경우 어딘가에 담아야됨(담을 수 있는 영역 == jsp 내장객체 4종류)
		 * 1) application: 여기에 담긴 데이터는 웹 애플리케이션 전역에서 다 꺼내서 쓸 수 있음
		 * 2) *session: 여기에 담긴 데이터는 내가 직접 지우기 전까지, 세션이 만료(서버가 멈춤, 브라우저 종료)
		 * 				"어떤 jsp던, 어떤 servlet"이던 꺼내 쓸 수 있음
		 * 3) *request: 여기에 담긴 데이터는 현재 이 request 객체를 "포워딩한 응답 jsp에서만" 꺼내 쓸 수 있음(일회성 느낌)
		 * 4) page: 해당 jsp에서 담고 그 jsp에서만 꺼내 쓸 수 있음
		 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
