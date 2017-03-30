package edu.gznc.cxcyzx.dao;

import edu.gznc.cxcyzx.domain.Manager;

public interface ManagerDao extends BaseDao<Manager> {
	Manager findManager(String uName, String uPass);
}
