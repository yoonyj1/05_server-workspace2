package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/update.bo")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			// 1_1. 전달되는 파일 용량 제한(int maxSize)
			int maxSize = 10 * 1024 * 1024; // 10MB
			
			// 1_2. 전달되는 파일을 저장시킬 서버의 폴더 물리적인 경로(String savePath)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/borad_upfiles/");
			
			// 2. 전달 된 파일명 수정작업 후 서버에 업로드
			// HttpServletRequest => MultipartRequest
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 3. 본격적으로 SQL문 실행 할 때 필요한 값(요청 시 전달값) 뽑아서 vo에 기록
			//  > 공통적으로 수행: UPDATE BOARD
			int boardNo = Integer.parseInt(multiRequest.getParameter("bno"));
			String category = multiRequest.getParameter("category");
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			
			Board b = new Board();
			b.setBoardNo(boardNo);
			b.setCategoryNo(category);
			b.setBoardTitle(boardTitle);
			b.setBoardContent(boardContent);
			
			Attachment at = null; // 처음에는 null로 초기화, 넘어온 새 첨부파일이 있을 경우 그때 생성
			
			// 첨부파일이 넘어왔는지 확인하는 방법
			if(multiRequest.getOriginalFileName("upfile") != null) {
				// 새로 넘어온 첨부파일이 있을 경우
			}
			
			// 새로 넘어온 첨부파일이 없었다면 at는 null일 것
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
