package edu.gznc.cxcyzx.web.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.gznc.cxcyzx.domain.Article;

@Controller
@Scope("prototype")
public class ArticleAction extends ActionSupport implements ModelDriven<Article> {
	private static final long serialVersionUID = 1L;
	private Article article = new Article();
	@Override
	public Article getModel() {
		return article;
	}

}
