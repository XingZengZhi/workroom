package edu.gznc.cxcyzx.dao;

import java.util.List;

import edu.gznc.cxcyzx.domain.Article;

public interface ArticleDao extends BaseDao<Article> {
	List<Article> FindAllArticleNoRoom();
	List<Article> FindAllArticleHaveRoom();
	boolean ShareLore(String username);
}
