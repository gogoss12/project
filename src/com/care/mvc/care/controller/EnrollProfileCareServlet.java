package com.care.mvc.care.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.care.mvc.care.model.service.CareService;
import com.care.mvc.care.model.vo.Care;


@WebServlet("/enroll/profile/care")
public class EnrollProfileCareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EnrollProfileCareServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		Cookie cookie = new Cookie("userId", request.getParameter("userId")); 
		
		cookie.setMaxAge(60 * 60 * 24);
		response.addCookie(cookie);
		
		request.setAttribute("userId", userId);
		
		request.getRequestDispatcher("/views/care/careProfile.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = "";
		String location = "";
		Care care = new Care();
		
		care.setCaregen(request.getParameter("caregender"));
		care.setCareLicense(request.getParameter("careLicense"));
		care.setCareYears(request.getParameter("careYears"));
		care.setCareHistory(request.getParameter("careHistory"));
		care.setCarePlus(request.getParameter("carePlus"));
		care.setCareTime(request.getParameter("careTime"));
		care.setCarePlace(request.getParameter("carePlace"));
		care.setCareSal(Integer.parseInt(request.getParameter("careSal")));
		care.setCareIntro(request.getParameter("careIntro"));
		care.setMemId(request.getParameter("userId"));
		
		
		System.out.println(care);
		
		int result = new CareService().enrollcare(care);
		
		if(result > 0) {
			msg = "프로필 등록 성공";
			location = "/";
		} else {
			msg = "프로필 등록 실패";
			location = "/enroll/profile/care";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", location);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

}
