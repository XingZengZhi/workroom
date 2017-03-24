package edu.gznc.cxcyzx.service.impl;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.gznc.cxcyzx.dao.ArticleDao;
import edu.gznc.cxcyzx.domain.Article;
import edu.gznc.cxcyzx.service.ArticleService;

@Transactional
@Service
public class ArticleServiceImpl implements ArticleService {
	@Resource
	ArticleDao articleDao;

	@Override
	public Article findByArticleId(Serializable articleId) {
		return articleDao.findById(articleId);
	}

}
