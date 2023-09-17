package com.fun.member.model.vo;

import java.io.File;

public class Seller {
	
	private int userNo;
	private String sellerNickName;
	private String sellerAccount;
	private String bStatus;
	private File file;
	private String profileImg;
	
	public Seller() {
		
	}

	public Seller(int userNo, String sellerNickName, String sellerAccount, String bStatus, File file,
			String profileImg) {
		super();
		this.userNo = userNo;
		this.sellerNickName = sellerNickName;
		this.sellerAccount = sellerAccount;
		this.bStatus = bStatus;
		this.file = file;
		this.profileImg = profileImg;
	}

	public Seller(String sellerNickName, String profileImg) {
		super();
		this.sellerNickName = sellerNickName;
		this.profileImg = profileImg;
	}
	
	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getSellerNickName() {
		return sellerNickName;
	}

	public void setSellerNickName(String sellerNickName) {
		this.sellerNickName = sellerNickName;
	}

	public String getSellerAccount() {
		return sellerAccount;
	}

	public void setSellerAccount(String sellerAccount) {
		this.sellerAccount = sellerAccount;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	@Override
	public String toString() {
		return "Seller [userNo=" + userNo + ", sellerNickName=" + sellerNickName + ", sellerAccount=" + sellerAccount
				+ ", bStatus=" + bStatus + ", file=" + file + ", profileImg=" + profileImg + "]";
	}
	
	
	
}
