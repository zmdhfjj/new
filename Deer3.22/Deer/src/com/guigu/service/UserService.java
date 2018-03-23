package com.guigu.service;

import java.util.Map;

import com.guigu.pojo.User;

public interface UserService {
	int userNameCheck(String userName);
	int phoneCheck(String phone);
	void addUser(User user);
	User getUser(String userName);
	String passCheckByUserName(String userName);
	void addHeadPortrait(Map<String,String> headPortraitMap);
}
