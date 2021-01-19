package com.care.mvc.match.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.care.mvc.care.model.vo.Care;
import com.care.mvc.match.model.service.MatchService;


@WebServlet("/match/search")
public class MatchSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MatchSearchServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/match/search.jsp").forward(request, response);	// search.jsp 화면 띄우기
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 버튼 클릭 시 쿼리문으로 해당 검색조건에 걸리는 요양보호사 프로필 업로드
//		int result = 0;
//		String mg = "";
//		String loc = "";
		
		List<Care> profiles = new MatchService().searchProfiles();
		
		// msg.jsp로 dispatch 하지 않는다.
		request.setAttribute("profiles", "profiles");
		request.getRequestDispatcher("/views/match/search.jsp").forward(request, response);
	}

}
