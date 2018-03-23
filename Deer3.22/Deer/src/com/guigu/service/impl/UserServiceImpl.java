package com.guigu.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guigu.mapper.UserMapper;
import com.guigu.pojo.User;
import com.guigu.service.UserService;
@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public int userNameCheck(String userName) {
		return userMapper.userNameCheck(userName);
	}

	@Override
	public int phoneCheck(String phone) {
		userMapper.phoneCheck(phone);
		return 0;
	}

	@Override
	public void addUser(User user) {
		userMapper.addUser(user);
	}

	@Override
	public User getUser(String userName) {
		User user = userMapper.getUser(userName);
		return user;
	}

	@Override
	public String passCheckByUserName(String userName) {
		String pass= userMapper.passCheckByUserName(userName);
		return pass;
	}

	@Override
	public void addHeadPortrait(Map<String,String> headPortraitMap) {
		userMapper.addHeadPortrait(headPortraitMap);
	}

}
