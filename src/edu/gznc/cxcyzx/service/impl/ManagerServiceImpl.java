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
	//查找管理员
	@Override
	public Manager findManager(String uName, String uPass) {
		Manager ma = mDao.findManager(uName, uPass);
		return ma;
	}
	//新增管理员
	@Override
	public void save(Manager manager) {
		mDao.save(manager);
	}
	//保存或更新管理者
	@Override
	public void saveOrupdate(Manager manager) {
		mDao.saveOrupdate(manager);
	}

}
