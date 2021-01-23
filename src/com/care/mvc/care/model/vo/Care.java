package com.care.mvc.care.model.vo;

public class Care {
	private int careNo;
	
	private String careGen;
	
	private String careLicense;
	
	private String careYears;
	
	private String careHistory;
	
	private String carePlus;
	
	private String careTime;
	
	private String carePlace;
	
	private String careSal;
	
	private String careIntro;

	private String memId;
	
	private String memName;
	
	private String memBirth;
		
	public Care() {
	}

	public Care(int careNo, String careGen, String careLicense, String careYears, String careHistory, String carePlus,
			String careTime, String carePlace, String careSal, String careIntro, String memId, String memName, String memBirth) {
		this.careNo = careNo;
		this.careGen = careGen;
		this.careLicense = careLicense;
		this.careYears = careYears;
		this.careHistory = careHistory;
		this.carePlus = carePlus;
		this.careTime = careTime;
		this.carePlace = carePlace;
		this.careSal = careSal;
		this.careIntro = careIntro;
		this.memId = memId;
		this.memName = memName;
		this.memBirth = memBirth;
	}

	public int getCareNo() {
		return careNo;
	}

	public void setCareNo(int careNo) {
		this.careNo = careNo;
	}

	public String getCareGen() {
		return careGen;
	}

	public void setCareGen(String careGen) {
		this.careGen = careGen;
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

	public String getCareSal() {
		return careSal;
	}

	public void setCareSal(String careSal) {
		this.careSal = careSal;
	}

	public String getCareIntro() {
		return careIntro;
	}

	public void setCareIntro(String careIntro) {
		this.careIntro = careIntro;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}

	@Override
	public String toString() {
		return "Care [careNo=" + careNo + ", careGen=" + careGen + ", careLicense=" + careLicense + ", careYears="
				+ careYears + ", careHistory=" + careHistory + ", carePlus=" + carePlus + ", careTime=" + careTime
				+ ", carePlace=" + carePlace + ", careSal=" + careSal + ", careIntro=" + careIntro + ", memId=" + memId
				+ ", memName=" + memName + ", memBirth=" + memBirth + "]";
	}
}
