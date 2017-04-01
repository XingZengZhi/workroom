package edu.gznc.cxcyzx.dao.impl;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import edu.gznc.cxcyzx.dao.ManagerDao;
import edu.gznc.cxcyzx.domain.Manager;

@Repository
public class ManagerDaoImpl extends BaseDaoImpl<Manager> implements ManagerDao {
	
//	管理者登录
	@Override
	public Manager findManager(String uName, String uPass) {
		List<Manager> managers = null;
		DetachedCriteria deta = DetachedCriteria.forClass(Manager.class);
		deta.add(Restrictions.eq("mName", uName));
		if(uPass != ""){
			deta.add(Restrictions.eq("mPass", uPass));
		}
		managers = (List<Manager>) this.getHibernateTemplate().findByCriteria(deta);
		if(managers.size() == 0){
			return null;
		}
		return managers.get(0);
	}

}
