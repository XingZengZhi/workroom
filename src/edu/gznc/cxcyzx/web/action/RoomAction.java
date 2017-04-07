package edu.gznc.cxcyzx.web.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

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
import edu.gznc.cxcyzx.utils.JedisUtils;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import redis.clients.jedis.Jedis;

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
		//设置每一次访问对应的工作室就计数
		if(ServletActionContext.getContext().getApplication() == null){
			/*Map<String, Object> RoomMap = new HashMap<String, Object>();*/
			/*if(RoomMap.get(String.valueOf(roomId)) == null){
				//如果没有这个工作室，则计数初始化为0
				RoomMap.put(String.valueOf(roomId), 0);
			}else{
				Integer count = (Integer) RoomMap.get(String.valueOf(roomId));
				count++;
				//更新对应的键值
				RoomMap.put(String.valueOf(roomId), count);
			}*/
			ServletActionContext.getContext().setApplication(new HashMap<String, Object>());
		}
		//取出application中的map
		Map<String, Object> RoomMap = ServletActionContext.getContext().getApplication();
		if(RoomMap.get(String.valueOf(roomId)) == null){
			//如果没有这个工作室，则计数初始化为0
			RoomMap.put(String.valueOf(roomId), 1);
		}else{
			Integer count = (Integer) RoomMap.get(String.valueOf(roomId));
			count++;
			//更新对应的键值
			RoomMap.put(String.valueOf(roomId), count);
		}
		ServletActionContext.getContext().setApplication(RoomMap);
		System.out.println(RoomMap.get(String.valueOf(roomId)));
		//根据对应的工作室id查询对应的文章
		Room room = roomService.findByRoomId(roomId);
		Article article = articleService.findByArticleId(room.getRoomId());
		ServletActionContext.getRequest().setAttribute("article", article);
		return "success";
	}
	//用户申请工作室
	public String UserRoom(){
		Integer uid = null;
		Integer rid = null;
		if(ServletActionContext.getRequest().getParameter("userId") != null){
			uid = Integer.valueOf(ServletActionContext.getRequest().getParameter("userId"));
		}
		if(ServletActionContext.getRequest().getParameter("roomId") != null){
			rid = Integer.valueOf(ServletActionContext.getRequest().getParameter("roomId"));
		}
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
	//更改工作室详情
	public String ChangeRoomSum() throws IOException{
		String roomName = ServletActionContext.getRequest().getParameter("roomName");
		String roomSum = ServletActionContext.getRequest().getParameter("roomSum");
		Room room = roomService.findRoomByName(roomName);
		if(room != null){
			room.setRoomSum(roomSum);
			roomService.updateRoom(room);
			ServletActionContext.getResponse().getWriter().print("1");
		}else{
			ServletActionContext.getResponse().getWriter().print("");
		}
		return NONE;
	}
	
}
