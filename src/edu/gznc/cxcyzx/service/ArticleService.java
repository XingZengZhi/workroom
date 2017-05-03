package edu.gznc.cxcyzx.service;

import java.io.Serializable;
import java.util.List;

import edu.gznc.cxcyzx.domain.Article;

public interface ArticleService {
	Article findByArticleId(Serializable articleId);
	String FindAllArticleNoRoom();
	String FindAllArticleHaveRoom();
	void ShareLore(String username, String articleText);
}
