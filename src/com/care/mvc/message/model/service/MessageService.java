package com.care.mvc.message.model.service;

import static com.care.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.care.mvc.common.jdbc.JDBCTemplate;
import com.care.mvc.common.util.PageInfo;
import com.care.mvc.message.model.dao.MessageDao;
import com.care.mvc.message.model.vo.ReceiveMessage;
import com.care.mvc.message.model.vo.SendMessage;

public class MessageService {

	public ArrayList<ReceiveMessage> RevListmsg(PageInfo info) {
		
		Connection conn = getConnection();
		
		ArrayList<ReceiveMessage> list = new MessageDao().listRevMsg(conn, info);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public ArrayList<SendMessage> SendListmsg(PageInfo info) {
		Connection conn = getConnection();
		
		ArrayList<SendMessage> list = new MessageDao().listSendMsg(conn, info);
		
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

	public int delRecMsg(String loginMember) {
		Connection conn = getConnection();
		
		int resultDR = new MessageDao().delRecMsg(conn, loginMember);
		
		if(resultDR > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		return resultDR;
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
