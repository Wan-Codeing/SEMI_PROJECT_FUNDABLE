package com.fun.board.model.vo;

import java.sql.Date;

public class Qa {

	private int qaNo;
	private int userNo;
	private String qaTitle;
	private String qaContent;
	private String qaEmail;
	private String qaPhone;
	private Date createDate;
	private String qaStatus;
	private String qaPerson;
	private String userId;
	
	public Qa() {
		
	}
	
	

	public Qa(int qaNo, int userNo, String qaTitle, String qaContent, String qaEmail, String qaPhone, Date createDate,
			String qaStatus, String qaPerson, String userId) {
		super();
		this.qaNo = qaNo;
		this.userNo = userNo;
		this.qaTitle = qaTitle;
		this.qaContent = qaContent;
		this.qaEmail = qaEmail;
		this.qaPhone = qaPhone;
		this.createDate = createDate;
		this.qaStatus = qaStatus;
		this.qaPerson = qaPerson;
		this.userId = userId;
	}



	public Qa(int qaNo, int userNo, String qaTitle, String qaContent, String qaEmail, String qaPhone, Date createDate,
			String qaStatus, String qaPerson) {
		super();
		this.qaNo = qaNo;
		this.userNo = userNo;
		this.qaTitle = qaTitle;
		this.qaContent = qaContent;
		this.qaEmail = qaEmail;
		this.qaPhone = qaPhone;
		this.createDate = createDate;
		this.qaStatus = qaStatus;
		this.qaPerson = qaPerson;
	}

	public Qa(int qaNo, int userNo, String qaTitle, String qaContent, Date createDate, String qaStatus) {
		super();
		this.qaNo = qaNo;
		this.userNo = userNo;
		this.qaTitle = qaTitle;
		this.qaContent = qaContent;
		this.createDate = createDate;
		this.qaStatus = qaStatus;
	}



	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getQaNo() {
		return qaNo;
	}

	public void setQaNo(int qaNo) {
		this.qaNo = qaNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getQaTitle() {
		return qaTitle;
	}

	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}

	public String getQaContent() {
		return qaContent;
	}

	public void setQaContent(String qaContent) {
		this.qaContent = qaContent;
	}

	public String getQaEmail() {
		return qaEmail;
	}

	public void setQaEmail(String qaEmail) {
		this.qaEmail = qaEmail;
	}

	public String getQaPhone() {
		return qaPhone;
	}

	public void setQaPhone(String qaPhone) {
		this.qaPhone = qaPhone;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getQaStatus() {
		return qaStatus;
	}

	public void setQaStatus(String qaStatus) {
		this.qaStatus = qaStatus;
	}

	public String getQaPerson() {
		return qaPerson;
	}

	public void setQaPerson(String qaPerson) {
		this.qaPerson = qaPerson;
	}

	@Override
	public String toString() {
		return "Qa [qaNo=" + qaNo + ", userNo=" + userNo + ", qaTitle=" + qaTitle + ", qaContent=" + qaContent
				+ ", qaEmail=" + qaEmail + ", qaPhone=" + qaPhone + ", createDate=" + createDate + ", qaStatus="
				+ qaStatus + ", qaPerson=" + qaPerson + "]";
	}
	
	
	

	
	
	
	
	
}
