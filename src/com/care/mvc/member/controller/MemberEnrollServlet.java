package com.care.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.care.mvc.member.model.service.MemberService;
import com.care.mvc.member.model.vo.Member;
@WebServlet("/member/enroll")
public class MemberEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public MemberEnrollServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/enroll.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = "";
		String location = "";
		Member member = new Member();
		
		member.setMemId(request.getParameter("userId"));
		member.setMemRole(request.getParameter("role"));
		member.setMemName(request.getParameter("userName"));
		member.setMemPwd(request.getParameter("userPwd"));
		member.setMemEmail(request.getParameter("email"));
		member.setMemPhone(request.getParameter("phone"));
		member.setMemAddr(request.getParameter("addr1" + "addr2")); // 지역주소 + 상세주소
		member.setMemBirth(request.getParameter("birth"));
		
		System.out.println(member);
				
		int result = new MemberService().enrollMember(member);
		
		if (result > 0) {
			msg = "회원가입 성공";
			location = "/";
		} else {
			msg = "회원가입 실패";
			location = "/member/enroll";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("location", location); 
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
