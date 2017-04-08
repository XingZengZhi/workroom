package edu.gznc.cxcyzx.service.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
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
import net.sf.json.JsonConfig;
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
			JsonConfig config = new JsonConfig();
			config.setExcludes(new String[]{"users","articles","videos","images"});
			jedis.set("roomList",JSONArray.fromObject(list, config).toString());
		}
		String roomlist = jedis.get("roomList");
		jedis.close();
		return roomlist;
	}


	@Override
	public void update(User user) {
		userDao.update(user);
	}

	@Override
	public void save(User user) {
		userDao.save(user);
	}

	@Override
	public Integer Count(DetachedCriteria dc) {
		return userDao.Count(dc);
	}

	@Override
	public List<User> findByPage(DetachedCriteria dc, Integer begin, Integer pageSize) {
		return userDao.findByPage(dc, begin, pageSize);
	}

	@Override
	public User findByUserName(String Name) {
		return userDao.findByUserName(Name);
	}

	@Override
	public void deleteUser(User user) {
		userDao.delete(user);
	}

}
