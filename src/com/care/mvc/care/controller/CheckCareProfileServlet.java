package com.care.mvc.care.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.care.mvc.GuardAndPatient.model.service.GuardAndPatientService;
import com.care.mvc.GuardAndPatient.model.vo.Guard;
import com.care.mvc.GuardAndPatient.model.vo.Patient;
import com.care.mvc.care.model.service.CareService;

@WebServlet("/profile/care")
public class CheckCareProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckCareProfileServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {			
		String careId = request.getParameter("memId");
		
		System.out.println(careId);
		
		Care care = new CareService().check
		
		Guard guard = new GuardAndPatientService().checkGuard(sendId);
		Patient patient = new GuardAndPatientService().checkPatient(sendId);
		
		request.setAttribute("guard", guard);
		
		
		request.setAttribute("guard", c);
		request.getRequestDispatcher("/views/patient/patprofilecheck.jsp").forward(request, response);		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
