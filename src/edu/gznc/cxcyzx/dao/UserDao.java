package edu.gznc.cxcyzx.dao;

import java.util.List;

import edu.gznc.cxcyzx.domain.Room;
import edu.gznc.cxcyzx.domain.User;

public interface UserDao extends BaseDao<User>{
	public User login(User user);
	public boolean checkUser(String name);
	public List<Room> findAllRoom();
	public void save(User user);
}
