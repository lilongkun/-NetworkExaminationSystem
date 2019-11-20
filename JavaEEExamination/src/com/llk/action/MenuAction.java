package com.llk.action;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.llk.service.IMenuService;
import com.llk.service.impl.MenuServiceImpl;
import com.llk.util.Json;
import com.llk.vo.Menu;
import com.opensymphony.xwork2.ActionSupport;
public class MenuAction extends ActionSupport{
	private IMenuService menuService = new MenuServiceImpl();
	public String getMenus(){
		List<Menu> menus = new ArrayList<Menu>();
		Json result = new Json();
//		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		TreeSet<Menu> menuSet = new TreeSet<Menu>(menuService.getMenus());
			for(Menu menu:menuSet){
				System.out.println(menu.getSequence());
				menus.add(menu);
			}
		result.setObj(menus);
		String resultStr = new Gson().toJson(result);
		try {
			ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
			ServletActionContext.getResponse().getWriter().println(resultStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}
}
