package com.care.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.care.mvc.member.model.service.MemberService;
import com.care.mvc.member.model.vo.Member;


@WebServlet("/member/enrollupdate")
public class MemberEnrollUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public MemberEnrollUpdateServlet() {
        super();

    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		Member member = new MemberService().findMemberById(userId);
		
		request.setAttribute("userId", userId);
		request.getRequestDispatcher("/views/member/enrollupdate.jsp").forward(request, response);
	}

}
