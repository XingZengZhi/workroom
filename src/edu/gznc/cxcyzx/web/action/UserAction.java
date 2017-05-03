package edu.gznc.cxcyzx.web.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.dsna.util.images.ValidateCode;
import edu.gznc.cxcyzx.domain.User;
import edu.gznc.cxcyzx.service.RoomService;
import edu.gznc.cxcyzx.service.UserService;

@Controller
@Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven<User> {
	private static final long serialVersionUID = 1L;
	private User user = new User();
	private String ReelCode;
	@Override
	public User getModel() {
		return user;
	}
	@Autowired
	private UserService userService;
	@Autowired
	private RoomService roomService;
	// 返回用户有关的页面
	public String loginJsp(){// 登录页面
		return "loginJsp";
	}
	public String registeJsp(){ // 注册页面
		return "registeJsp";
	}
	public String exit(){
		ActionContext.getContext().getSession().put("exitUser",null);
		return "exit";
	}
	// -------------
	
	// 功能模块
	public String login(){ // 登录模块
		User exituser = userService.login(user);
		if(exituser != null){
			ActionContext.getContext().getSession().put("exitUser", exituser);
			ActionContext.getContext().put("error", null);
			return SUCCESS;
		}
		ActionContext.getContext().put("error", "用户名或密码错误");
		return "loginJsp";
	}
	public String registe() throws Exception{ // 注册模块
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time = sdf.format(date);
		date = sdf.parse(time);
		user.setUserRegistTime(date);
		userService.registe(user);
		return "registe";
	}
	public String checkInput() throws Exception{ // ajax检查用户名是否存在
		String name = (String) ActionContext.getContext().getValueStack().findString("userName");
		if(userService.checkUser(name)){
			ServletActionContext.getResponse().getWriter().print("1");
		}else{
			ServletActionContext.getResponse().getWriter().print("0");
		}
		return NONE;
	}
//	获得验证码
	public String code() throws Exception{ // 登录的验证码
		ValidateCode code = new ValidateCode(100,25,4,10);
//		ActionContext.getContext().getSession().put("sessionCode", code.getCode());
		ReelCode = code.getCode().toUpperCase();
		code.write(ServletActionContext.getResponse().getOutputStream());
		return NONE;
	}
//	检查验证码
	public String checkCode() throws Exception{
		String valueCode = ServletActionContext.getRequest().getParameter("value").toUpperCase();
		if(ReelCode.equals(valueCode)){
			ServletActionContext.getResponse().getWriter().print(1);
		}else{
			ServletActionContext.getResponse().getWriter().print(0);
		}
		return NONE;
	}
//	获取所有工作室
	public String room() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(userService.findAllRoom());
		return NONE;
	}
	//个人信息设置
	public String Setting(){
		String username = ServletActionContext.getRequest().getParameter("username");
		User user = userService.findByUserName(username);
		ServletActionContext.getRequest().setAttribute("user", user);
		return "personsetting";
	}
	//个人信息更改
	public String ChangeMessage(){
		User newUser = userService.findByUserName(user.getUserName());
		newUser.setUserPhone(user.getUserPhone());
		userService.update(newUser);
		ActionContext.getContext().getSession().put("exitUser",null);
		return "changesetting";
	}
}
