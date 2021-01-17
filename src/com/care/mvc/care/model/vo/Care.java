package com.care.mvc.care.model.vo;

public class Care {
	private int careNo;
	
	private String careLicense;
	
	private String caregen;
	
	private String careYears;
	
	private String careHistory;
	
	private String carePlus;
	
	private String careTime;
	
	private String carePlace;
	
	private int careSal;
	
	private String careIntro;
	
	private String MemId;
	public Care() {
	}
	
	public Care(int careNo,  String caregen, String careLicense, String careYears, String careHistory, String carePlus, String careTime,
			String carePlace, int careSal, String careIntro, String MemId) {
		this.careNo = careNo;
		this.caregen = caregen;
		this.careLicense = careLicense;
		this.careYears = careYears;
		this.careHistory = careHistory;
		this.carePlus = carePlus;
		this.careTime = careTime;
		this.carePlace = carePlace;
		this.careSal = careSal;
		this.careIntro = careIntro;
		this.MemId = MemId;
	}

	public int getCareNo() {
		return careNo;
	}

	public void setCareNo(int careNo) {
		this.careNo = careNo;
	}
	
	

	public String getCaregen() {
		return caregen;
	}

	public void setCaregen(String caregen) {
		this.caregen = caregen;
	}

	public String getCareLicense() {
		return careLicense;
	}

	public void setCareLicense(String careLicense) {
		this.careLicense = careLicense;
	}

	public String getCareYears() {
		return careYears;
	}

	public void setCareYears(String careYears) {
		this.careYears = careYears;
	}

	public String getCareHistory() {
		return careHistory;
	}

	public void setCareHistory(String careHistory) {
		this.careHistory = careHistory;
	}

	public String getCarePlus() {
		return carePlus;
	}

	public void setCarePlus(String carePlus) {
		this.carePlus = carePlus;
	}

	public String getCareTime() {
		return careTime;
	}

	public void setCareTime(String careTime) {
		this.careTime = careTime;
	}

	public String getCarePlace() {
		return carePlace;
	}

	public void setCarePlace(String carePlace) {
		this.carePlace = carePlace;
	}

	public int getCareSal() {
		return careSal;
	}

	public void setCareSal(int careSal) {
		this.careSal = careSal;
	}

	public String getCareIntro() {
		return careIntro;
	}

	public void setCareIntro(String careIntro) {
		this.careIntro = careIntro;
	}
	

	public String getMemId() {
		return MemId;
	}

	public void setMemId(String memId) {
		MemId = memId;
	}

	@Override
	public String toString() {
		return "Care [careNo=" + careNo + ", careLicense=" + careLicense + ", caregen=" + caregen + ", careYears="
				+ careYears + ", careHistory=" + careHistory + ", carePlus=" + carePlus + ", careTime=" + careTime
				+ ", carePlace=" + carePlace + ", careSal=" + careSal + ", careIntro=" + careIntro + ", MemId=" + MemId
				+ "]";
	}

	
}
