package edu.gznc.cxcyzx.service;

import edu.gznc.cxcyzx.domain.Manager;

public interface ManagerService {
	Manager findManager(String uName, String uPass);
}
