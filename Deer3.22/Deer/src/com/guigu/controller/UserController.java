package com.guigu.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.guigu.pojo.User;
import com.guigu.service.UserService;

@Controller
@RequestMapping("/UserController")
public class UserController {
	@Autowired
	private UserService userService;
//    注锟斤拷锟矫伙拷 锟斤拷锟斤拷0注锟斤拷晒锟� 锟斤拷锟斤拷1锟矫伙拷锟斤拷锟窖憋拷注锟斤拷  锟斤拷锟斤拷2锟矫伙拷锟斤拷锟斤拷式锟斤拷锟斤拷
	@RequestMapping("/userNameCheck.action")
	@ResponseBody
	public int userNameCheck(String userName) {
		if(userName.contains(" ")) {
			return 2;
		}else {
			int result= userService.userNameCheck(userName);
			if(result == 0) {
				return 1;
				
			}else {
				return 0;
			}
		}
		
	}
	@RequestMapping("/phoneCheck.action")
	@ResponseBody
	//0涓烘纭� 1涓烘墜鏈哄彿宸插瓨鍦� 2涓烘牸寮忛敊璇� 3涓洪潪娉曟墜鏈哄彿
	public int phoneCheck(String phone) {
//		妯℃嫙鍒ゆ柇鎵嬫満鍙锋槸鍚︽槸姝ｇ‘鐨�
		return userService.phoneCheck(phone);
		
	}
	@RequestMapping("/register.action")
	public String register(HttpServletRequest req,HttpServletResponse resp) {
		User user=new User();
		user.setUserName(req.getParameter("exampleInputUserName"));
		user.setUserPass(req.getParameter("exampleInputPassword"));
		user.setPhone(req.getParameter("exampleInputPhone"));
		user.setEmail(req.getParameter("exampleInputEmail"));
		String userPassAgain = req.getParameter("exampleInputPasswordAgain");
		if("true".equals(req.getParameter("autoLogIn"))) {
			user.setAutoLogIn(true);
		}else {
			user.setAutoLogIn(false);
		}
		Map<String,String> errorMap = new HashMap<>();
		if(user.getUserName().length()<4 || user.getUserName().length()>16) {
			errorMap.put("userNameLengthError", "用户名长度不符");
		}else {
			int nameResult = userService.userNameCheck(user.getUserName());
			if(nameResult == 1) {
				errorMap.put("userNameSameError", "用户名已存在");
			}
		}
		if(user.getUserPass().length()<4 || user.getUserPass().length()>16) {
			errorMap.put("userPassLengthError", "密码长度不符");
		}else {
			if(user.getUserPass().equals(userPassAgain)==false) {
				errorMap.put("userPassNotSameError", "密码不一样");
			}
		}
		if(user.getPhone().length() !=11) {
			errorMap.put("userPhoneError", "手机号长度不符");
		}else {
			int phoneResult = userService.phoneCheck(user.getPhone());
			if(phoneResult==1) {
				errorMap.put("userPhoneSameError", "手机号已注册");
			}
		}
		if(errorMap.size()==0) {
			user.setHeadPortrait("../img/headPortrait/default.png");
			userService.addUser(user);
			if(user.isAutoLogIn()==true) {
				user = userService.getUser(user.getUserName());
				req.getSession().setAttribute("user", user);
			}
			return "index";
		}else {
			req.setAttribute("registerError", errorMap);
			return "register";
		}
		
	}
	@RequestMapping("/logIn.action")
	public String logIn(HttpServletRequest req,HttpServletResponse resp) {
		String userName = req.getParameter("exampleInputUserName");
		String userPass = req.getParameter("exampleInputUserPass");
		String pass = userService.passCheckByUserName(userName);
		if(pass == null) {
			req.setAttribute("logInUserNameError", "用户不存在");
			return "login";
		}else {
			if(userPass.equals(pass)==false) {
				req.setAttribute("logInUserPassError", "密码错误");
			}
			User user = new User();
			user = userService.getUser(userName);
			req.getSession().setAttribute("user", user);
			return "index";
		}
	}
	@RequestMapping("/headPortraitCheck.action")
	@ResponseBody
	public int headPortraitCheck(String headPortraitName) {
		if(headPortraitName.endsWith(".png")||headPortraitName.endsWith(".jpg")) {
			return 0;
		}else {
			return 1;
		}
		
	}
	
	@RequestMapping("/uploadHeadPortrait.action")
	public String uploadHeadPortrait(MultipartFile headPortraitFile,HttpServletRequest req) throws Exception {
		String fileName = headPortraitFile.getOriginalFilename();
		if(fileName.endsWith(".jpg")||fileName.endsWith(".png")) {
			User user= (User) req.getSession().getAttribute("user");
			String type = fileName.substring(fileName.length()-4);
			long date = new Date().getTime();
			String path = date+"_"+user.getUserName()+"_"+user.getUserId()+type;
			Map<String,String> headPortraitMap = new HashMap<>();
			user.setHeadPortrait("../img/headPortrait/"+path);
			req.getSession().setAttribute("user",user);
			headPortraitMap.put("userName", user.getUserName());
			headPortraitMap.put("path", "../img/headPortrait/"+path);
			userService.addHeadPortrait(headPortraitMap);
			path = "C:/Deer/headPortrait/"+path;
			headPortraitFile.transferTo(new File(path));
		}else {
			req.setAttribute("headPortraitError", "图片格式错误");
		}
		return "personal";
	
	}
}
