package com.sinosoft.exam.authentication.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinosoft.exam.tools.StringProcessor;
import com.sinosoft.exam.user.model.User;
import com.sinosoft.exam.user.service.UserService;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	UserService userService;

	@Override
	public User loginValidate(String userName, String password) {
		if(!StringProcessor.isNullOrEmpty(userName) && !StringProcessor.isNullOrEmpty(password)) {
			User user = userService.getUserByName(userName);
			if(null != user) {
				String _password = user.getPassword();		//correctlly
				password = StringProcessor.getMD5(password);		//argement
				if (_password.equals(password)) {
					return user;
				}
			}
		}
		return null;
	}

}
