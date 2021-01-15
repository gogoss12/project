package com.care.mvc.member.model.service;

import java.sql.Connection;

import com.care.mvc.member.model.dao.MemberDAO;
import com.care.mvc.member.model.vo.Member;

import static com.care.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.care.mvc.common.jdbc.JDBCTemplate.close;

public class MemberService {
	private MemberDAO dao = new MemberDAO();
	
	public Member login(String id, String pwd) {
		Connection conn = getConnection();
		
		Member member = dao.findMemberByIdAndPwd(conn, id, pwd);
		
		close(conn);
		
		
		return member;
		
	}

	
}
