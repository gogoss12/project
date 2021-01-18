package com.care.mvc.care.model.dao;

import com.care.mvc.common.jdbc.JDBCTemplate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
<<<<<<< HEAD


import com.care.mvc.care.model.vo.Care;
import com.care.mvc.care.model.vo.PatientWanted;



public class CareDao {
	
		private int findCareNo(Connection conn, Care care) {

=======

import com.care.mvc.care.model.vo.Care;
import com.care.mvc.care.model.vo.CareImage;
import com.care.mvc.member.model.vo.Member;

public class CareDao {
	private int findCareNo(Connection conn, Care care) {
>>>>>>> e74aa11ddcc40357ed35481c54fb4c32f4e58b23
		ResultSet rs = null;
		Statement stmt = null;
		String query = "";
		int careNo = 0;
		
		query = "SELECT SEQ_CARE_NO.NEXTVAL FROM DUAL";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				careNo = Integer.parseInt(rs.getString(1)); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
<<<<<<< HEAD
		return careNo;		
	}
	
	
=======
		return careNo;
	}
>>>>>>> e74aa11ddcc40357ed35481c54fb4c32f4e58b23

	public int insertcare(Connection conn, Care care) {
		int resultC = 0;
		String query = "";
		PreparedStatement pstmt = null;
		int careNo = findCareNo(conn, care);

		System.out.println("혹시 시퀀스? " + careNo);
		
		try {
			query = "INSERT INTO CAREGIVER_PROFILE VALUES (SEQ_CARE_NO.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(query);
			
<<<<<<< HEAD

=======
>>>>>>> e74aa11ddcc40357ed35481c54fb4c32f4e58b23
			pstmt.setString(1, care.getCareGen());
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
>>>>>>> e74aa11ddcc40357ed35481c54fb4c32f4e58b23
			pstmt.setString(9, care.getCareIntro());
			pstmt.setString(10, care.getMemId());
			pstmt.setInt(11, care.getCareNo());
			
			resultC = pstmt.executeUpdate();
			
			System.out.println(resultC);
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return resultC;
	}








	public int insertcarepatientwanted(Connection conn, Care care, PatientWanted patientwanted) {
	   int resultPW = 0;
		String query = "";
		PreparedStatement ppstmt = null;
		int careNo = findCareNo(conn, care);
		
		System.out.println("혹시 시퀀스? " + careNo);
		try {                   
			query = "INSERT INTO PATIENT_WANTED_PROFILE VALUES (SEQ_CARE_NO.NEXTVAL,?,?,?,?,?)";
			
			ppstmt = conn.prepareStatement(query);
			

			ppstmt.setString(1, patientwanted.getWantedGen());
			ppstmt.setString(2, patientwanted.getWantedGen());
			ppstmt.setInt(3, patientwanted.getWantedAge());
			ppstmt.setString(4, patientwanted.getWantedIll());
			ppstmt.setInt(4, patientwanted.getWntedcareNo());
			
			
			resultPW = ppstmt.executeUpdate();
			
			System.out.println(resultPW);
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ppstmt);
		}

		return resultPW;
	}	
	}
<<<<<<< HEAD
=======
	
	public int insertCareImage(Connection conn, Care care, CareImage careImage) {
		int resultI = 0;
		PreparedStatement Ipstmt = null;
		int careNo = findCareNo(conn, care);
		
		String CareImageQuery = "INSERT INTO CARE_IMAGE VALUES (SEQ_IMG_NO.NEXTVAL,?,?,?,?)";
		
		System.out.println("확인 중" + careNo);
		
		try {
			Ipstmt = conn.prepareStatement(CareImageQuery);
			
			Ipstmt.setInt(1, careNo - 1);
			Ipstmt.setDate(2, careImage.getImgDate());
//			Ipstmt.setDate(2, member.getCreateDate());
			Ipstmt.setString(3, careImage.getImgPath());
			Ipstmt.setString(4, careImage.getImgNameOrg());
			Ipstmt.setString(5, careImage.getImgNameSav());
			
			resultI = Ipstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return resultI;
	}
	
	
	
	
	
	
}




>>>>>>> e74aa11ddcc40357ed35481c54fb4c32f4e58b23

