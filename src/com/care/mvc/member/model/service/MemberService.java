package com.care.mvc.member.model.service;

import java.sql.Connection;

<<<<<<< HEAD
import com.care.mvc.member.model.dao.MemberDao;
import com.care.mvc.member.model.vo.Member;

import static com.care.mvc.common.jdbc.JDBCTemplate.getConnection;
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

=======
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

	
>>>>>>> 308b6e7e64a26f1a0eeb9faab24deb2267955a67
}
