package edu.gznc.cxcyzx.web.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.gznc.cxcyzx.domain.Article;
import edu.gznc.cxcyzx.domain.Room;
import edu.gznc.cxcyzx.domain.User;
import edu.gznc.cxcyzx.service.ArticleService;
import edu.gznc.cxcyzx.service.RoomService;
import edu.gznc.cxcyzx.service.UserService;

@Controller
@Scope("prototype")
public class RoomAction extends ActionSupport implements ModelDriven<Room>{
	private static final long serialVersionUID = 1L;
	private Room room = new Room();
	@Override
	public Room getModel() {
		return room;
	}
	@Autowired
	private UserService userService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private ArticleService articleService;
	//根据工作室id查询工作室的简介
	public String BackRoomPage(){
		Integer roomId = Integer.valueOf(ServletActionContext.getRequest().getParameter("roomId"));
		//根据对应的工作室id查询对应的文章
		Room room = roomService.findByRoomId(roomId);
		Article article = articleService.findByArticleId(room.getRoomId());
		ServletActionContext.getRequest().setAttribute("article", article);
		return "success";
	}
	//用户申请工作室
	public String UserRoom(){
		Integer uid = Integer.valueOf(ServletActionContext.getRequest().getParameter("userId"));
		Integer rid = Integer.valueOf(ServletActionContext.getRequest().getParameter("roomId"));
		String userStuID = ServletActionContext.getRequest().getParameter("userStuID");
		String userPhone = ServletActionContext.getRequest().getParameter("userPhone");
		String userText = ServletActionContext.getRequest().getParameter("userText");
		User user = userService.findByUserId(uid); //获得当前用户信息
		Room room = roomService.findByRoomId(rid); //获得申请工作室信息
		if(!userStuID.isEmpty()){ //判断学号是否为空
			user.setUserStuID(userStuID); //设置申请学生的学号
		}
		if(!userPhone.isEmpty()){ //判断手机号是否为空
			user.setUserPhone(userPhone); //设置申请学生的邮箱
		}
		if(!userText.isEmpty()){ //判断申请缘由是否为空
			user.setUserText(userText); //设置学生申请缘由
		}
		user.setRoom(room); //设置用户所属的工作室
		userService.update(user); //更新用户信息
		return "applySuccess";
	}
	//根据id设置申请页的下拉选择项
	public String GiveId(){
		ServletActionContext.getRequest().setAttribute("roomId", ServletActionContext.getRequest().getParameter("roomId"));
		return "apply";
	}
	
}
