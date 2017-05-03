package edu.gznc.cxcyzx.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.gznc.cxcyzx.domain.Image;
import edu.gznc.cxcyzx.domain.Room;
import edu.gznc.cxcyzx.domain.Video;
import edu.gznc.cxcyzx.service.ImageService;
import edu.gznc.cxcyzx.service.RoomService;
import edu.gznc.cxcyzx.service.VideoService;

@Controller
@Scope("prototype")
public class VideoUpload extends ActionSupport {
	//上传文件
	private File video;
	//上传文件名
	private String videoFileName;
	//上传文件内容类型
	private String videoContentType;
	//文件保存路径
	private String savePath;
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	private RoomService roomService;
	
	public String vUpload() throws IOException{
		/*String videoname = ServletActionContext.getRequest().getParameter("videoname");
		String roomid = ServletActionContext.getRequest().getParameter("roomid");*/
		
		File filePath = new File(getSavePath());
		//判断是否存在这个路径，如果没有则创建
		if(!filePath.exists()){
			filePath.mkdirs();
		}
		//定义路径名称
		String fileName = getSavePath() + File.separatorChar + getVideoFileName();
		//获得应用的跟路径 /WorkRoom	`	
		String appURL = File.separatorChar + ServletActionContext.getRequest().getContextPath().substring(1) + savePath + File.separatorChar + getVideoFileName();
		System.out.println(appURL);
		System.out.println(getSavePath());
		System.out.println(fileName);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String time = sdf.format(new Date());
		/*Room room = roomService.findByRoomId(Long.valueOf(roomid));*/
		Video video = new Video();
		/*video.setVideoName(videoname);*/
		video.setVideoTime(time);
		/*video.setRoom(room);*/
		
		videoService.SaveVideo(video);
		//定义输出流对象fos
		FileOutputStream fos = new FileOutputStream(fileName);
		//定义输入流对象fis
		FileInputStream fis = new FileInputStream(getVideo());
		byte[] b = new byte[1024*1024];
		int len = 0;
		while((len = fis.read(b)) > 0){
			fos.write(b,0,len);
		}
		fis.close();
		fos.close();
		ServletActionContext.getResponse().getWriter().print(appURL);
		return NONE;
	}

	
	public String getSavePath() {
		return ServletActionContext.getRequest().getRealPath(savePath);
	}

	public void setSavePath(String savePath) {
		this.savePath = File.separatorChar + savePath;
	}


	public File getVideo() {
		return video;
	}


	public void setVideo(File video) {
		this.video = video;
	}


	public String getVideoFileName() {
		return videoFileName;
	}


	public void setVideoFileName(String videoFileName) {
		String filename = videoFileName.substring(0, videoFileName.lastIndexOf("."));
		String typeName = videoFileName.substring(videoFileName.indexOf("."));
		filename = String.valueOf(System.currentTimeMillis());
		this.videoFileName = filename + typeName;
	}


	public String getUploadContentType() {
		return videoContentType;
	}


	public void setVideoContentType(String videoContentType) {
		this.videoContentType = videoContentType;
	}

}
