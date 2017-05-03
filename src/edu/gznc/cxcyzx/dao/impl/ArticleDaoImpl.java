package edu.gznc.cxcyzx.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import edu.gznc.cxcyzx.dao.ArticleDao;
import edu.gznc.cxcyzx.domain.Article;

@Repository
public class ArticleDaoImpl extends BaseDaoImpl<Article> implements ArticleDao {

	@Override
	public List<Article> FindAllArticleNoRoom() {
		DetachedCriteria dc = DetachedCriteria.forClass(Article.class);
		List<Article> articles = (List<Article>) this.getHibernateTemplate().findByCriteria(dc);
		List<Article> noRoomArticles = new ArrayList<Article>();
		if(articles.size() > 0){
			System.out.println(articles.size());
			for(Article ar : articles){
				System.out.println(ar.getRoom());
				if(ar.getRoom() == null){
					noRoomArticles.add(ar);
				}
			}
			return noRoomArticles;
		}
		return null;
	}

	@Override
	public List<Article> FindAllArticleHaveRoom() {
		DetachedCriteria dc = DetachedCriteria.forClass(Article.class);
		List<Article> articles = (List<Article>) this.getHibernateTemplate().findByCriteria(dc);
		List<Article> HaveRoomArticles = new ArrayList<Article>();
		if(articles.size() > 0){
			System.out.println(articles.size());
			for(Article ar : articles){
				System.out.println(ar.getRoom());
				if(ar.getRoom() != null){
					HaveRoomArticles.add(ar);
				}
			}
			return HaveRoomArticles;
		}
		return null;
	}

	@Override
	public boolean ShareLore(String username) {
		
		return false;
	}

}
