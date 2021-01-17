package com.care.mvc.care.model.vo;

public class PatientWanted {
	private int wantedGrade;
	
	private String wantedGen;
	
	private int wantedAge;
	
	private String wantedIll;

	public PatientWanted() {
	}
	
	public PatientWanted(int wantedGrade, String wantedGen, int wantedAge, String wantedIll) {
		this.wantedGrade = wantedGrade;
		this.wantedGen = wantedGen;
		this.wantedAge = wantedAge;
		this.wantedIll = wantedIll;
	}

	public int getWantedGrade() {
		return wantedGrade;
	}

	public void setWantedGrade(int wantedGrade) {
		this.wantedGrade = wantedGrade;
	}

	public String getWantedGen() {
		return wantedGen;
	}

	public void setWantedGen(String wantedGen) {
		this.wantedGen = wantedGen;
	}

	public int getWantedAge() {
		return wantedAge;
	}

	public void setWantedAge(int wantedAge) {
		this.wantedAge = wantedAge;
	}

	public String getWantedIll() {
		return wantedIll;
	}

	public void setWantedIll(String wantedIll) {
		this.wantedIll = wantedIll;
	}


	@Override
	public String toString() {
		return "PatientWanted [wantedGrade=" + wantedGrade + ", wantedGen=" + wantedGen + ", wantedAge=" + wantedAge
				+ ", wantedIll=" + wantedIll + "]";
	}
	
}
