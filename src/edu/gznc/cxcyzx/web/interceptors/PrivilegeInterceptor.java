package edu.gznc.cxcyzx.web.interceptors;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

import edu.gznc.cxcyzx.domain.User;

public class PrivilegeInterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		User user = (User) ActionContext.getContext().getSession().get("exitUser");
		if(user == null){
			ActionSupport actionSupport = (ActionSupport) invocation.getAction();
			return actionSupport.LOGIN;
		}else{
			return invocation.invoke();
		}
	}

}
