package com.care.mvc.GuardAndPatient.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.care.mvc.GuardAndPatient.model.vo.GuardAndPatient;

@WebServlet("/enroll/profile/guardian")
public class EnrollProfileGuardianAndPatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EnrollProfileGuardianAndPatientServlet() {
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/patient/patProfile.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GuardAndPatient gap = new GuardAndPatient();
		
		String same = request.getParameter("same"); // "보호자이자 환자입니다."
		String date = request.getParameter("pat_period"); // 돌봄시작날짜, 돌봄종료날짜
		
		System.out.println("same : " + same + "date : " + date);
		
		gap.setGuard_pat(request.getParameter("name")); // ???
		
	}
}