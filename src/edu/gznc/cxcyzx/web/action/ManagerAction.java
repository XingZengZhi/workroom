package edu.gznc.cxcyzx.web.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.gznc.cxcyzx.domain.Manager;
import edu.gznc.cxcyzx.service.ManagerService;

@Controller
@Scope("prototype")
public class ManagerAction extends ActionSupport implements ModelDriven<Manager> {
	
	private static final long serialVersionUID = 1L;
	
	private Manager manager = new Manager();
	@Override
	public Manager getModel() {
		return manager;
	}
	
	@Autowired
	private ManagerService mService;
	//管理者登录
	public String findManager(){
		String uName = ServletActionContext.getRequest().getParameter("uName");
		String uPass = ServletActionContext.getRequest().getParameter("uPass");
		Manager ma = mService.findManager(uName, uPass);
		if(ma != null){
			return "bgindex";
		}
		return "bgLogin";
	}
}
