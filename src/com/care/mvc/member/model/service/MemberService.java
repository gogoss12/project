package com.care.mvc.member.model.service;

import java.sql.Connection;

import com.care.mvc.member.model.dao.MemberDAO;
import com.care.mvc.member.model.vo.Member;

public class MemberService {
	private MemberDAO DAO = new MemberDAO();
	
	public Member login(String id, String pwd) {
		Connection conn = getConnection();
		
		
		
		return null;
		
	}

	
}
