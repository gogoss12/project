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
import javax.servlet.http.HttpSession;

import com.care.mvc.care.model.vo.Care;
import com.care.mvc.care.model.vo.CareImage;
import com.care.mvc.match.model.service.MatchService;
import com.care.mvc.member.model.vo.Member;

@WebServlet("/match/search")
public class MatchSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MatchSearchServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = "";
		String loc = "";

		HttpSession session = request.getSession(false);
		Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null; 
		
		// 비로그인시 로그인 페이지로 이동
		if(loginMember != null) {
			request.getRequestDispatcher("/views/match/search.jsp").forward(request, response);
		}else {
			msg = "로그인이 필요한 페이지입니다.";
			loc = "/member/login";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			
			return;
		}		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] time = request.getParameterValues("time");
		String[] gender = request.getParameterValues("gender");
		String[] qual = request.getParameterValues("qual");
		String[] years = request.getParameterValues("years");
		String[] addr = request.getParameterValues("addr"); // "00시 00구"
		String[] pay = request.getParameterValues("pay");
	
		Map<String, String[]> options = new HashMap<>();
		
//		List<Member> profiles = new ArrayList<>();
		
		List<Care> profiles = new ArrayList<>();
		
		if (null != time && time.length > 0) {
			options.put("time", time);
		} 
		
		if (null != gender && gender.length > 0) {
			options.put("gender", gender);
		} 
		
		if (null != qual && qual.length > 0) {
			options.put("qual", qual);
		} 

		if (null != years && years.length > 0) {
			options.put("years", years);
		} 
		
		if (null != addr && addr.length > 0) {
			options.put("addr", addr);
		}
		
		if (null != pay && pay.length > 0) {
			options.put("pay", pay);		
		} 
	
//		profiles = new MatchService().searchProfiles(options);
		
		profiles = new MatchService().searchProfiles(options);
		
		// profiles 의 각 아이템마다 CareImage 멤버변수에 값을 넣을 것
//		for (Care care : profiles) {
//			CareImage careImg = new CareImage();
//			
//			
//			care.setCareImg(careImg);
//		}
		
		request.setAttribute("profiles", profiles);
		request.getRequestDispatcher("/views/match/list.jsp").forward(request, response);
	}

}
