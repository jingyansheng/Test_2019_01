package com.sinosoft.exam.user.service;

import com.sinosoft.exam.user.model.User;

public interface UserService {
	
	public User getUserByName(String name);

	public Boolean verifyUsername(String name);

	public boolean createAccount(User user);

}
