package com.llk.service.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;

import com.llk.dao.IMenuDao;
import com.llk.dao.impl.MenuDaoImpl;
import com.llk.service.IMenuService;
import com.llk.vo.Menu;
import com.llk.vo.User;

public class MenuServiceImpl implements IMenuService{
	IMenuDao menuDao = new MenuDaoImpl();
	@Override
	public Set<Menu> getMenus() {
		// TODO Auto-generated method stub
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		System.out.println(user.getId());
		List<User> userList = menuDao.getMenus(user.getId());
		Iterator<User> userIterator = userList.iterator();
		return userIterator.next().getMenus();
	}

}
