package com.care.mvc.match.model.service;

import static com.care.mvc.common.jdbc.JDBCTemplate.close;
import static com.care.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.care.mvc.match.model.dao.MatchDao;
import com.care.mvc.member.model.vo.Member;

public class MatchService {
	
	// 매칭프로필 리스트 반환
	public List<Member> searchProfiles(Map<String, String[]> options) {
		Connection conn = getConnection();		
		
		List<Member> profiles = new MatchDao().searchProfiles(conn, options);
				
		close(conn);

		return profiles;
	}
	
}
