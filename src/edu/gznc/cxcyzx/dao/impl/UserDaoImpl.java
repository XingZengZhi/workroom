package edu.gznc.cxcyzx.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import edu.gznc.cxcyzx.dao.UserDao;
import edu.gznc.cxcyzx.domain.Room;
import edu.gznc.cxcyzx.domain.User;

@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

	// 用户登录
	@Override
	public User login(User user) {
		List<User> list = (List<User>) this.getHibernateTemplate().find("from User where userName = ? and userPassword = ?", user.getUserName(),user.getUserPassword());
		if(list.size() > 0){
			return list.get(0);
		}
		return null;
	}
	// 检查用户名是否存在
	@Override
	public boolean checkUser(String name) {
		List<User> list = (List<User>)this.getHibernateTemplate().find("from User where userName = ?", name);
		if(list.size() > 0){
			return true;
		}
		return false;
	}
	@Override
	public List<Room> findAllRoom() {
		List<Room> list = (List<Room>) this.getHibernateTemplate().find("from Room");
		return list;
	}
	@Override
	public void update(User user) {
		super.update(user);
	}

}
