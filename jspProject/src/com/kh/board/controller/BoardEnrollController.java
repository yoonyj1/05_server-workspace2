package com.kh.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardEnrollController
 */
@WebServlet(name = "BoardInsertController", urlPatterns = { "/insert.bo" })
public class BoardEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 일반 방식이 아닌 multipart/form-data로 전송하는 경우 request로부터 값 뽑기 불가
		// String boardTitle = request.getParameter("title");
		
		// enctype이 multipart/form-data로 잘 전송되었을 경우 전반적인 내용들이 수행되도록
		if(ServletFileUpload.isMultipartContent(request)) {
			// System.out.println("ㅎㅇㅎㅇㅎㅇ");
			
			// 파일 업로드를 위한 라이브러리: cos.jar(com.oreilly.servlet의 약자)
			//						   http://www.servlets.com 에 접속해서 다운로드
		}
		
		// 1. 전달되는 파일을 처리할 작업내용(전달되는 파일의 용량 제한, 전달된 파일을 저장시킬 폴더 경로 필요)
		// 1-1) 전달되는 파일의 용량 제한(int maxSize) => 10Mbyte로 제한
		/*
		 * byte => kbyte => mbyte => gbyte => tbyte
		 * 1024byte => 1kbyet
		 * 1mbyte => 1024kbyte
		 * 10mbyte => 10*1024*1024kbyte
 		 */
		int maxSize = 10*1024*1024;
		// 1-2) 전달된 파일을 저장시킬 폴더의 경로 알아내기(String savePath)
		String savePath = request.getSession().getServletContext().getRealPath("resources/board_upfile/");
		// System.out.println(savePath);
		
		// 2. 전달된 파일의 파일명 수정 및 서버에 업로드(폴더에 저장) 작업
			/*
			 * HttpServletRequest => multipartRequest multiRequest로 변환
			 * 
			 * 위 구문 한 줄 실행만으로 넘어온 첨부파일이 해당폴더에 무조건 업로드 됨
			 * 단, 업로드 시 파일명 수정해주는 것이 일반적, 그래서 파일명 수정시켜주는 객체 제시
			 * => 같은 파일명이 존재할 경우 덮어씌워질 수도 있고, 파일명에 한글/특문/띄어쓰기 포함 될 경우 서버에 따라 문제발생
			 * 
			 * 기본적으로 파일명이 안겹치도록 수정작업 해주는 객체 있음
			 * => DefaultFileRenamePolicy 객체 (cos.jar에서 제공하는 객체)
			 * => 내부적으로 해당 클래스에 rename() 메소드 실행 되면서 파일명 수정된 후 업로드
			 * 	  rename(원본파일){
			 * 		기존에 동일한 파일명이 존재할 경우
			 * 		파일명 뒤에 카운팅 된 숫자를 보여줌
			 * 		ex) aaa.jpg, aaa1.jpg, aaa2.jpg
			 * 			하늘사진.jpg, 하늘사진1.jpg, 하늘사진2.jpg
			 * 		return 수정파일;
			 * 		}
			 * 
			 * 		나만의 방식대로 절대 안겹치도록 rename 할 수 있게 나만의 FileRenamePolicy 클래스 (rename 메소드 재정의) 만들기
			 */
		
		MultipartRequest multipartRequest = new MultipartRequest(request, saveDirectory)
		// 3. DB에 기록할 데이터 뽑아서 vo에 담기
		
		// 4. 서비스 요청
		
		// 5. 응답뷰 지정
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
