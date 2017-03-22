package edu.gznc.cxcyzx.web.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.gznc.cxcyzx.domain.Article;
import edu.gznc.cxcyzx.domain.Room;
import edu.gznc.cxcyzx.service.ArticleService;
import edu.gznc.cxcyzx.service.RoomService;

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
}
