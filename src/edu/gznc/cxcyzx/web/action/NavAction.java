package edu.gznc.cxcyzx.web.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import edu.gznc.cxcyzx.service.UserService;

@Controller
@Scope("prototype")
public class NavAction extends ActionSupport {
	public String index(){return "index";}
	public String apply(){return "apply";}
	public String show(){return "show";}
	public String summary(){return "summary";}
	public String message(){return "message";}
}
