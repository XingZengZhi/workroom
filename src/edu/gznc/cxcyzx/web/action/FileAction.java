package edu.gznc.cxcyzx.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class FileAction extends ActionSupport {
	//上传文件
	private File upload;
	//上传文件名
	private String uploadFileName;
	//上传文件内容类型
	private String uploadContentType;
	//文件保存路径
	private String savePath;
	
	public String fileUpload() throws IOException{
		//定义路径名称
		String fileName = getSavePath() + File.separatorChar +getUploadFileName();
		System.out.println(getSavePath());
		System.out.println(fileName);
		//定义输出流对象fos
		FileOutputStream fos = new FileOutputStream(fileName);
		//定义输入流对象fis
		FileInputStream fis = new FileInputStream(getUpload());
		byte[] b = new byte[1024*1024];
		int len = 0;
		while((len = fis.read(b)) > 0){
			fos.write(b,0,len);
		}
		return NONE;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getSavePath() {
		return ServletActionContext.getRequest().getRealPath(savePath);
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

}
