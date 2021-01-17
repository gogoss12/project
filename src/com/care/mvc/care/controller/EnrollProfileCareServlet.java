package com.care.mvc.care.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.care.mvc.care.model.service.CareService;
import com.care.mvc.care.model.vo.Care;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/enroll/profile/care")
public class EnrollProfileCareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EnrollProfileCareServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		Cookie cookie = new Cookie("userId", request.getParameter("userId")); 
		
		System.out.println("cookie.getName : " + cookie.getName());
		System.out.println(cookie.getValue());
		response.addCookie(cookie);
		
		request.setAttribute("userId", userId);
		request.getRequestDispatcher("/views/care/careProfile.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 파일 업로드 부분 (/upload/carephoto 쪽에 파일이 담기에 하는거 해야함)
//		if(!ServletFileUpload.isMultipartContent(request)) {
//			request.setAttribute("msg", "관리자에게 문의하세요.");
//			request.setAttribute("location", "/enroll/profile/care");
//			
//			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//			
//			return;
//		}
		
		// 나중에 업로드 위치 경로를 바꿔야한다.
//		String path = getServletContext().getRealPath("upload/carephoto");
//		
//		int maxSize = 1024 * 1024 * 10;  // 10mb
//		
//		String encoding = "UTF-8";
//		
//		// 이 아래가 문제 발생
//		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new DefaultFileRenamePolicy());
//		
//		String fileName = mr.getFilesystemName("upfile");
//		String upfileName = mr.getOriginalFileName("upfile");
//		String contentType = mr.getContentType("upfile");
//		
//		// file 찾아보기
//		File file = mr.getFile("upfile");
//		
//		System.out.println("fileName : " + fileName + ", upfileName : " + upfileName + ", contentType : " + contentType);
		
		// 사진 등록 외 나머지 부분
		String msg = "";
		String location = "";
		Care care = new Care();
		
		care.setCareGen(request.getParameter("caregender"));
		care.setCareLicense(request.getParameter("careLicense"));
		care.setCareYears(request.getParameter("careYears"));
		care.setCareHistory(request.getParameter("careHistory"));
		care.setCarePlus(request.getParameter("carePlus"));
		care.setCareTime(request.getParameter("careTime"));
		care.setCarePlace(request.getParameter("carePlace"));
		care.setCareSal(request.getParameter("careSal"));
		care.setCareIntro(request.getParameter("careIntro"));
		care.setMemId(request.getParameter("memId"));
		
		System.out.println(request.getParameter("caregender"));
		System.out.println(care);
		
		int result = new CareService().enrollcare(care);
		
		if(result > 0) {
			msg = "프로필 등록 성공";
			location = "/";
		} else {
			msg = "프로필 등록 실패";
			location = "/enroll/profile/care";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", location);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

}
