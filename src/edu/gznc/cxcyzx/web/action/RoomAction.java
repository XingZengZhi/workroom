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
//	根据工作室id查询工作室的简介
	public String BackRoomPage(){
		Integer roomId = Integer.valueOf(ServletActionContext.getRequest().getParameter("roomId"));
//		根据对应的工作室id查询对应的文章
		Room room = roomService.findByRoomId(roomId);
		Article article = articleService.findByArticleId(room.getRoomId());
		ServletActionContext.getRequest().setAttribute("article", article);
		return "success";
	}
	public String UserRoom(){
		Integer uid = Integer.valueOf(ServletActionContext.getRequest().getParameter("userId"));
		Integer rid = Integer.valueOf(ServletActionContext.getRequest().getParameter("roomId"));
		User user = userService.findByUserId(uid);
		Room room = roomService.findByRoomId(rid);
		//设置用户所属的工作室
		user.setRoom(room);
		userService.save(user);
		return "applySuccess";
	}
}
