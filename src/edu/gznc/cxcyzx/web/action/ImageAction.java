package edu.gznc.cxcyzx.web.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.gznc.cxcyzx.domain.Image;
import edu.gznc.cxcyzx.service.ImageService;

@Controller
@Scope("prototype")
public class ImageAction extends ActionSupport implements ModelDriven<Image> {
	private Image image;

	@Override
	public Image getModel() {
		return image;
	}
	
	@Autowired
	private ImageService imageService;
	
	public String SaveImageURL(){
		
		return NONE;
	}

}
