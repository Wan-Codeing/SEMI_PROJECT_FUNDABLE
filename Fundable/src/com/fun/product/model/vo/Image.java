package com.fun.product.model.vo;

import java.sql.Date;

public class Image {
	
	private int fileNo;
	private int productNo;
	private int userNo;
	private String originName;
	private String changeName;
	private int fileSize;
	private int fileLevel;
	private Date uploadDate;
	private String filePath;
	private String status;
	private String productTitle;
	private int price;
	private int count;
	private int fundPrice;
	
	public Image() {
		
	}

	public Image(int productNo, int userNo, String changeName, String filePath, String status, String productTitle) {
	      super();
	      this.productNo = productNo;
	      this.userNo = userNo;
	      this.changeName = changeName;
	      this.filePath = filePath;
	      this.status = status;
	      this.productTitle = productTitle;
	}
	
	public Image(int fileNo, int productNo, String changeName, String filePath, String productTitle) {
	      super();
	      this.fileNo = fileNo;
	      this.productNo = productNo;
	      this.changeName = changeName;
	      this.filePath = filePath;
	      this.productTitle = productTitle;
	 }



	public Image(int fileNo, int productNo, int userNo,String originName, String changeName, int fileSize, int fileLevel,
			Date uploadDate, String filePath, String status) {
		super();
		this.fileNo = fileNo;
		this.productNo = productNo;
		this.originName = originName;
		this.changeName = changeName;
		this.fileSize = fileSize;
		this.fileLevel = fileLevel;
		this.uploadDate = uploadDate;
		this.filePath = filePath;
		this.status = status;
	}


	public Image(String changeName, String filePath, String productTitle, int price, int count, int fundPrice, int productNo) {
		super();
		this.changeName = changeName;
		this.filePath = filePath;
		this.productTitle = productTitle;
		this.price = price;
		this.count = count;
		this.fundPrice = fundPrice;
		this.productNo = productNo;
	}
	
	public Image(int productNo, String filePath, String productTitle, int price, int count, int fundPrice, String changeName ) {
		super();
		this.changeName = changeName;
		this.filePath = filePath;
		this.productTitle = productTitle;
		this.price = price;
		this.count = count;
		this.fundPrice = fundPrice;
		this.productNo = productNo;
	}


//	public Image(String originName, String filePath) {
//		super();
//		this.originName = originName;
//		this.filePath = filePath;
//	}

	public Image(String changeName, String filePath) {
		super();
		this.changeName = changeName;
		this.filePath = filePath;
	}

	public Image(int productNo, String changeName, String filePath) {
	super();
	this.productNo = productNo;
	this.changeName = changeName;
	this.filePath = filePath;
}


	public Image(int productNo, String changeName, String filePath, String productTitle) {
		super();
		this.productNo = productNo;
		this.changeName = changeName;
		this.filePath = filePath;
		this.productTitle = productTitle;
	}

	public Image(String changeName, String filePath, String productTitle) {
		super();
		this.changeName = changeName;
		this.filePath = filePath;
		this.productTitle = productTitle;
	}




	public String getProductTitle() {
		return productTitle;
	}




	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}

	


	public int getPrice() {
		return price;
	}




	public void setPrice(int price) {
		this.price = price;
	}




	public int getCount() {
		return count;
	}




	public void setCount(int count) {
		this.count = count;
	}




	public int getFundPrice() {
		return fundPrice;
	}




	public void setFundPrice(int fundPrice) {
		this.fundPrice = fundPrice;
	}




	public int getFileNo() {
		return fileNo;
	}




	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}




	public int getProductNo() {
		return productNo;
	}




	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	
	public int getUserNo() {
		return userNo;
	}




	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getOriginName() {
		return originName;
	}




	public void setOriginName(String originName) {
		this.originName = originName;
	}




	public String getChangeName() {
		return changeName;
	}




	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}




	public int getFileSize() {
		return fileSize;
	}




	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}




	public int getFileLevel() {
		return fileLevel;
	}




	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}




	public Date getUploadDate() {
		return uploadDate;
	}




	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}




	public String getFilePath() {
		return filePath;
	}




	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}




	public String getStatus() {
		return status;
	}




	public void setStatus(String status) {
		this.status = status;
	}




	@Override
	public String toString() {
		return "Image [fileNo=" + fileNo + ", productNo=" + productNo + ", userNo=" + userNo + ", originName="
				+ originName + ", changeName=" + changeName + ", fileSize=" + fileSize + ", fileLevel=" + fileLevel
				+ ", uploadDate=" + uploadDate + ", filePath=" + filePath + ", status=" + status + ", productTitle="
				+ productTitle + ", price=" + price + ", count=" + count + ", fundPrice=" + fundPrice + "]";
	}




	
	
	
	
}
