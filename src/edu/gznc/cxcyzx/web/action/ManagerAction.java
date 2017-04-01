package edu.gznc.cxcyzx.web.action;

import java.io.IOException;

import javax.servlet.http.Cookie;

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
}
