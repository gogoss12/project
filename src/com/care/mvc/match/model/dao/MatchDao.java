package com.care.mvc.match.model.dao;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.care.mvc.care.model.vo.Care;
import com.kh.mvc.board.model.vo.Board;

public class MatchDao {

	public List<Care> searchProfiles(Connection conn) {
		
		List<Care> profiles = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query0 = 
				 "SELECT B.BOARD_NO, "
				+       "B.BOARD_TITLE, "
				+       "M.USER_ID, "
				+       "B.BOARD_CREATE_DATE, "
				+       "B.BOARD_ORIGINAL_FILENAME, "
				+       "B.BOARD_READCOUNT "
				+ "FROM BOARD B JOIN MEMBER M ON(B.BOARD_WRITER_NO = M.USER_NO) "
				+ "WHERE B.STATUS = 'Y' ORDER BY BOARD_NO DESC";
		
		String query1 = 
				 "SELECT B.BOARD_NO, "
				+       "B.BOARD_TITLE, "
				+       "M.USER_ID, "
				+       "B.BOARD_CREATE_DATE, "
				+       "B.BOARD_ORIGINAL_FILENAME, "
				+       "B.BOARD_READCOUNT "
				+ "FROM CAREGIVER_PROFILE"
				+ "WHERE B.STATUS = 'Y' ORDER BY BOARD_NO DESC";

		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Board board = new Board(); 

				// boardWriteNo, boardContent, boardRenamedFileName, status, boardModifyDate 제외
				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setUserId(rs.getString("USER_ID"));
				board.setBoardCreateDate(rs.getDate("BOARD_CREATE_DATE"));
				board.setBoardOriginalFileName(rs.getString("BOARD_ORIGINAL_FILENAME"));
				board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));

				list.add(board);				
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs); // ResultSet을 먼저 닫고
			close(pstmt); // 그다음에 PreparedStatement를 닫는다.
		}
		
		return list;
		
		
		
		
		
		
		
		
		
		
	}
	
}
