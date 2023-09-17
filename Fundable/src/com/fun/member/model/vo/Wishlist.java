package com.fun.member.model.vo;

public class Wishlist {
	
	private int userNo;
	private int productNo;
	private String wStatus;
	
	public Wishlist() {
		
	}

	public Wishlist(int userNo, int productNo, String wStatus) {
		super();
		this.userNo = userNo;
		this.productNo = productNo;
		this.wStatus = wStatus;
	}
	
	public Wishlist(String wStatus) {
		super();
		this.wStatus = wStatus;
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

	public String getwStatus() {
		return wStatus;
	}

	public void setwStatus(String wStatus) {
		this.wStatus = wStatus;
	}

	@Override
	public String toString() {
		return "Wishlist [userNo=" + userNo + ", productNo=" + productNo + ", wStatus=" + wStatus + "]";
	}
	
	
	
}
