package edu.gznc.cxcyzx.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.gznc.cxcyzx.dao.ArticleDao;
import edu.gznc.cxcyzx.domain.Article;
import edu.gznc.cxcyzx.service.ArticleService;
import edu.gznc.cxcyzx.utils.JedisUtils;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import redis.clients.jedis.Jedis;

@Transactional
@Service
public class ArticleServiceImpl implements ArticleService {
	@Resource
	ArticleDao articleDao;

	@Override
	public Article findByArticleId(Serializable articleId) {
		return articleDao.findById(articleId);
	}

	@Override
	public String FindAllArticleNoRoom() {
		Jedis jedis = JedisUtils.getJedis();
		if(jedis.get("userArticles") == null){
			List<Article> articles = articleDao.FindAllArticleNoRoom();
			//解决对象关联后导致json数据死循环问题
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setExcludes(new String[]{"room"});
			jedis.set("userArticles", JSONArray.fromObject(articles,jsonConfig).toString());
		}
		return jedis.get("userArticles");
	}

	@Override
	public String FindAllArticleHaveRoom() {
		Jedis jedis = JedisUtils.getJedis();
		if(jedis.get("articles") == null){
			List<Article> articles = articleDao.FindAllArticleHaveRoom();
			//解决对象关联后导致json数据死循环问题
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setExcludes(new String[]{"room"});
			jedis.set("articles", JSONArray.fromObject(articles,jsonConfig).toString());
		}
		return jedis.get("articles");
	}

	@Override
	public void ShareLore(String username, String articleText) {
		Article ar = new Article();
		ar.setArticleText(articleText);
		ar.setArticleResouce(username);//设置分享用户昵称
		articleDao.save(ar);
	}

}
