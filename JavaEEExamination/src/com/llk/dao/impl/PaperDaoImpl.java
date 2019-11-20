package com.llk.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.llk.dao.IPaperDao;
import com.llk.util.HibUtil;
import com.llk.util.Json;
import com.llk.vo.Paper;

public class PaperDaoImpl implements IPaperDao{
	private Session session= null;
	private Transaction tx = null;
	@Override
	public Boolean savePaper(Paper paper) {
		Boolean result = false;
		session = HibUtil.getSession();
		tx = session.beginTransaction();
		tx.begin();
		session.save(paper);
		tx.commit();
		session.close();
		result = true;
		return result;
	}
	@Override
	public List<Paper> searchPaper(int paperType) {
		session = HibUtil.getSession();
		tx = session.beginTransaction();
		tx.begin();
		Query query = session.createQuery("from Paper where paperType=?");
		query.setParameter(0, paperType);
		
		return query.list();
	}

}
