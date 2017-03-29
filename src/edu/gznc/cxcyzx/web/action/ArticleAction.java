package edu.gznc.cxcyzx.web.action;

import java.io.IOException;
import java.util.List;
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
import edu.gznc.cxcyzx.service.ArticleService;
import edu.gznc.cxcyzx.utils.JedisUtils;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import redis.clients.jedis.Jedis;

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
	/*根据id查询文章*/
	public String roomArticle(){
		String articleid = ServletActionContext.getRequest().getParameter("articleid");
		Article article = articleService.findByArticleId(Integer.valueOf(articleid));
		ServletActionContext.getRequest().setAttribute("article", article);
		return "article";
	}
}
