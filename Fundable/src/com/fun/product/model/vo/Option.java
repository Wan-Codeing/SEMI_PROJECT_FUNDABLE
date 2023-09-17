package com.fun.product.model.vo;

public class Option {

	private int productNo;
	private int optionNo;
	private String optionName;
	private int optionPrice;
	private String optionDescription;
	
	
	public Option() {
		
	}



	public Option(int productNo, int optionNo, String optionName, int optionPrice) {
		super();
		this.productNo = productNo;
		this.optionNo = optionNo;
		this.optionName = optionName;
		this.optionPrice = optionPrice;
	}
	
	public Option(String optionName, int optionPrice) {
		super();
		this.optionName = optionName;
		this.optionPrice = optionPrice;
	}

	public Option(int optionNo, String optionName, int optionPrice, String optionDescription) {
		super();
		this.optionNo = optionNo;
		this.optionName = optionName;
		this.optionPrice = optionPrice;
		this.optionDescription = optionDescription;
	}

	public String getOptionDescription() {
		return optionDescription;
	}



	public void setOptionDescription(String optionDescription) {
		this.optionDescription = optionDescription;
	}



	public int getProductNo() {
		return productNo;
	}



	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}



	public int getOptionNo() {
		return optionNo;
	}



	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}



	public String getOptionName() {
		return optionName;
	}



	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}



	public int getOptionPrice() {
		return optionPrice;
	}



	public void setOptionPrice(int optionPrice) {
		this.optionPrice = optionPrice;
	}



	@Override
	public String toString() {
		return "Option [productNo=" + productNo + ", optionNo=" + optionNo + ", optionName=" + optionName
				+ ", optionPrice=" + optionPrice + "]";
	}
	
	
	
}
