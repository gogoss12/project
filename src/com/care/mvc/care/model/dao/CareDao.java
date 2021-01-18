package com.care.mvc.care.model.dao;

import com.care.mvc.common.jdbc.JDBCTemplate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import com.care.mvc.care.model.vo.Care;
import com.care.mvc.care.model.vo.PatientWanted;



public class CareDao {
	
		private int findCareNo(Connection conn, Care care) {

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
		
		return careNo;		
	}
	
	

	public int insertcare(Connection conn, Care care) {
		int resultC = 0;
		String query = "";
		PreparedStatement pstmt = null;
		int careNo = findCareNo(conn, care);

		System.out.println("혹시 시퀀스? " + careNo);
		
		try {
			query = "INSERT INTO CAREGIVER_PROFILE VALUES (SEQ_CARE_NO.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(query);
			

			pstmt.setString(1, care.getCareGen());
			pstmt.setString(2, care.getCareLicense());
			pstmt.setString(3, care.getCareYears());
			pstmt.setString(4, care.getCareHistory());
			pstmt.setString(5, care.getCarePlus());
			pstmt.setString(6, care.getCareTime());
			pstmt.setString(7, care.getCarePlace());
			pstmt.setInt(8, care.getCareSal());
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

