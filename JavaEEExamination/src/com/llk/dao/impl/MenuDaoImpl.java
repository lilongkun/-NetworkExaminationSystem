package com.llk.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.llk.dao.IMenuDao;
import com.llk.util.HibUtil;
import com.llk.vo.Menu;
import com.llk.vo.User;

public class MenuDaoImpl implements IMenuDao{

	@Override
	public List<User> getMenus(int id) {
		Session session = HibUtil.getSession();
		Transaction tx = session.beginTransaction();
//		Query query = session.createQuery("from Menu");
//		List<Menu> menus = query.list();
		tx.begin();
		
		Query query = session.createQuery("from User where id=?");
		query.setParameter(0,id);
		List<User> userList = query.list();
		tx.commit();
		return userList;
	}
	
}
