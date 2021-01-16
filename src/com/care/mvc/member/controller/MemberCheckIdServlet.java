package com.care.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.care.mvc.member.model.service.MemberService;

@WebServlet("/member/checkId")
public class MemberCheckIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberCheckIdServlet() {
    }

//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("memId");
		
		System.out.println("memId" + userId);
		
		boolean valid = new MemberService().validate(userId);

		request.setAttribute("valid", valid);
		
//		request.getParameter("/views/member/체크아이디.jsp").forward(request, response);
	}

}
