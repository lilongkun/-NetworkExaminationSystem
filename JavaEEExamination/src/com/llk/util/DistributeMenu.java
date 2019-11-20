package com.llk.util;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.llk.vo.Menu;

public class DistributeMenu {
	public static Set<Menu> distribute(int role,Session session){
		Set<Menu> menusSet = new HashSet<Menu>();
		Transaction tx = session.beginTransaction();
		Iterator<Menu> menusIterator = null;
		tx.begin();
		System.out.println(role);
		if(role == 0){
			Query query = session.createQuery("from Menu where menuKey like 'øº%'");
			menusIterator = query.list().iterator(); 
		}else if(role == 1){
			System.out.println(role);
			Query query = session.createQuery("from Menu where menuKey like '%¿Ì‘±'");
			menusIterator = query.list().iterator();
		}
		while(menusIterator.hasNext()){
			menusSet.add(menusIterator.next());
		}
		return menusSet;
	}
}
