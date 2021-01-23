package com.care.mvc.GuardAndPatient.controller;

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
import com.care.mvc.care.model.vo.Care;
import com.care.mvc.care.model.vo.PatientWanted;

@WebServlet("/check/patient")
public class CheckProfilePatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckProfilePatientServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sendId = request.getParameter("sendId");
		
		Guard guard = new GuardAndPatientService().checkGuard(sendId);
		Patient patient = new GuardAndPatientService().checkPatient(sendId);
		
		if(guard.getMemId() != null && patient.getGuard_no() != 0) {
			request.setAttribute("guard", guard);
			request.setAttribute("patient", patient);
			request.getRequestDispatcher("/views/patient/patprofilecheck.jsp").forward(request, response);
			return;
		}else {
			Care care = new CareService().checkCare(sendId);
			PatientWanted patWanted = new CareService().checkPatWanted(sendId); 
			
			request.setAttribute("care", care);
			request.setAttribute("patWnated", patWanted);
			request.getRequestDispatcher("/views/care/careprofilecheck.jsp").forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
