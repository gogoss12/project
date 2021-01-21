package com.care.mvc.message.model.service;

import static com.care.mvc.common.jdbc.JDBCTemplate.commit;
import static com.care.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.care.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.care.mvc.common.jdbc.JDBCTemplate;
import com.care.mvc.common.util.PageInfo;
import com.care.mvc.message.model.dao.MessageDao;
import com.care.mvc.message.model.vo.ReceiveMessage;
import com.care.mvc.message.model.vo.ReceiveMessageImg;
import com.care.mvc.message.model.vo.SendMessage;
import com.care.mvc.message.model.vo.SendMessageImg;

public class MessageService {

	public ArrayList<ReceiveMessage> RevListmsg(PageInfo info) {
		
		Connection conn = getConnection();
		
		ArrayList<ReceiveMessage> list = new MessageDao().listRevMsg(conn, info);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	// 받은 메세지 이미지 읽어오기
	public ArrayList<ReceiveMessageImg> RevListmsgImg() {
		Connection conn = getConnection();
		
		ArrayList<ReceiveMessageImg> list = new MessageDao().listRevMsgImg(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public ArrayList<SendMessage> SendListmsg(PageInfo info) {
		Connection conn = getConnection();
		
		ArrayList<SendMessage> list = new MessageDao().listSendMsg(conn, info);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	// 보낸 메세지 이미지 읽어오기
	public ArrayList<SendMessageImg> SendListmsgImg() {
		Connection conn = getConnection();
		
		ArrayList<SendMessageImg> listImg = new MessageDao().listSendMsgImg(conn);
		
		JDBCTemplate.close(conn);
		
		return listImg;
	}

	// 메세지 보내기
	public int sendMsg(SendMessage sendM) {
		
		Connection conn = getConnection();
		
		int resultS = new MessageDao().SendMsg(conn, sendM);
		
		if(resultS > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		return resultS;
	}

	// 메세지 이미지 보내기					// , SendMessage sm
	public int sendImage(SendMessageImg smi, SendMessage sm) {
		
		Connection conn = getConnection();
		
		int resultSI = 0;
														// , sm
		resultSI = new MessageDao().sendMsgImage(conn, smi);
		
		if(resultSI > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return resultSI;
	}
	
	// 메세지 받기
	public int recMsg(ReceiveMessage recM) {
		Connection conn = getConnection();
		
		int resultR = new MessageDao().RecMsg(conn, recM);
		
		if(resultR > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		return resultR;
	}

	// 메세지 이미지 받기
	public int receiveImage(ReceiveMessageImg rmi) {
		Connection conn = getConnection();
		
		int resultRI = new MessageDao().recMsgImage(conn, rmi);
		
		if(resultRI > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return resultRI;
		}

	public int getMsgList() {
		
		Connection conn = getConnection();
		
		int result = new MessageDao().getMsgList(conn);
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int sendMsgList() {
		Connection conn = getConnection();
		
		int result = new MessageDao().sendMsgList(conn);
		
		JDBCTemplate.close(conn);
		
		return result;
	}


	public int deleteRMsg(int recNum) {
		
		Connection conn = getConnection();
		
		int resultR = new MessageDao().deleteRMsg(conn, recNum);
		
		if(resultR > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		return resultR;
	}

	public int deleteSMsg(int sendNum) {
		Connection conn = getConnection();
		
		int resultS = new MessageDao().deleteSMsg(conn, sendNum);
		
		if(resultS > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		return resultS;
	}

}
