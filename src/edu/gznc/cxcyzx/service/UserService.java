package edu.gznc.cxcyzx.service;

import java.io.Serializable;

import edu.gznc.cxcyzx.domain.Room;
import edu.gznc.cxcyzx.domain.User;

public interface UserService {
	User login(User user);
	void registe(User user);
	boolean checkUser(String name);
	String findAllRoom();
	User findByUserId(Serializable userId);
	void update(User user);
	void save(User user);
}
