package edu.gznc.cxcyzx.web.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import edu.gznc.cxcyzx.service.VideoService;

@Controller
@Scope("prototype")
public class VideoAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	@Autowired
	private VideoService videoSerivce;
	
	//查找所有的视频
	public String getAllVideo() {
		try {
			HttpServletResponse reponse = ServletActionContext.getResponse();
			reponse.setCharacterEncoding("UTF-8");
			reponse.getWriter().print(videoSerivce.findAllVideo());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}
}
