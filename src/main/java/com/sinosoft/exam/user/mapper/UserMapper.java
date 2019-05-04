package com.sinosoft.exam.user.mapper;

import org.springframework.stereotype.Repository;

import com.sinosoft.exam.user.model.User;

@Repository
public interface UserMapper {
	
	public User getUserByName(String name);

	public boolean createAccount(User user);
}
