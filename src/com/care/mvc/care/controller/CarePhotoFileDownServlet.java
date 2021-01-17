package com.care.mvc.care.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/care/fileDown")
public class CarePhotoFileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CarePhotoFileDownServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		// 프로필 등록을 하고나서 마이페이지 프로필에서 다운을 받을 수 있다
//		String oriname = request.getParameter("oriname");
//		String rename = request.getParameter("rename");
//
//		System.out.println("oriname : " + oriname + ", rename : " + rename);
//		
//		// 1. 전송할 파일에 대한 경로와 파일명을 가져온다.
//		String path = getServletContext().getRealPath("upload/carephoto");
//		String file = path + "/" + rename;
//		
//		// 2. 물리적인 저장소에 있는 파일을 메모리로 가져온다.
//		File downFile = new File(file);
//		
//		// 3. 메모리로 가져온 파일에 입력(Input) 스트림 연결
//		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(downFile));
//		
//		// 4. 클라이언트로 내보낼 출력 스트림 연결
//		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
//		
//		// 5. 브라우저별 인코딩 처리
//		// * 브라우저에 따라서 인코딩 방식이 다르기 때문에 파일명에 대한 이코딩 처리를 해야한다.
//		String downName = null;
//		String header = request.getHeader("user-agent");
//		
//		boolean isMSIE = header.indexOf("MSIE") != -1 || header.indexOf("Trident") != -1;
//		
//		System.out.println(header);
//		
//		if(isMSIE) {
//			downName = URLEncoder.encode(oriname, "UTF-8").replaceAll("\\+", "%20");   // %20는 공백
//			
//		} else {
//			downName = new String(oriname.getBytes("UTF-8"), "ISO-8859-1");  // 이걸로 인코딩 된다.
//			
//		}
//		
//		// 응답 메세지 작성
//		// html이 아니라 file을 보내려면 응답해주는 헤더쪽이 바뀌어야한다.
//		// octet-stream은 8비트로 된 데이터를 뜻하며, 지정되지 않은 파일 형식을 의미한다.
//		response.setContentType("application/octet-stream");
//		
//		response.setHeader("Content-Disposition", "attachment;filename=" + downName);
//		
//		// 실제 파일 출력(전송)하기
//		int read = -1;
//		
//		while ((read = bis.read()) != -1) {
//			bos.write(read);
//		}
//		
//		bos.close();
//		bis.close();
	}

}
