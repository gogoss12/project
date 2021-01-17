package com.care.mvc.GuardAndPatient.model.service;

import static com.care.mvc.common.jdbc.JDBCTemplate.commit;
import static com.care.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.care.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.care.mvc.GuardAndPatient.model.dao.GuardAndPatientDao;
import com.care.mvc.GuardAndPatient.model.vo.Guard;
import com.care.mvc.GuardAndPatient.model.vo.Patient;
import com.care.mvc.common.jdbc.JDBCTemplate;
import com.care.mvc.member.model.vo.Member;

public class GuardAndPatientService {

	

	public int insertGuard(Guard guard) {
		Connection conn = getConnection();
		
		int resultG = new GuardAndPatientDao().insertGuard(conn, guard);
				
		if(resultG > 0) {
			commit(conn);
		}else {
			rollback(conn);
		};
		
		return resultG;
	}

	public int insertPatient(Patient patient, Guard guard) {
		Connection conn = getConnection();
		
		int resultP = new GuardAndPatientDao().insertPatient(conn, patient, guard);
				
		if(resultP > 0) {
			commit(conn);
		}else {
			rollback(conn);
		};
		
		return resultP;
	}


}
