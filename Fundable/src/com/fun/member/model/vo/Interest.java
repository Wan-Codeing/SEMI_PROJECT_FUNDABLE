package com.fun.member.model.vo;

public class Interest {
	private int categoryNo;
	private int userNo;
	private String interStatus;
	
	public Interest() {
		
	}

	public Interest(int categoryNo, int userNo, String interStatus) {
		super();
		this.categoryNo = categoryNo;
		this.userNo = userNo;
		this.interStatus = interStatus;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getInterStatus() {
		return interStatus;
	}

	public void setInterStatus(String interStatus) {
		this.interStatus = interStatus;
	}

	@Override
	public String toString() {
		return "Interest [categoryNo=" + categoryNo + ", userNo=" + userNo + ", interStatus=" + interStatus + "]";
	}
	
	
	
}
