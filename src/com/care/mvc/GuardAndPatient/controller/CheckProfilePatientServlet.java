package com.care.mvc.GuardAndPatient.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.care.mvc.GuardAndPatient.model.service.GuardAndPatientService;
import com.care.mvc.GuardAndPatient.model.vo.Guard;
import com.care.mvc.GuardAndPatient.model.vo.Patient;
import com.care.mvc.member.model.vo.Member;

@WebServlet("/check/patient")
public class CheckProfilePatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckProfilePatientServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sendId = request.getParameter("sendId");
		System.out.println(sendId);
		
		Member member = new Member();
		
		
	
		Guard guard = new GuardAndPatientService().checkGuard(sendId);
		Patient patient = new GuardAndPatientService().checkPatient(sendId);
		
		request.setAttribute("guard", guard);
		request.setAttribute("patient", patient);
		
		request.getRequestDispatcher("/views/patient/patprofilecheck.jsp").forward(request, response);
			
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
