package com.care.mvc.care.model.dao;

import static com.care.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.care.mvc.care.model.vo.Care;
import com.care.mvc.care.model.vo.CareImage;

public class CareDao {
//	private int findCareNo(Connection conn, Care care) {
//		ResultSet rs = null;
//		Statement stmt = null;
//		String query = "";
//		int careNo = 0;
//		
//		query = "SELECT SEQ_CARE_NO.NEXTVAL FROM DUAL";
//		
//		try {
//			stmt = conn.createStatement();
//			rs = stmt.executeQuery(query);
//			
//			if(rs.next()) {
//				careNo = Integer.parseInt(rs.getString(1)); 
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		return careNo;
//	}

	public int insertcare(Connection conn, Care care) {
		int result = 0;
		String query = "";
		PreparedStatement pstmt = null;
		
		try {
			query = "INSERT INTO CAREGIVER_PROFILE VALUES (SEQ_CARE_NO.NEXTVAL,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, care.getCareGen());
			pstmt.setString(2, care.getCareLicense());
			pstmt.setString(3, care.getCareYears());
			pstmt.setString(4, care.getCareHistory());
			pstmt.setString(5, care.getCarePlus());
			pstmt.setString(6, care.getCareTime());
			pstmt.setString(7, care.getCarePlace());
			pstmt.setString(8, care.getCareSal());
			pstmt.setString(9, care.getCareIntro());
			pstmt.setString(10, care.getMemId());
			
			result = pstmt.executeUpdate();
			
			System.out.println(result);
		
		} catch (SQLException e) {
			e.printStackTrace();
		} 

		return result;
	}
												
	public int insertCareImage(Connection conn, CareImage careImage) {
		int resultI = 0;
		PreparedStatement Ipstmt = null;
		
		
		try {
			String CareImageQuery = "INSERT INTO CARE_IMAGE VALUES (SEQ_IMG_NO.NEXTVAL,SEQ_CARE_NO.NEXTVAL,SYSDATE,?,?,?)";
			
			Ipstmt = conn.prepareStatement(CareImageQuery);
			
			Ipstmt.setString(1, careImage.getImgPath());
			Ipstmt.setString(2, careImage.getImgNameOrg());
			Ipstmt.setString(3, careImage.getImgNameSav());
			
			resultI = Ipstmt.executeUpdate();
			
			System.out.println(resultI);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(Ipstmt);
		}
		
		return resultI;
	}
	
	
}





