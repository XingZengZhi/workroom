package edu.gznc.cxcyzx.service;

import java.io.Serializable;

import edu.gznc.cxcyzx.domain.Article;

public interface ArticleService {
	public Article findByArticleId(Serializable articleId);
}
