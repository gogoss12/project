package com.care.mvc.message.model.service;

import static com.care.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.care.mvc.common.jdbc.JDBCTemplate;
import com.care.mvc.message.model.dao.MessageDao;
import com.care.mvc.message.model.vo.ReceiveMessage;
import com.care.mvc.message.model.vo.SendMessage;

public class MessageService {

	public ArrayList<ReceiveMessage> RevListmsg() {
		
		Connection conn = getConnection();
		
		ArrayList<ReceiveMessage> list = new MessageDao().listRevMsg(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public ArrayList<SendMessage> SendListmsg() {
		Connection conn = getConnection();
		
		ArrayList<SendMessage> list = new MessageDao().listSendMsg(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

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

}
