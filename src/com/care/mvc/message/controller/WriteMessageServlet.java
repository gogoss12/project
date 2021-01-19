package com.care.mvc.message.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.care.mvc.member.model.vo.Member;
import com.care.mvc.message.model.service.MessageService;
import com.care.mvc.message.model.vo.ReceiveMessage;
import com.care.mvc.message.model.vo.SendMessage;

@WebServlet("/msg/write")
public class WriteMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WriteMessageServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = "";
		String loc = "";
		HttpSession session = request.getSession(false);
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		if(loginMember != null) {
			request.getRequestDispatcher("/views/message/write_message.jsp").forward(request, response);
			
		}else {
			msg = "로그인이 필요한 페이지입니다.";
			loc = "/member/login";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String msg = "";
			String loc = "";
			SendMessage sendM = new SendMessage();
			HttpSession session = request.getSession(false);
			Member loginMember = (Member)session.getAttribute("loginMember");
		
			int resultS = 0;
			// 메세지 보내기
			sendM.setRec_id(request.getParameter("rev_id"));
			sendM.setSend_body(request.getParameter("msg_contents"));
			sendM.setMem_id(loginMember.getMemId());
			System.out.println(sendM);
			System.out.println(loginMember.getMemId());
			
			resultS = new MessageService().sendMsg(sendM);
			
			//-----------------------------------------------------------------
			// 메세지 받기
			int resultR = 0;
			ReceiveMessage recM = new ReceiveMessage();
			
			recM.setSend_id(request.getParameter("rev_id"));
			recM.setRec_body(request.getParameter("msg_contents"));
			recM.setMem_id(loginMember.getMemId());
			
			resultR = new MessageService().recMsg(recM);
			
			if(resultS > 0 && resultR > 0) {
				msg = "메세지를 성공적으로 보냈습니다.";
				loc = "/msg/write";
			}else {
				msg = "메세지 보내기 실패(잘못된 아이디 입니다)!";
				loc = "/msg/write";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}
}
