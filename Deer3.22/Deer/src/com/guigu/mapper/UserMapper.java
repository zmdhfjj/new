package com.guigu.mapper;

import java.util.Map;

import com.guigu.pojo.User;

public interface UserMapper {
	int userNameCheck(String userName);
	int phoneCheck(String phone);
	void addUser(User user);
	User getUser(String userName);
	String passCheckByUserName(String userName);
	void addHeadPortrait(Map<String,String> headPortraitMap);
}
