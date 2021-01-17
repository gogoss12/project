package com.care.mvc.care.model.dao;

import static com.care.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.care.mvc.care.model.vo.Care;
import com.care.mvc.member.model.vo.Member;

public class CareDao {

	public int insertcare(Connection conn, Care care) {
		int result = 0;
		String query = null;
		PreparedStatement pstmt = null;
		
		try {
			query = "INSERT INTO CAREGIVER_PROFILE VALUES (SEQ_CARE_NO.NEXTVAL,?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, care.getCareLicense());
			pstmt.setString(2, care.getCareYears());
			pstmt.setString(3, care.getCareHistory());
			pstmt.setString(4, care.getCarePlus());
			pstmt.setString(5, care.getCareTime());
			pstmt.setString(6, care.getCarePlace());
			pstmt.setString(7, care.getCareSal());
			pstmt.setString(8, care.getCareIntro());
//			pstmt.setString(9, member.getMemId());
			
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
