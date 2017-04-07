package edu.gznc.cxcyzx.service;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import edu.gznc.cxcyzx.domain.User;

public interface UserService {
	User login(User user);
	void registe(User user);
	boolean checkUser(String name);
	String findAllRoom();
	User findByUserId(Serializable userId);
	User findByUserName(String Name);
	void update(User user);
	void save(User user);
	Integer Count(DetachedCriteria dc);
	List<User> findByPage(DetachedCriteria dc, Integer begin, Integer pageSize);
	void deleteUser(User user);
}
