package com.llk.interceptor; 
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		String actionName = invocation.getProxy().getActionName();
		
	    if("user_login".equals(actionName)){
	    	
	    	return invocation.invoke();
	    	
	    }
	    Object currentUser = invocation.getInvocationContext().getSession().get("existUser");
		if(currentUser!=null){
			System.out.println("已存在用户");
			return invocation.invoke();
			
		}
		System.out.println(actionName);
		return "showLoginView";
	}
	
}
