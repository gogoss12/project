package com.care.mvc.member.model.service;

import java.sql.Connection;

import com.care.mvc.member.model.dao.MemberDao;
import com.care.mvc.member.model.vo.Member;

public class MemberService {
	private MemberDao dao = new MemberDao();	

	public int enrollMember(Member member) {
		Connection conn = getConnection();
		
		int result = dao.insertMember(conn, member);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

}
