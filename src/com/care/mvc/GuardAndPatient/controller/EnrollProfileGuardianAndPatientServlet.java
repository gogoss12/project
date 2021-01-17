package com.care.mvc.GuardAndPatient.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.care.mvc.GuardAndPatient.model.service.GuardAndPatientService;
import com.care.mvc.GuardAndPatient.model.vo.Guard;
import com.care.mvc.GuardAndPatient.model.vo.Patient;

@WebServlet("/enroll/profile/guardian")
public class EnrollProfileGuardianAndPatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EnrollProfileGuardianAndPatientServlet() {
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		Cookie cookie = new Cookie("userId", request.getParameter("userId")); 
		
		System.out.println("cookie.getName : " + cookie.getName());
		System.out.println(cookie.getValue());
		response.addCookie(cookie);
		
		request.setAttribute("userId", userId);
		
		request.getRequestDispatcher("/views/patient/patProfile.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String msg = "";
		String loc = "";
		Guard guard = new Guard();
		Patient patient = new Patient();
		
		guard.setGuard_gen(request.getParameter("gender"));
		guard.setGuard_pat(request.getParameter("same"));
		guard.setMemId(request.getParameter("userId"));
		System.out.println(request.getParameter("userId"));
		System.out.println(guard);
		int resultG = new GuardAndPatientService().insertGuard(guard);
		
		
		patient.setPat_place(request.getParameter("place"));
		patient.setPat_period(request.getParameter("period"));
		patient.setPat_hop_time(request.getParameter("hopetime"));
		patient.setPat_name(request.getParameter("patName"));
		patient.setPat_age(Integer.parseInt(request.getParameter("patAge")));
		patient.setPat_gen(request.getParameter("patGen"));
		patient.setPat_kg(Integer.parseInt(request.getParameter("patKg"))); 
		patient.setPat_infect(request.getParameter("patInfact"));// 없음 체크했을때 나머지 disabled 되게끔 만들기
		patient.setPat_grade(request.getParameter("patGrade"));
		patient.setPat_sanit(request.getParameter("patSanit"));
		patient.setPat_paral(request.getParameter("patParal"));
		patient.setPat_move(request.getParameter("patMove"));
		patient.setPat_bed(request.getParameter("patBed"));
		patient.setPat_cogdis(request.getParameter("patCogdis"));
		patient.setPat_bathroom(request.getParameter("patBathroom"));
		patient.setPat_bowel_mn(request.getParameter("patBowelMn"));
		patient.setPat_ostomy(request.getParameter("patOstomy"));
		patient.setPat_help_eat(request.getParameter("patHelpEat"));
		patient.setPat_suction(request.getParameter("patSuction"));
		patient.setPat_guard_gen(request.getParameter("patGuardGen"));
		patient.setPat_etc(request.getParameter("patEtc"));
		
		
		System.out.println(patient);
		
		
		int resultP = new GuardAndPatientService().insertPatient(patient, guard);
		
		if(resultG > 0 && resultP > 0) {
			msg = "보호자 프로필 등록이 완료되었습니다!";
			loc = "/";
		}else {
			msg = "프로필 등록이 실패하였습니다!";
			loc = "/enroll/profile/guardian";
		}
		String same = request.getParameter("same"); // "보호자이자 환자입니다."
		String date = request.getParameter("pat_period"); // 돌봄시작날짜, 돌봄종료날짜
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//		gap.setGuard_pat(request.getParameter("name")); // ???
		
	}
}