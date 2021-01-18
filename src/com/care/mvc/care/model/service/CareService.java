package com.care.mvc.care.model.service;

import static com.care.mvc.common.jdbc.JDBCTemplate.commit;
import static com.care.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.care.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.care.mvc.care.model.dao.CareDao;
import com.care.mvc.care.model.vo.Care;
import com.care.mvc.care.model.vo.CareImage;
import com.care.mvc.care.model.vo.PatientWanted;

public class CareService {

	public int enrollcare(Care care) {  
		Connection conn = getConnection();
		
		int resultC = 0;
		
		resultC = new CareDao().insertcare(conn, care);
		
		
		if(resultC > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return resultC;
	}

	public int insertimage(CareImage careImage) {
		
		Connection conn = getConnection();
		
		int resultI = 0;
		
		resultI = new CareDao().insertCareImage(conn, careImage);
		
		if(resultI > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return resultI;
		
	}

	public int enrollPatientWanted(PatientWanted patientwanted) {
        Connection conn = getConnection();
		
		int resultPW = new CareDao().insertcarepatientwanted(conn, patientwanted);
		
		if(resultPW > 0) {
			commit(conn);        
		} else {
			rollback(conn);
		}
		
		return resultPW;

	}

}
