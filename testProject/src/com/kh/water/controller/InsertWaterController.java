package com.kh.water.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.water.model.service.WaterService;

/**
 * Servlet implementation class InsertWaterController
 */
@WebServlet("/insert.wa")
public class InsertWaterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertWaterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("waterName");
		int price = Integer.parseInt(request.getParameter("waterPrice"));
		
		int result = new WaterService().insertWater(name, price);
		HttpSession session = request.getSession();
		if(result > 0) {
			session.setAttribute("alertMsg", "추가 성공");
			
			response.sendRedirect(request.getContextPath());
		} else {
			session.setAttribute("alertMsg", "추가 실패");
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
