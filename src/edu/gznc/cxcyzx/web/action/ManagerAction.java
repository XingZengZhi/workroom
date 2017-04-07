package edu.gznc.cxcyzx.web.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.gznc.cxcyzx.domain.Manager;
import edu.gznc.cxcyzx.domain.Room;
import edu.gznc.cxcyzx.domain.User;
import edu.gznc.cxcyzx.service.ManagerService;
import edu.gznc.cxcyzx.service.UserService;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

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
	@Autowired
	private UserService uService;
	//管理者登录
	public String findManager(){
		String uName = ServletActionContext.getRequest().getParameter("uName"); //管理员名称
		String uPass = ServletActionContext.getRequest().getParameter("uPass"); // 管理员密码
		String uImg = ServletActionContext.getRequest().getParameter("uImg"); //管理员头像图片名
		String remeber = ServletActionContext.getRequest().getParameter("remeber"); //1是记住我，0不记住我
		Manager ma = mService.findManager(uName, uPass);
		if(ma != null){
			ma.setmImg(uImg);
			mService.saveOrupdate(ma);
			if(remeber.equals("1")){
				Cookie cookie = new Cookie("mName",ma.getmName());
				//设置cookie生命周期为三天，秒为单位 259200
				cookie.setMaxAge(60);
				//设置cookie获取的路径
				cookie.setPath("/WorkRoom/");
				//向客户端设置cookie
				ServletActionContext.getResponse().addCookie(cookie);
			}
			ServletActionContext.getRequest().setAttribute("Manager", ma);
			return "bgindex";
		}
		ServletActionContext.getRequest().setAttribute("errorTip", "用户名或密码错误");
		return "bgLogin";
	}
	//管理者注册
	public String insertManager(){
		String ruName = ServletActionContext.getRequest().getParameter("ruName");
		String ruPass = ServletActionContext.getRequest().getParameter("ruPass");
		manager.setmName(ruName);
		manager.setmPass(ruPass);
		mService.save(manager);
		return "bgLogin";
	}
	//管理者注销
	public String removeManager(){
		ServletActionContext.getRequest().removeAttribute("Manager");
		return "bgLogin";
	}
	//获取管理员记住我的cookie
	public String getUserCookie(){
		Cookie[] cookies = ServletActionContext.getRequest().getCookies();
		for(Cookie cookie : cookies){ //遍历cookie，查找含有用户名的cookie
			if(cookie.getName().equals("mName")){
				try {
					String str = "";
					//根据管理员名查询管理员，只返回头像图片名称
					Manager ma = mService.findManager(cookie.getValue(), "");
					if(ma != null){
						str = ma.getmImg() + ",";
					}
					//返回cookie中的用户名
					ServletActionContext.getResponse().getWriter().print(str + cookie.getValue());
					return NONE;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return NONE;
	}
	//用户分页数目
	public String PageCount() throws IOException{
		DetachedCriteria dc = DetachedCriteria.forClass(User.class);
		long count = uService.Count(dc);
		ServletActionContext.getResponse().getWriter().print(count);
		return NONE;
	}
	//分页信息
	public String UserPage() throws IOException{
		DetachedCriteria dc = DetachedCriteria.forClass(User.class);
		//获取当前页数的索引
		Integer pageIndex = Integer.parseInt(ServletActionContext.getRequest().getParameter("pageIndex"));
		//获取每页显示条数
		Integer pageSize = Integer.parseInt(ServletActionContext.getRequest().getParameter("pageSize"));
		pageIndex = pageSize*(pageIndex - 1);
		List<User> users = uService.findByPage(dc, pageIndex, pageSize);
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[]{"room"});
		ServletActionContext.getResponse().getWriter().print(JSONArray.fromObject(users, config).toString());
		return NONE;
	}
	//获取每条数据的所在工作室
	public String GetUserRoom() throws IOException{
		Integer userId = Integer.parseInt(ServletActionContext.getRequest().getParameter("userId"));
		User user = uService.findByUserId(userId);
		if(user.getRoom() != null){
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().print(user.getRoom().getRoomName());
		}
		return NONE;
	}
	//根据用户名查询用户
	public String FindUserByName() throws IOException{
		String name = ServletActionContext.getRequest().getParameter("uName");
		User user = uService.findByUserName(name);
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[]{"room"});
		System.out.println(JSONArray.fromObject(user, config).toString());
		ServletActionContext.getResponse().getWriter().print(JSONArray.fromObject(user, config).toString());
		return NONE;
	}
	//根据用户id删除用户
	public String deleteUser(){
		String uid = ServletActionContext.getRequest().getParameter("uid");
		if(uid.contains(",")){
			String[] uids = uid.split(",");
			for(int i = 0;i<uids.length;i++){
				User user = uService.findByUserId(Integer.parseInt(uids[i]));
				uService.deleteUser(user);
			}
		}else{
			User user = uService.findByUserId(Integer.parseInt(uid));
			uService.deleteUser(user);
		}
		return NONE;
	}
}
