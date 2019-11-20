package com.llk.dao;

import com.llk.util.Json;
import com.llk.vo.User;

public interface IUserDao {
	Json saveUser(User user);
	Json findUser(User user);
}
