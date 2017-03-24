package edu.gznc.cxcyzx.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import edu.gznc.cxcyzx.dao.UserDao;
import edu.gznc.cxcyzx.domain.Room;
import edu.gznc.cxcyzx.domain.User;
import edu.gznc.cxcyzx.service.UserService;
import edu.gznc.cxcyzx.utils.JedisUtils;
import edu.gznc.cxcyzx.utils.MD5Utils;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import redis.clients.jedis.Jedis;

@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	
	@Override
	public User login(User user) {
		user.setUserPassword(MD5Utils.md5(user.getUserPassword()));
		return userDao.login(user);
	}

	@Override
	public void registe(User user) {
		user.setUserPassword(MD5Utils.md5(user.getUserPassword()));
		userDao.save(user);
	}

	// 检查用户名是否存在
	@Override
	public boolean checkUser(String name) {
		return userDao.checkUser(name);
	}
	
	@Override
	public User findByUserId(Serializable userId) {
		return userDao.findById(userId);
	}
	
	@Override
	public String findAllRoom() {
		Jedis jedis = JedisUtils.getJedis();
		if(jedis.get("roomList") == null){
			List<Room> list = userDao.findAllRoom();
			jedis.set("roomList",JSONArray.fromObject(list).toString());
		}
		return jedis.get("roomList");
	}


	@Override
	public void updataUser(User user) {
		userDao.update(user);
	}

	@Override
	public void save(User user) {
		userDao.save(user);
	}

}
