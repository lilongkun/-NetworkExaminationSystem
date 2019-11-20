package com.llk.dao.impl;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.llk.dao.IUserDao;
import com.llk.util.DistributeMenu;
import com.llk.util.HibUtil;
import com.llk.util.Json;
import com.llk.vo.Menu;
import com.llk.vo.User;
public class UserDaoImpl implements IUserDao{
	Session session;
	Transaction tx;
	public Json saveUser(User user) {
		Json result = new Json();
		// TODO Auto-generated method stub
		try{
			session = HibUtil.getSession();
			tx = session.beginTransaction();
			tx.begin();
			Query query = session.createQuery("from User where name=?");
			query.setParameter(0, user.getName());
			if(query.list().size() != 0 && query.list() != null){
				result.setMsg("用户名已存在");
				result.setSuccess(false);
			}else{
				Set<Menu> menusSet = DistributeMenu.distribute(user.getRole(),session);
				user.setMenus(menusSet);
				session.save(user);
				result.setSuccess(true);
			}
		}catch(Exception e){
			result.setMsg("注册失败");
			result.setSuccess(false);
			e.printStackTrace();
		}
		tx.commit();
		session.close();
		System.out.println(result.getMsg());
		return result;
	}
	@Override
	public Json findUser(User user) {
		Json result = new Json();
		session = HibUtil.getSession();
		tx = session.beginTransaction();
		tx.begin();
		Query query = session.createQuery("from User where (name=? or phonenumber=?) and password=?");
		query.setParameter(0, user.getName());
		query.setParameter(1, user.getName());
		query.setParameter(2, user.getPassword());
		List<User> userList = query.list();
		if(userList == null||userList.size() == 0){
			result.setSuccess(false);
		}else{
			result.setSuccess(true);
			result.setObj(userList.get(0));
		}
		
		tx.commit();
		session.close();
		return result;
	}

}
