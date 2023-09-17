package com.fun.product.model.vo;

import java.sql.Date;

public class Product {
	
	private int productNo;
	private int categoryNo;
	private String description;
	private String pTitle;
	private int price;
	private int count;
	private int fundPrice;
	private Date enrollDate;
	private Date openDate;
	private Date endDate;
	private String sellerNickName;
	private String fStatus;
	private String tag;
	private Date sysdate;
	private int total;
	
	
	public Product() {
		
	}

	public Product(int productNo, int categoryNo, String description, String pTitle, int price, int count,
			int fundPrice, Date enrollDate, Date openDate, Date endDate, String fStatus, String tag,
			String sellerNickName) {
		super();
		this.productNo = productNo;
		this.categoryNo = categoryNo;
		this.description = description;
		this.pTitle = pTitle;
		this.price = price;
		this.count = count;
		this.fundPrice = fundPrice;
		this.enrollDate = enrollDate;
		this.openDate = openDate;
		this.endDate = endDate;
		this.fStatus = fStatus;
		this.tag = tag;
		this.sellerNickName = sellerNickName;
	}
	
	public Product(int productNo, int categoryNo, String description, String pTitle, int price, int count,
			int fundPrice, Date enrollDate, Date openDate, Date endDate,String sellerNickName, String fStatus) {
		super();
		this.productNo = productNo;
		this.categoryNo = categoryNo;
		this.description = description;
		this.pTitle = pTitle;
		this.price = price;
		this.count = count;
		this.fundPrice = fundPrice;
		this.enrollDate = enrollDate;
		this.openDate = openDate;
		this.endDate = endDate;
		this.sellerNickName = sellerNickName;
		this.fStatus = fStatus;
	}
	
	
	
	
	public Product(int productNo, String pTitle, int price, int count, int fundPrice) {
		super();
		this.productNo = productNo;
		this.pTitle = pTitle;
		this.price = price;
		this.count = count;
		this.fundPrice = fundPrice;
	}

	public Product(int productNo, int categoryNo, String pTitle, int price, int count, int fundPrice, Date endDate, Date sysdate) {
		super();
		this.productNo = productNo;
		this.categoryNo = categoryNo;
		this.pTitle = pTitle;
		this.price = price;
		this.count = count;
		this.fundPrice = fundPrice;
		this.endDate = endDate;
		this.sysdate = sysdate;
	}
	
	public Product(String pTitle, int price, int count, Date endDate) {
		super();
		this.pTitle = pTitle;
		this.price = price;
		this.count = count;
		this.endDate = endDate;
	}

	public Product(String pTitle, String sellerNickName, int productNo) {
	      super();
	      this.pTitle = pTitle;
	      this.sellerNickName = sellerNickName;
	      this.productNo = productNo;
	}
	
	public Product(String description, String pTitle, int price, int count, int fundPrice,int categoryNo,String sellerNickName,int total , String fStatus) {
		super();
		this.description = description;
		this.pTitle = pTitle;
		this.price = price;
		this.count = count;
		this.fundPrice = fundPrice;
		this.categoryNo = categoryNo;
		this.sellerNickName = sellerNickName;
		this.total= total;
		this.fStatus= fStatus;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Date getSysdate() {
		return sysdate;
	}

	public void setSysdate(Date sysdate) {
		this.sysdate = sysdate;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public int getProductNo() {
		return productNo;
	}


	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}


	public int getCategoryNo() {
		return categoryNo;
	}


	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getpTitle() {
		return pTitle;
	}


	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	
	public String getSellerNickName() {
		return sellerNickName;
	}

	public void setSellerNickName(String sellerNickName) {
		this.sellerNickName = sellerNickName;
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


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public Date getOpenDate() {
		return openDate;
	}


	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}


	public Date getEndDate() {
		return endDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	public String getfStatus() {
		return fStatus;
	}


	public void setfStatus(String fStatus) {
		this.fStatus = fStatus;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", categoryNo=" + categoryNo + ", description=" + description
				+ ", pTitle=" + pTitle + ", price=" + price + ", count=" + count + ", fundPrice=" + fundPrice
				+ ", enrollDate=" + enrollDate + ", openDate=" + openDate + ", endDate=" + endDate + ", sellerNickName="
				+ sellerNickName + ", fStatus=" + fStatus + ", tag=" + tag + ", sysdate=" + sysdate + ", total=" + total
				+ "]";
	}


	
	
	
}
