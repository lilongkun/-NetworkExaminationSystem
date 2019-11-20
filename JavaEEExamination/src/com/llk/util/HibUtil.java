package com.llk.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;


public class HibUtil {
	private static Configuration conf;
	private static SessionFactory sf;
	
	@SuppressWarnings("deprecation")
	public static Session getSession(){
		conf = new 	AnnotationConfiguration().configure();
		sf = conf.buildSessionFactory();
		return sf.openSession();
	}
}
