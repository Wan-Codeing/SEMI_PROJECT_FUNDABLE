package com.fun.board.model.vo;

import java.sql.Date;

public class Report {
	
	private int reportNo;
	private int userNo;
	private String userId;
	private String userEmail;
	private String reportTarget;
	private String reportCategory;
	private String reportTitle;
	private Date createDate;
	private String reportContent;
	private String reportStatus;
	
	
	
	public Report() {
		
	}



	public Report(int reportNo, int userNo, String userId, String userEmail, String reportTarget, String reportCategory,
			String reportTitle, Date createDate, String reportContent, String reportStatus) {
		super();
		this.reportNo = reportNo;
		this.userNo = userNo;
		this.userId = userId;
		this.userEmail = userEmail;
		this.reportTarget = reportTarget;
		this.reportCategory = reportCategory;
		this.reportTitle = reportTitle;
		this.createDate = createDate;
		this.reportContent = reportContent;
		this.reportStatus = reportStatus;
	}

	public Report(int reportNo, String userId, String reportTarget, Date createDate, String reportContent,
			String reportStatus, String reportTitle) {
		super();
		this.reportNo = reportNo;
		this.userId = userId;
		this.reportTarget = reportTarget;
		this.createDate = createDate;
		this.reportContent = reportContent;
		this.reportStatus = reportStatus;
		this.reportTitle = reportTitle;
	}



	public int getReportNo() {
		return reportNo;
	}



	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}



	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getUserEmail() {
		return userEmail;
	}



	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}



	public String getReportTarget() {
		return reportTarget;
	}



	public void setReportTarget(String reportTarget) {
		this.reportTarget = reportTarget;
	}



	public String getReportCategory() {
		return reportCategory;
	}



	public void setReportCategory(String reportCategory) {
		this.reportCategory = reportCategory;
	}



	public String getReportTitle() {
		return reportTitle;
	}



	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}



	public Date getCreateDate() {
		return createDate;
	}



	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



	public String getReportContent() {
		return reportContent;
	}



	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}



	public String getReportStatus() {
		return reportStatus;
	}



	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}



	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", userNo=" + userNo + ", userId=" + userId + ", userEmail=" + userEmail
				+ ", reportTarget=" + reportTarget + ", reportCategory=" + reportCategory + ", reportTitle="
				+ reportTitle + ", createDate=" + createDate + ", reportContent=" + reportContent + ", reportStatus="
				+ reportStatus + "]";
	}
	
	


	
	
	
}
