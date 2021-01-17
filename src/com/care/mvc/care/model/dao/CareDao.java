package com.care.mvc.care.model.dao;

import static com.care.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.care.mvc.care.model.vo.Care;

public class CareDao {

	public int insertcare(Connection conn, Care care) {
		int result = 0;
		String query = "";
		PreparedStatement pstmt = null;
		
		try {
			query = "INSERT INTO CAREGIVER_PROFILE VALUES (SEQ_CARE_NO.NEXTVAL,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(query);
			
<<<<<<< HEAD
			pstmt.setString(1, care.getCaregen());
=======
			pstmt.setString(1, care.getCareGen());
>>>>>>> 2d5309cf15c38655bc194fb3712f589aec55f5f6
			pstmt.setString(2, care.getCareLicense());
			pstmt.setString(3, care.getCareYears());
			pstmt.setString(4, care.getCareHistory());
			pstmt.setString(5, care.getCarePlus());
			pstmt.setString(6, care.getCareTime());
			pstmt.setString(7, care.getCarePlace());
<<<<<<< HEAD
			pstmt.setInt(8, care.getCareSal());
=======
			pstmt.setString(8, care.getCareSal());
>>>>>>> 2d5309cf15c38655bc194fb3712f589aec55f5f6
			pstmt.setString(9, care.getCareIntro());
			pstmt.setString(10, care.getMemId());
			
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
