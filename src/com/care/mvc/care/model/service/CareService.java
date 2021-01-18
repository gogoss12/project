package com.care.mvc.care.model.service;

import java.sql.Connection;

import com.care.mvc.care.model.dao.CareDao;
import com.care.mvc.care.model.vo.Care;
import com.care.mvc.care.model.vo.CareImage;

import static com.care.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.care.mvc.common.jdbc.JDBCTemplate.commit;
import static com.care.mvc.common.jdbc.JDBCTemplate.rollback;

public class CareService {
	private CareDao dao = new CareDao();

	public int enrollcare(Care care, CareImage careImage) {  
		Connection conn = getConnection();
		
		int result = dao.insertcare(conn, care);  
//		int result = 0;  
		
		if(careImage.getImgNo() != 0) {
			result = new CareDao().insertCareImage(conn, careImage);
		} else {
			result = new CareDao().insertcare(conn, care);
		}
		
		int resultI = dao.insertCareImage(conn, careImage);
		
		if(resultI > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return resultI;
	}
	
}
