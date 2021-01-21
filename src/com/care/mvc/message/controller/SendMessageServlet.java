package com.care.mvc.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.care.mvc.member.model.vo.Member;
import com.care.mvc.message.model.service.MessageService;
import com.care.mvc.message.model.vo.SendMessage;
import com.care.mvc.message.model.vo.SendMessageImg;

@WebServlet("/msg/send")
public class SendMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SendMessageServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = "";
		String loc = "";
		HttpSession session = request.getSession(false);
		Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null; 
		// 비로그인시 로그인 페이지로 이동
		if(loginMember != null) {
			ArrayList<SendMessage> list = new MessageService().SendListmsg();
			ArrayList<SendMessageImg> listImg = new MessageService().SendListmsgImg();
			
			request.setAttribute("list", list);
			request.setAttribute("listImg", listImg);
			request.getRequestDispatcher("/views/message/send_message.jsp").forward(request, response);
//			request.getRequestDispatcher("/views/message/send_msg_detail.jsp").forward(request, response);
		}else {
			msg = "로그인이 필요한 페이지입니다.";
			loc = "/member/login";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		// 보낸 쪽지 띄워야한다. (SELECT문으로 가져온다)
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
