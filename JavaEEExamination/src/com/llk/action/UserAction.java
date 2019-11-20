package com.llk.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.llk.dao.IUserDao;
import com.llk.service.IUserService;
import com.llk.service.impl.UserServiceImpl;
import com.llk.util.Json;
import com.llk.vo.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User>{
	private User user = new User();
	private IUserService userService = new UserServiceImpl();
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	public String showLoginView(){
		return "showLoginView";
	}
	public String showLoginViewByDeleteUser(){
		ServletActionContext.getRequest().getSession().removeAttribute("existUser");
		return "showLoginView";
	}
	public String register(){
		Json result = new Json();
		result = userService.registerUser(user);
		if(result.isSuccess()){
			System.out.println("注册成功");
			return "registerSuccess";
		}else{
			ServletActionContext.getRequest().getSession().setAttribute("registMessage", result.getMsg());
		}
		return "registerFailed";
	}
	public String login() throws IOException{
		Json result = userService.loginUser(user);
		System.out.println(result.isSuccess());
		
		if(result.isSuccess()){
			ServletActionContext.getRequest().getSession().setAttribute("existUser", (User)result.getObj());
			HttpServletResponse resp = ServletActionContext.getResponse();
			resp.getWriter().print("true");
			
		}else{
			HttpServletResponse resp = ServletActionContext.getResponse();
			resp.getWriter().print("false");
		}
		return NONE;
	}
}
