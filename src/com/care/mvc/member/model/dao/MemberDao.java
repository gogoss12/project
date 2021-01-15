package com.care.mvc.member.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.care.mvc.member.model.vo.Member;

public class MemberDao {
	public int insertMember(Connection conn, Member member) {
		int result = 0;
		String query = null;
		PreparedStatement pstmt = null;
		
		try {
			// JDBCTemplate 생성 후 삭제
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// JDBCTemplate 생성 후 삭제
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "CARE", "CARE");
			
			// ROLE_USER : 보호자 혹은 요양보호사
			query = "INSERT INTO MEMBER VALUES (?,?,?,?,?,?,?,?,SYSDATE,SYSDATE,DEFAULT)";
			
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, member.getMemId());
			pstmt.setString(2, member.getMemRole());
			pstmt.setString(3, member.getMemName());
			pstmt.setString(4, member.getMemPwd());
			pstmt.setString(5, member.getMemEmail());
			pstmt.setString(6, member.getMemPhone());
			pstmt.setString(7, member.getMemAddr());
			pstmt.setString(7, member.getMemBirth());

			result = pstmt.executeUpdate();
			
			System.out.println(result);
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
}
