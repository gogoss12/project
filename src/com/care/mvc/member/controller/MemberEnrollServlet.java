package com.care.mvc.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.care.mvc.member.model.vo.Member;
@WebServlet("/member/enroll")
public class MemberEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MemberEnrollServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/member/enroll.jsp");
		
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String msg = "";
//		String location = "";
//		Member member = new Member();
//		
//		member.setMemId(request.getParameter("memId"));
//		member.setMemRole(request.getParameter("memId"));
//		member.setMemName(request.getParameter("memId"));
//		member.setMemPwd(request.getParameter("memId"));
//		member.setMemEmail(request.getParameter("memId"));
//		member.setMemPhone(request.getParameter("memId"));
//		member.setMemAddr(request.getParameter("memId"));
//		member.setMemBirth(request.getParameter("memId"));
//		
	}

}



