package com.llk.service.impl;

import com.llk.dao.IUserDao;
import com.llk.dao.impl.UserDaoImpl;
import com.llk.service.IUserService;
import com.llk.util.Json;
import com.llk.vo.User;

public class UserServiceImpl implements IUserService{
	IUserDao sd = new UserDaoImpl();
	@Override
	public Json registerUser(User user) {
		// TODO Auto-generated method stub
		return sd.saveUser(user);
	}
	@Override
	public Json loginUser(User user) {
		// TODO Auto-generated method stub
		return sd.findUser(user);
	}

}
