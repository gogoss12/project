package com.care.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<<<<<<< HEAD

@WebServlet("/intro")
public class MemberIntroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemberIntroServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/common/intro.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
=======
@WebServlet("/Intro")
public class MemberIntroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberIntroServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/common/intro.jsp").forward(request, response);
>>>>>>> f3a4e78a1610411591c43b1e8a59a23ec2cb9939
	}

}
