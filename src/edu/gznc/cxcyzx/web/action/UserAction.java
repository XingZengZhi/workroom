package edu.gznc.cxcyzx.web.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.dsna.util.images.ValidateCode;
import edu.gznc.cxcyzx.domain.Room;
import edu.gznc.cxcyzx.domain.User;
import edu.gznc.cxcyzx.service.RoomService;
import edu.gznc.cxcyzx.service.UserService;
import edu.gznc.cxcyzx.utils.MD5Utils;
import net.sf.json.JSONObject;

public class UserAction extends ActionSupport implements ModelDriven<User> {
	private User user = new User();
	@Override
	public User getModel() {
		return user;
	}
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	private RoomService roomService;
	public void setRoomService(RoomService roomService) {
		this.roomService = roomService;
	}
	
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
	public String code() throws Exception{ // 登录的验证码
		ValidateCode code = new ValidateCode(100,25,4,10);
		ActionContext.getContext().getSession().put("sessionCode", code.getCode());
		code.write(ServletActionContext.getResponse().getOutputStream());
		return NONE;
	}
	public String checkCode() throws Exception{
		ServletActionContext.getResponse().getWriter().print(ActionContext.getContext().getSession().get("sessionCode"));
		return NONE;
	}
	public String room() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(userService.findAllRoom());
		return NONE;
	}
	public String apply(){
		System.out.println(user.getUserId());
		User exiteUser = userService.findByUserId(user.getUserId());
		Room room = roomService.findByRoomId(user.getRoomId());
		exiteUser.setUserEmail(user.getUserEmail());
		exiteUser.setUserStuID(user.getUserStuID());
		exiteUser.setUserText(user.getUserText());
		exiteUser.setRoom(room);
		userService.updataUser(exiteUser);
		return NONE;
	}

}
