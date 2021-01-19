package com.care.mvc.message.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.care.mvc.common.jdbc.JDBCTemplate;
import com.care.mvc.message.model.vo.ReceiveMessage;

public class MessageDao {

	public ArrayList<ReceiveMessage> listAll(Connection conn) {
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

}
