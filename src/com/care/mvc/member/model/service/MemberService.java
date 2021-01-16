package com.care.mvc.member.model.service;

import java.sql.Connection;


import com.care.mvc.member.model.dao.MemberDao;
import com.care.mvc.member.model.vo.Member;
import static com.care.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.care.mvc.common.jdbc.JDBCTemplate.close;
import static com.care.mvc.common.jdbc.JDBCTemplate.commit;
import static com.care.mvc.common.jdbc.JDBCTemplate.rollback;

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

	
	public Member login(String id, String pwd) {
		Connection conn = getConnection();
		
		Member member = dao.findMemberByIdAndPwd(conn, id, pwd);
		
		close(conn);
		
		return member;

	}
}
