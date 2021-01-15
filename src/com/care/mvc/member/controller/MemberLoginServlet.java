package com.care.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.care.mvc.member.model.vo.Member;


@WebServlet("/member/login")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemberLoginServlet() {
    }

//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    }
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("views/member/login.jsp");
		String memId = request.getParameter("memId");
		String memPwd = request.getParameter("memPwd");
//		String savId = request.getParameter("savId"); 			// 아이디 저장 체크박스 부분
		
		Member member = null;
		
		System.out.println("memId : " + memId + ", memPwd : " + memPwd);     // 나중에 savId 추가해야함
		
		if(member != null) {
			HttpSession session = request.getSession();
			
			session.setAttribute("loginMember", member);
			
			System.out.println("Session ID : " + session.getId());
		} else {
			
			
		}
		
		
		
		
	}

}




