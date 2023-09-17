package com.fun.product.model.vo;

public class Category {
	
	private int categoryNo;
	private String category;
	
	
	public Category(int categoryNo, String category) {
		super();
		this.categoryNo = categoryNo;
		this.category = category;
	}
	@Override
	public String toString() {
		return "Category [categoryNo=" + categoryNo + ", category=" + category + "]";
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

	
	
	
	
	
	
	
	
	
}
