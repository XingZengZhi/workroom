package edu.gznc.cxcyzx.web.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.gznc.cxcyzx.domain.Room;
import edu.gznc.cxcyzx.service.RoomService;

@Controller
@Scope("prototype")
public class RoomAction extends ActionSupport implements ModelDriven<Room>{
	private Room room = new Room();
	@Override
	public Room getModel() {
		return room;
	}
	@Autowired
	private RoomService roomService;
//	根据工作室id查询工作室的简介
	public String BackRoomPage(){
		Integer roomId = Integer.valueOf(ServletActionContext.getRequest().getParameter("roomId"));
		Room room = roomService.findByRoomId(roomId);
		System.out.println(room.getRoomName());
		return "success";
	}
}
