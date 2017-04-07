package edu.gznc.cxcyzx.service.impl;

import java.io.Serializable;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.gznc.cxcyzx.dao.RoomDao;
import edu.gznc.cxcyzx.domain.Room;
import edu.gznc.cxcyzx.service.RoomService;
import edu.gznc.cxcyzx.utils.JedisUtils;
import redis.clients.jedis.Jedis;

@Transactional
@Service
public class RoomServiceImpl implements RoomService {
	@Resource
	private RoomDao roomDao;
	
	@Override
	public Room findByRoomId(Serializable roomId) {
		return roomDao.findById(roomId);
	}

	@Override
	public Room findRoomByName(String name) {
		return roomDao.findRoomByName(name);
	}

	@Override
	public void updateRoom(Room room) {
		Jedis jdis = JedisUtils.getJedis();
		jdis.del("roomList");//删除缓存，以便更新缓存
		roomDao.update(room);
	}

}
