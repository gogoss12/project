package com.care.mvc.match.model.dao;

import static com.care.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
	
import com.care.mvc.member.model.vo.Member;

public class MatchDao {

	public List<Member> searchProfiles(Connection conn, Map<String, String[]> options) {
		List<Member> profiles = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer query = new StringBuffer(
				 "SELECT M.MEM_NAME, M.MEM_ID "
				+ "FROM MEMBER M "
				+ "JOIN CAREGIVER_PROFILE C ON (M.MEM_ID = C.MEM_ID)"
				+ "WHERE M.STATUS = 'Y' AND "
				+ 		"M.MEM_ROLE = 'caregiver' AND "
				+ 		"C.CARE_TIME IN (?time) AND "
				+ 		"C.CARE_GEN IN (?gender) AND "
				+ 		"C.CARE_LICENSE IN (?qual) AND "
				+ 		"C.CARE_YEARS IN (?years) AND "
				+ 		"C.CARE_PLACE IN (?addr) AND "
				+ 		"C.CARE_SAL IN (?pay)");
		
		// ?,?
		
		// 쿼리문에 ? 개수를 맞춘다
        for (Map.Entry<String,String[]> entry : options.entrySet()) {
			// ?000을 ?,?,?... 으로 replace...우선 String[]의 length를 찍는다.
			int length = entry.getValue().length; // ?000을 replace할 ? 개수
			int indexSta = query.indexOf("?" + entry.getKey()); // ?000의 시작인덱스
			int indexEnd = query.lastIndexOf("?" + entry.getKey()); // ?000의 마지막인덱스
			String insert = "";
						
			for (int i = 1; i <= length; i++) { // insert = "?,?...
				insert += "?,";
				
				if (i == length) {
					insert.substring(0, insert.length() - 1); // 마지막 콤마 삭제
				}
			}
			
			query.replace(indexSta, indexEnd, insert); // 쿼리문 ? 개수 수정
        }
        
        
        
		try {
			pstmt = conn.prepareStatement(query.toString()); // toString()
			
	        // 쿼리문의 ?을 실제값으로 대체한다
	        for (Map.Entry<String,String[]> entry : options.entrySet()) {
	    		int count = 1;
	        	String[] arr = entry.getValue();
	        	
	        	for (String str : entry.getValue()) {
					pstmt.setString(count++, str);        		        	        	
				}
	        }
			
	        // 쿼리문 실행
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Member member = new Member(); 
				
				member.setMemName(rs.getString("MEM_NAME"));
				member.setMemId(rs.getString("MEM_ID"));
				
				profiles.add(member);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs); 
			close(pstmt);
		}
		
		System.out.println(profiles);
		
		return profiles;
	}
}
