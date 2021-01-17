package com.care.mvc.GuardAndPatient.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.care.mvc.GuardAndPatient.model.vo.Guard;
import com.care.mvc.GuardAndPatient.model.vo.Patient;
import com.care.mvc.common.jdbc.JDBCTemplate;
import com.care.mvc.member.model.vo.Member;

public class GuardAndPatientDao {
	
	private int findGuardNo(Connection conn, Guard guard) {
		ResultSet rs = null;
		Statement stmt = null;
		String query = "";
		int guardNo = 0;
		
		query = "SELECT SEQ_GUARD_NO.NEXTVAL FROM DUAL";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				guardNo = Integer.parseInt(rs.getString(1)); // 멤버변수
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return guardNo;		
	}
	
	public int insertGuard(Connection conn, Guard guard) {
		int resultG = 0;
		PreparedStatement GPstmt = null;
		String GuardQuery = "INSERT INTO GUARDIAN_PROFILE VALUES(?, ?, ?, ?)";
		int guardNo = findGuardNo(conn, guard);

		System.out.println("혹시 시퀀스? " + guardNo);
		
		try {
			GPstmt = conn.prepareStatement(GuardQuery);

			GPstmt.setInt(1, guardNo);
			GPstmt.setString(2, guard.getGuard_gen());
			GPstmt.setString(3, guard.getGuard_pat());
			GPstmt.setString(4, guard.getMemId()); // memId 가 null...

			resultG = GPstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(GPstmt);
		}
		return resultG;
	}

	public int insertPatient(Connection conn, Patient patient, Guard guard) {
		int resultP = 0;
		PreparedStatement PPstmt = null;
		int guardNo = findGuardNo(conn, guard);

//		String PatientQuery = "INSERT INTO PATIENT_DETAILS VALUES(SEQ_PAT_NO.NEXTVAL,SEQ_GUARD_NO.NEXTVAL,"
//				+ "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		String PatientQuery = "INSERT INTO PATIENT_DETAILS VALUES(SEQ_PAT_NO.NEXTVAL,"
				+ "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			PPstmt = conn.prepareStatement(PatientQuery);

			PPstmt.setInt(1, guardNo-1);
			PPstmt.setString(2, patient.getPat_place());
			PPstmt.setString(3, patient.getPat_period());
			PPstmt.setString(4, patient.getPat_hop_time());
			PPstmt.setString(5, patient.getPat_name());
			PPstmt.setInt(6, patient.getPat_age());
			PPstmt.setString(7, patient.getPat_gen());
			PPstmt.setInt(8, patient.getPat_kg());
			PPstmt.setString(9, patient.getPat_infect());
			PPstmt.setString(10, patient.getPat_grade());
			PPstmt.setString(11, patient.getPat_sanit());
			PPstmt.setString(12, patient.getPat_paral());
			PPstmt.setString(13, patient.getPat_move());
			PPstmt.setString(14, patient.getPat_bed());
			PPstmt.setString(15, patient.getPat_cogdis());
			PPstmt.setString(16, patient.getPat_bathroom());
			PPstmt.setString(17, patient.getPat_bowel_mn());
			PPstmt.setString(18, patient.getPat_ostomy());
			PPstmt.setString(19, patient.getPat_help_eat());
			PPstmt.setString(20, patient.getPat_suction());
			PPstmt.setString(21, patient.getPat_guard_gen());
			PPstmt.setString(22, patient.getPat_etc());

			resultP = PPstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(PPstmt);
		}

		return resultP;
	}

}
