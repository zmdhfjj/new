package com.guigu.pojo;

public class User {
	private int isFrozen;
	private String headPortrait;
	private String bankCard;
	private String phone;
	private String email;
	private String birthday;
	private String userName;
	private String userPass;
	private int gender;
	private int userId;
	private boolean autoLogIn;
	
	
	public boolean isAutoLogIn() {
		return autoLogIn;
	}
	public void setAutoLogIn(boolean autoLogIn) {
		this.autoLogIn = autoLogIn;
	}
	public int getIsFrozen() {
		return isFrozen;
	}
	public void setIsFrozen(int isFrozen) {
		this.isFrozen = isFrozen;
	}
	public String getHeadPortrait() {
		return headPortrait;
	}
	public void setHeadPortrait(String headPortrait) {
		this.headPortrait = headPortrait;
	}
	public String getBankCard() {
		return bankCard;
	}
	public void setBankCard(String bankCard) {
		this.bankCard = bankCard;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "User [isFrozen=" + isFrozen + ", headPortrait=" + headPortrait + ", bankCard=" + bankCard + ", phone="
				+ phone + ", email=" + email + ", birthday=" + birthday + ", userName=" + userName + ", userPass="
				+ userPass + ", gender=" + gender + ", userId=" + userId + ", autoLogIn=" + autoLogIn + "]";
	}
	
}
