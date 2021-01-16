package com.care.mvc.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.care.mvc.common.jdbc.JDBCTemplate.close;
import com.care.mvc.member.model.vo.Member;

public class MemberDAO {

	public MemberDAO() {
	}

	public Member findMemberByIdAndPwd(Connection conn,String id, String pwd) {
		Member member = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		try {
			
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE MEM_ID = ? AND MEM_PWD = ? AND STATUS = 'Y'");
			
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				System.out.println(rset.getString("MEM_ID") + ", " + rset.getString("MEM_PWD"));
				member = new Member(
					rset.getString("MEM_ID"),
					rset.getString("MEM_ROLE"),
					rset.getString("MEM_NAME"),
					rset.getString("MEM_PWD"),
					rset.getString("MEM_EMAIL"),
					rset.getInt("MEM_PHONE"), // sql은 number로 되어있는지 확인하고 Member.java도 확인하고 맞워야한다.
					rset.getString("MEM_ADDR"),
					rset.getString("MEM_BIRTH"),
					rset.getDate("CREATE_DATE"),
					rset.getDate("MODIFY_DATE"),
					rset.getString("STATUS")
				);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}








