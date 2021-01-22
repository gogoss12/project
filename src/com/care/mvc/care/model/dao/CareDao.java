package com.care.mvc.care.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.care.mvc.care.model.vo.Care;
import com.care.mvc.care.model.vo.CareImage;
import com.care.mvc.care.model.vo.PatientWanted;
import com.care.mvc.common.jdbc.JDBCTemplate;


public class CareDao {
	
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
	         JDBCTemplate.close(Ipstmt);
	      }
	      
	      return resultI;
	   }
	
	public int insertcare(Connection conn, Care care) {
		int resultC = 0;
		String query = "";
		PreparedStatement pstmt = null;

		try {
			query = "INSERT INTO CAREGIVER_PROFILE VALUES (SEQ_CARE_NO.NEXTVAL-1,?,?,?,?,?,?,?,?,?,?)";
			
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

			resultC = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return resultC;
	}
	
	public int insertcarepatientwanted(Connection conn, PatientWanted patientwanted) {
		   int resultPW = 0;
			String query = "";
			PreparedStatement ppstmt = null;

			try {                   
				query = "INSERT INTO PATIENT_WANTED VALUES (?,SEQ_CARE_NO.NEXTVAL-2,?,?,?)";
				
				ppstmt = conn.prepareStatement(query);

				ppstmt.setString(1, patientwanted.getWantedGrade());
				ppstmt.setString(2, patientwanted.getWantedGen());
				ppstmt.setString(3, patientwanted.getWantedAge());
				ppstmt.setString(4, patientwanted.getWantedIll());
		
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








