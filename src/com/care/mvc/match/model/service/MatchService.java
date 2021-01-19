package com.care.mvc.match.model.service;

import static com.care.mvc.common.jdbc.JDBCTemplate.close;
import static com.care.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.care.mvc.care.model.vo.Care;
import com.care.mvc.match.model.dao.MatchDao;
import com.kh.mvc.board.model.dao.BoardDAO;
import com.kh.mvc.board.model.vo.Board;

public class MatchService {
	
	// 매칭프로필 리스트 반환
	public List<Care> searchProfiles() {
		Connection conn = getConnection();		
		int result = 0;
		List<Care> profiles = new MatchDao().searchProfiles(conn);
				
		close(conn);
	
		return profiles;
	}
	
}
