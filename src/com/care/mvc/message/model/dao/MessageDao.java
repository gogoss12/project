package com.care.mvc.message.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import com.care.mvc.common.jdbc.JDBCTemplate;
import com.care.mvc.common.util.PageInfo;
import com.care.mvc.message.model.vo.ReceiveMessage;
import com.care.mvc.message.model.vo.SendMessage;

public class MessageDao {

	public ArrayList<ReceiveMessage> listRevMsg(Connection conn, PageInfo info) {
		ArrayList<ReceiveMessage> list = new ArrayList<ReceiveMessage>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT * "
				+ "FROM ("
				+ "    SELECT ROWNUM AS RNUM, REC_NO, SEND_ID , REC_BODY, REC_DATE, MEM_ID"
				+ "    FROM ("
				+ "        SELECT R.REC_NO, R.SEND_ID, R.REC_BODY, R.REC_DATE, M.MEM_ID"
				+ "        FROM REC_MSG R JOIN MEMBER M ON(R.MEM_ID = M.MEM_ID)"
				+ "        ORDER BY R.REC_NO DESC"
				+ "    )"
				+ ") WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, info.getStartList());
			pstmt.setInt(2, info.getEndList());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ReceiveMessage recMsg = new ReceiveMessage();
				
				recMsg.setRec_no(rset.getInt("REC_NO"));
				recMsg.setSend_id(rset.getString("SEND_ID"));
				recMsg.setRowNum(rset.getInt("RNUM"));
				recMsg.setRec_body(rset.getString("REC_BODY"));
				recMsg.setRec_date(rset.getDate("REC_DATE"));
				recMsg.setMem_id(rset.getString("MEM_ID"));
				
				list.add(recMsg);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public ArrayList<SendMessage> listSendMsg(Connection conn, PageInfo info) {
		ArrayList<SendMessage> list = new ArrayList<SendMessage>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT * "
				+ "FROM ("
				+ "    SELECT ROWNUM AS RNUM, SEND_NO, REC_ID , SEND_BODY, SEND_DATE, MEM_ID"
				+ "    FROM ("
				+ "        SELECT S.SEND_NO, S.REC_ID, S.SEND_BODY, S.SEND_DATE, M.MEM_ID"
				+ "        FROM SEND_MSG S JOIN MEMBER M ON(S.MEM_ID = M.MEM_ID)"
				+ "        ORDER BY S.SEND_NO DESC"
				+ "    )"
				+ ") WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, info.getStartList());
			pstmt.setInt(2, info.getEndList());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				SendMessage sendMsg = new SendMessage();
				
				sendMsg.setSend_no(rset.getInt("SEND_NO"));
				sendMsg.setRec_id(rset.getString("REC_ID"));
				sendMsg.setRowNum(rset.getInt("RNUM"));
				sendMsg.setSend_body(rset.getString("SEND_BODY"));
				sendMsg.setSend_date(rset.getDate("SEND_DATE"));
				sendMsg.setMem_id(rset.getString("MEM_ID"));
				
				list.add(sendMsg);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public int SendMsg(Connection conn, SendMessage sendM) {
		int resultS = 0;
		PreparedStatement pstmt = null;
		
		String query = "INSERT INTO SEND_MSG VALUES(SEQ_SEND_NO.NEXTVAL,?,?,SYSDATE,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, sendM.getRec_id());
			pstmt.setString(2, sendM.getSend_body());
			pstmt.setString(3, sendM.getMem_id());
			
			resultS = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return resultS;
	}

	public int RecMsg(Connection conn, ReceiveMessage recM) {
		int resultR = 0;
		PreparedStatement pstmt = null;
		
		String query = "INSERT INTO REC_MSG VALUES(SEQ_REC_NO.NEXTVAL,?,?,SYSDATE,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, recM.getMem_id());
			pstmt.setString(2, recM.getRec_body());
			pstmt.setString(3, recM.getSend_id());
			
			resultR = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return resultR;
	}

	public int getMsgList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "SELECT COUNT(*) FROM REC_MSG";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int sendMsgList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "SELECT COUNT(*) FROM SEND_MSG";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int deleteRMsg(Connection conn, int recNum) {
		int resultR = 0;
		PreparedStatement pstmt = null;
		
		String query ="DELETE FROM REC_MSG WHERE REC_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, recNum);
			
			resultR = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return resultR;
	}

	public int deleteSMsg(Connection conn, int sendNum) {
		int resultS = 0;
		PreparedStatement pstmt = null;
		
		String query ="DELETE FROM SEND_MSG WHERE SEND_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sendNum);
			
			resultS = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return resultS;
	}

}
