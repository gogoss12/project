package com.care.mvc.message.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.care.mvc.common.jdbc.JDBCTemplate;
import com.care.mvc.message.model.vo.ReceiveMessage;
import com.care.mvc.message.model.vo.ReceiveMessageImg;
import com.care.mvc.message.model.vo.SendMessage;
import com.care.mvc.message.model.vo.SendMessageImg;

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
	
	public ArrayList<ReceiveMessageImg> listRevMsgImg(Connection conn) {
		ArrayList<ReceiveMessageImg> list = new ArrayList<ReceiveMessageImg>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT REC_IMG_PATH, REC_IMG_NAME_ORG, REC_IMG_NAME_SAV, REC_NO "
				+ "FROM REC_IMAGE ORDER BY REC_IMG_NO DESC"; // 순서는 REC_NO 해도 상관없을거같다
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				ReceiveMessageImg recMsgImg = new ReceiveMessageImg();
				
				recMsgImg.setRec_img_path(rset.getString("REC_IMG_PATH"));
				recMsgImg.setRec_img_name_org(rset.getString("REC_IMG_PATH"));
				recMsgImg.setRec_img_name_sav(rset.getString("REC_IMG_PATH"));
				recMsgImg.setRec_no(rset.getInt("REC_NO"));
				
				list.add(recMsgImg);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public ArrayList<SendMessage> listSendMsg(Connection conn) {
		ArrayList<SendMessage> list = new ArrayList<SendMessage>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT SEND_NO, REC_ID, SEND_BODY, SEND_DATE, MEM_ID FROM SEND_MSG ORDER BY SEND_NO DESC";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				SendMessage sendMsg = new SendMessage();
				
				sendMsg.setSend_no(rset.getInt("SEND_NO"));
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
	
	public int sendMsgImage(Connection conn, SendMessageImg smi, SendMessage sm) {
	      int resultI = 0;
	      PreparedStatement Ipstmt = null;
	      
	      try {
	         String sendMsgImg = "INSERT INTO SEND_IMAGE VALUES (SEQ_SEND_IMAGE_NO.NEXTVAL,?,?,?,?)";
	         
	         Ipstmt = conn.prepareStatement(sendMsgImg);
	         
	         Ipstmt.setString(1, smi.getSend_img_path());
	         Ipstmt.setString(2, smi.getSend_img_name_org());
	         Ipstmt.setString(3, smi.getSend_img_name_sav());
	         Ipstmt.setInt(4, sm.getSend_no());  // 현재 0번으로 뜸, 숫자뜨면 지워줘!
	         
	         resultI = Ipstmt.executeUpdate();
	         
	         System.out.println(resultI);
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         JDBCTemplate.close(Ipstmt);
	      }
	      
	      return resultI;
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
	
	public int recMsgImage(Connection conn, ReceiveMessageImg rmi) {
		int resultRI = 0;
		PreparedStatement Ipstmt = null;
		
		String query = "INSERT INTO REC_IMAGE VALUES (SEQ_REC_IMAGE_NO.NEXTVAL,?,?,?,SEQ_REC_NO.NEXTVAL-1)";
		
		try {
			Ipstmt = conn.prepareStatement(query);
			
			 Ipstmt.setString(1, rmi.getRec_img_path());
	         Ipstmt.setString(2, rmi.getRec_img_name_org());
	         Ipstmt.setString(3, rmi.getRec_img_name_sav());
			
	         resultRI = Ipstmt.executeUpdate();
	         
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return resultRI;
	}

}
