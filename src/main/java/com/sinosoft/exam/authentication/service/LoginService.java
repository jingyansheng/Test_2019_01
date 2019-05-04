package com.sinosoft.exam.authentication.service;

import com.sinosoft.exam.user.model.User;

public interface LoginService {
	
	public User loginValidate(String userName, String password);

}
