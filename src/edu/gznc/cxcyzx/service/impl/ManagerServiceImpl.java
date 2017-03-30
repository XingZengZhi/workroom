package edu.gznc.cxcyzx.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.gznc.cxcyzx.dao.ManagerDao;
import edu.gznc.cxcyzx.domain.Manager;
import edu.gznc.cxcyzx.service.ManagerService;

@Transactional
@Service
public class ManagerServiceImpl implements ManagerService {
	@Resource
	private ManagerDao mDao;
	
	@Override
	public Manager findManager(String uName, String uPass) {
		Manager ma = mDao.findManager(uName, uPass);
		return ma;
	}

}
