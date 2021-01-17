package com.care.mvc.care.model.service;

import java.sql.Connection;

import com.care.mvc.care.model.dao.CareDao;
import com.care.mvc.care.model.vo.Care;
import static com.care.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.care.mvc.common.jdbc.JDBCTemplate.commit;
import static com.care.mvc.common.jdbc.JDBCTemplate.rollback;

public class CareService {
	private CareDao dao = new CareDao();

	public int enrollcare(Care care) {
		Connection conn = getConnection();
		
		int result = dao.insertcare(conn, care);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

}
