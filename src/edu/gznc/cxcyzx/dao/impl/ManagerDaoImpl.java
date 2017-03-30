package edu.gznc.cxcyzx.dao.impl;


import java.util.List;

import org.springframework.stereotype.Repository;

import edu.gznc.cxcyzx.dao.ManagerDao;
import edu.gznc.cxcyzx.domain.Manager;

@Repository
public class ManagerDaoImpl extends BaseDaoImpl<Manager> implements ManagerDao {
	
//	管理者登录
	@Override
	public Manager findManager(String uName, String uPass) {
		List<Manager> managers = (List<Manager>) this.getHibernateTemplate().find("from Manager where mName = ? and mPass = ?", uName, uPass);
		Manager ma = managers.get(0);
		return ma;
	}

}
