package com.llk.dao;

import java.util.List;

import com.llk.vo.Menu;
import com.llk.vo.User;

public interface IMenuDao {
	List<User>getMenus(int id);
}
