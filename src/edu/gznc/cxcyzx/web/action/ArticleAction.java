package edu.gznc.cxcyzx.web.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.gznc.cxcyzx.domain.Article;
import edu.gznc.cxcyzx.service.ArticleService;

@Controller
@Scope("prototype")
public class ArticleAction extends ActionSupport implements ModelDriven<Article> {
	private static final long serialVersionUID = 1L;
	private Article article = new Article();
	@Override
	public Article getModel() {
		return article;
	}
	@Autowired
	private ArticleService articleService;
	/*返回所有文章*/
	public String returnAllArticle(){
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(articleService.findAllArticle());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}
}
