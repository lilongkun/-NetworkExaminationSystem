package com.llk.action;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.google.gson.Gson;
import com.llk.service.IUserService;
import com.llk.service.impl.UserServiceImpl;
import com.llk.util.HibUtil;
import com.llk.vo.Menu;
import com.llk.vo.Paper;

import com.llk.vo.User;

public class Test {
	public static void main(String[] args) {
		Session session = HibUtil.getSession();
		Transaction tx = session.beginTransaction();
		tx.begin();
		
		tx.commit();
		session.close();
	}
}
