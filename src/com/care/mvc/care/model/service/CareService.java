package com.care.mvc.care.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.care.mvc.care.model.dao.CareDao;
import com.care.mvc.care.model.vo.Care;
<<<<<<< HEAD
import com.care.mvc.care.model.vo.PatientWanted;
=======
import com.care.mvc.care.model.vo.CareImage;
>>>>>>> e74aa11ddcc40357ed35481c54fb4c32f4e58b23

import static com.care.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.care.mvc.common.jdbc.JDBCTemplate.commit;
import static com.care.mvc.common.jdbc.JDBCTemplate.rollback;

public class CareService {
	private CareDao dao = new CareDao();

	public int enrollcare(Care care) {
		Connection conn = getConnection();
		
		int resultC = dao.insertcare(conn, care);
		
		if(resultC > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return resultC;
	}


	public int enrollPatientWanted(Care care, PatientWanted patientwanted) {
        Connection conn = getConnection();
		
		int resultPW = dao.insertcarepatientwanted(conn, care, patientwanted);
		
		if(resultPW > 0) {
			commit(conn);        
		} else {
			rollback(conn);
		}
		
		return resultPW;

	}
	
	public int insertCareImage(Care care, CareImage careImage) {
		Connection conn = getConnection();
		
		int resultI = new CareDao().insertCareImage(conn, care, careImage);
		
		if(resultI > 0) {
			commit(conn);
		} else {
			rollback(conn);
		};
		
		return resultI;
	}

}
