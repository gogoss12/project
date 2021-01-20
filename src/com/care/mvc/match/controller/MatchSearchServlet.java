package com.care.mvc.match.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.care.mvc.care.model.vo.Care;
import com.care.mvc.match.model.service.MatchService;
import com.care.mvc.member.model.vo.Member;


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
		String[] time = request.getParameterValues("time");
		String[] gender = request.getParameterValues("gender");
		String[] qual = request.getParameterValues("qual");
		String[] years = request.getParameterValues("years");
		String[] addr = request.getParameterValues("addr"); // "00시 00구"
		String[] pay = request.getParameterValues("pay");
		
		Map<String, String[]> options = new HashMap<>();
		
		options.put("time", time);
		options.put("gender", gender);
		options.put("qual", qual);
		options.put("years", years);
		options.put("addr", addr);
		options.put("pay", pay);		
		
		List<Member> profiles = new MatchService().searchProfiles(options);
		
		// msg.jsp로 dispatch 하지 않는다.
		request.setAttribute("profiles", profiles);
		request.getRequestDispatcher("/views/match/search.jsp").forward(request, response);
	}

}
