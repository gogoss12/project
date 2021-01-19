package com.care.mvc.message.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.care.mvc.common.jdbc.JDBCTemplate;
import com.care.mvc.message.model.vo.ReceiveMessage;
import com.care.mvc.message.model.vo.SendMessage;

public class MessageDao {

	public ArrayList<ReceiveMessage> listRevMsg(Connection conn) {
		ArrayList<ReceiveMessage> list = new ArrayList<ReceiveMessage>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT SEND_ID, REC_BODY, REC_DATE, MEM_ID FROM REC_MSG ORDER BY REC_NO DESC";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ReceiveMessage recMsg = new ReceiveMessage();
				
				recMsg.setSend_id(rset.getString("SEND_ID"));
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

	public ArrayList<SendMessage> listSendMsg(Connection conn) {
		ArrayList<SendMessage> list = new ArrayList<SendMessage>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT REC_ID, SEND_BODY, SEND_DATE, MEM_ID FROM SEND_MSG ORDER BY SEND_NO DESC";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				SendMessage sendMsg = new SendMessage();
				
				sendMsg.setRec_id(rset.getString("REC_ID"));
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

}
