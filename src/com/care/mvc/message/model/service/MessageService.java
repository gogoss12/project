package com.care.mvc.message.model.service;

import static com.care.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.care.mvc.common.jdbc.JDBCTemplate;
import com.care.mvc.message.model.dao.MessageDao;
import com.care.mvc.message.model.vo.ReceiveMessage;

public class MessageService {

	public ArrayList<ReceiveMessage> listmsg() {
		
		Connection conn = getConnection();
		
		ArrayList<ReceiveMessage> list = new MessageDao().listAll(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

}
