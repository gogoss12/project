package com.care.mvc.message.model.vo;

import java.sql.Date;

public class ReceiveMessage {

	private int rec_no;
	
	private String send_id;
	
	private String rec_body;
	
	private Date rec_date;
	
	private String Mem_id;
	
	
	public ReceiveMessage() {
	}

	public ReceiveMessage(int rec_no, String send_id, String rec_body, Date rec_date, String Mem_id) {
		this.rec_no = rec_no;
		this.send_id = send_id;
		this.rec_body = rec_body;
		this.rec_date = rec_date;
		this.Mem_id = Mem_id;
	}

	public int getRec_no() {
		return rec_no;
	}


	public void setRec_no(int rec_no) {
		this.rec_no = rec_no;
	}


	public String getSend_id() {
		return send_id;
	}


	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}


	public String getRec_body() {
		return rec_body;
	}


	public void setRec_body(String rec_body) {
		this.rec_body = rec_body;
	}


	public Date getRec_date() {
		return rec_date;
	}


	public void setRec_date(Date rec_date) {
		this.rec_date = rec_date;
	}

	public String getMem_id() {
		return Mem_id;
	}

	public void setMem_id(String mem_id) {
		Mem_id = mem_id;
	}

	@Override
	public String toString() {
		return "ReceiveMessage [rec_no=" + rec_no + ", send_id=" + send_id + ", rec_body=" + rec_body + ", rec_date="
				+ rec_date + ", Mem_id=" + Mem_id + "]";
	}

	
}
