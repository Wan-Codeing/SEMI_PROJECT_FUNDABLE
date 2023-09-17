package com.fun.member.model.vo;

import java.sql.Date;

public class Pay {
	
	private int orederNo;
	private int userNo;
	private int productNo;
	private String productTitle;
	private int optionNo;
	private int totalPrice;
	private int count;
	private Date fundingDate;
	private String fStatus;
	private String sellerNickName;
	private String dStatus;
	private String rStatus;
	private String userName;
	private String userAddress;
	private String userId;
	private String optionName;
	private Date endDate;
	
	public Pay() {
		
	}

	public Pay(int productNo,String productTitle ,int totalPrice, Date fundingDate, String rStatus, String userName, String userAddress, String dStatus) {
		super();
		this.productNo = productNo;
		this.productTitle = productTitle;
		this.totalPrice = totalPrice;
		this.fundingDate = fundingDate;
		this.rStatus = rStatus;
		this.userName = userName;
		this.userAddress = userAddress;
		this.dStatus = dStatus;
	}
	
	public Pay(int orederNo, int userNo, int productNo, String productTitle, int optionNo, int totalPrice, int count,
			Date fundingDate, String fStatus,String sellerNickName ,String dStatus, String rStatus) {
		super();
		this.orederNo = orederNo;
		this.userNo = userNo;
		this.productNo = productNo;
		this.productTitle = productTitle;
		this.optionNo = optionNo;
		this.totalPrice = totalPrice;
		this.count = count;
		this.fundingDate = fundingDate;
		this.fStatus = fStatus;
		this.sellerNickName = sellerNickName;
		this.dStatus = dStatus;
		this.rStatus = rStatus;
	}
	
	public Pay(int orederNo, int userNo, int productNo, String productTitle, int optionNo, int totalPrice, int count, Date fundingDate, String fStatus, String sellerNickName, String dStatus, String rStatus, String userId, String userName) {
		this.orederNo = orederNo;
		this.userNo = userNo;
		this.productNo = productNo;
		this.productTitle = productTitle;
		this.optionNo = optionNo;
		this.totalPrice = totalPrice;
		this.count = count;
		this.fundingDate = fundingDate;
		this.fStatus = fStatus;
		this.sellerNickName = sellerNickName;
		this.dStatus = dStatus;
		this.rStatus = rStatus;
		this.userId = userId;
		this.userName = userName;
	}

	public Pay(String productTitle, int orederNo, Date fundingDate, String rStatus, String dStatus, String userId, String userName) {
		this.productTitle = productTitle;
		this.orederNo = orederNo;
		this.fundingDate = fundingDate;
		this.rStatus = rStatus;
		this.dStatus = dStatus;
		this.userId = userId;
		this.userName = userName;
	}

	public Pay(int orederNo, int userNo, int productNo, String productTitle, int count, Date fundingDate, String fStatus, String dStatus, int optionNo, String rStatus, int totalPrice) {
		this.orederNo = orederNo;
		this.userNo = userNo;
		this.productNo = productNo;
		this.productTitle = productTitle;
		this.count = count;
		this.fundingDate = fundingDate;
		this.fStatus = fStatus;
		this.dStatus = dStatus;
		this.optionNo = optionNo;
		this.rStatus = rStatus;
		this.totalPrice = totalPrice;
	}
	
	public Pay(int orederNo,int productNo ,String productTitle, String optionName ,int totalPrice, Date fundingDate, String fStatus,
	         String sellerNickName, String dStatus, String rStatus, Date endDate) {
	      super();
	      this.orederNo = orederNo;
	      this.productNo = productNo;
	      this.productTitle = productTitle;
	      this.optionName = optionName;
	      this.totalPrice = totalPrice;
	      this.fundingDate = fundingDate;
	      this.fStatus = fStatus;
	      this.sellerNickName = sellerNickName;
	      this.dStatus = dStatus;
	      this.rStatus = rStatus;
	      this.endDate = endDate;
	}

	

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public int getOrederNo() {
		return orederNo;
	}

	public void setOrederNo(int orederNo) {
		this.orederNo = orederNo;
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

	public String getProductTitle() {
		return productTitle;
	}

	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}
	
	
	public String getSellerNickName() {
		return sellerNickName;
	}

	public void setSellerNickName(String sellerNickName) {
		this.sellerNickName = sellerNickName;
	}
	
	

	public int getOptionNo() {
		return optionNo;
	}

	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getFundingDate() {
		return fundingDate;
	}

	public void setFundingDate(Date fundingDate) {
		this.fundingDate = fundingDate;
	}

	public String getfStatus() {
		return fStatus;
	}

	public void setfStatus(String fStatus) {
		this.fStatus = fStatus;
	}

	public String getdStatus() {
		return dStatus;
	}

	public void setdStatus(String dStatus) {
		this.dStatus = dStatus;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Pay [orederNo=" + orederNo + ", userNo=" + userNo + ", productNo=" + productNo + ", productTitle="
				+ productTitle + ", optionNo=" + optionNo + ", totalPrice=" + totalPrice + ", count=" + count
				+ ", fundingDate=" + fundingDate + ", fStatus=" + fStatus + ", sellerNickName=" + sellerNickName
				+ ", dStatus=" + dStatus + ", rStatus=" + rStatus + ", userName=" + userName + ", userAddress="
				+ userAddress + ", userId=" + userId + "]";
	}

}
