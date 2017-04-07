package edu.gznc.cxcyzx.dao;

import java.util.List;

import edu.gznc.cxcyzx.domain.Room;
import edu.gznc.cxcyzx.domain.User;

public interface UserDao extends BaseDao<User>{
	User login(User user);
	boolean checkUser(String name);
	List<Room> findAllRoom();
	void save(User user);
	void update(User user);
	User findByUserName(String Name);
}
