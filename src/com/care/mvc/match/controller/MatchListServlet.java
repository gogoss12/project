package com.care.mvc.match.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.care.mvc.member.model.vo.Member;

@WebServlet("/match/list")
public class MatchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MatchListServlet() {
    }

    // doGET() 필요없을수도...
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/match/list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
