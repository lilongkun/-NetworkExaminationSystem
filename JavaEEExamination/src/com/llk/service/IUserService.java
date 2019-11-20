package com.llk.service;

import com.llk.util.Json;
import com.llk.vo.User;

public interface IUserService {
	Json registerUser(User user);
	Json loginUser(User user);
}
