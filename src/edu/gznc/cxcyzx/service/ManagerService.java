package edu.gznc.cxcyzx.service;

import edu.gznc.cxcyzx.domain.Manager;

public interface ManagerService {
	Manager findManager(String uName, String uPass);
	void save(Manager manager);
	void saveOrupdate(Manager manager);
}
