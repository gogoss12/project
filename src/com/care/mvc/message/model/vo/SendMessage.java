package com.care.mvc.message.model.vo;

import java.sql.Date;

public class SendMessage {

	private int send_no;
	
	private int rowNum;
	
	private String rec_id;
	
	private String send_body;
	
	private Date send_date;
	
	private String Mem_id;
	
	
	public SendMessage() {
	}

	public SendMessage(int send_no, int rowNum, String rec_id, String send_body, Date send_date, String mem_id) {
		this.send_no = send_no;
		this.rowNum = rowNum;
		this.rec_id = rec_id;
		this.send_body = send_body;
		this.send_date = send_date;
		this.Mem_id = mem_id;
	}

	public int getSend_no() {
		return send_no;
	}

	public void setSend_no(int send_no) {
		this.send_no = send_no;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public String getRec_id() {
		return rec_id;
	}

	public void setRec_id(String rec_id) {
		this.rec_id = rec_id;
	}

	public String getSend_body() {
		return send_body;
	}

	public void setSend_body(String send_body) {
		this.send_body = send_body;
	}

	public Date getSend_date() {
		return send_date;
	}

	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}

	public String getMem_id() {
		return Mem_id;
	}

	public void setMem_id(String mem_id) {
		Mem_id = mem_id;
	}

	@Override
	public String toString() {
		return "SendMessage [send_no=" + send_no + ", rowNum=" + rowNum + ", rec_id=" + rec_id + ", send_body="
				+ send_body + ", send_date=" + send_date + ", Mem_id=" + Mem_id + "]";
	}
	
}
