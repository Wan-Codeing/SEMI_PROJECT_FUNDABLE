package com.fun.board.model.vo;

import java.sql.Date;

public class Notification {
	
	private int userNo;
	private int productNo;
	private Date nfDate;
	private String nfStatus;
	
	
	
	
	public Notification() {
		
	}




	public Notification(int userNo, int productNo, Date nfDate, String nfStatus) {
		super();
		this.userNo = userNo;
		this.productNo = productNo;
		this.nfDate = nfDate;
		this.nfStatus = nfStatus;
	}




	public int getUserNo() {
		return userNo;
	}




	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}




	public int getProductNo() {
		return productNo;
	}




	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}




	public Date getNfDate() {
		return nfDate;
	}




	public void setNfDate(Date nfDate) {
		this.nfDate = nfDate;
	}




	public String getNfStatus() {
		return nfStatus;
	}




	public void setNfStatus(String nfStatus) {
		this.nfStatus = nfStatus;
	}




	@Override
	public String toString() {
		return "Notification [userNo=" + userNo + ", productNo=" + productNo + ", nfDate=" + nfDate + ", nfStatus="
				+ nfStatus + "]";
	}
	
	
	
	
	
	
}
