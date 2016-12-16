package edu.gznc.cxcyzx.service.impl;

import java.io.Serializable;

import org.springframework.transaction.annotation.Transactional;

import edu.gznc.cxcyzx.dao.RoomDao;
import edu.gznc.cxcyzx.domain.Room;
import edu.gznc.cxcyzx.service.RoomService;

@Transactional
public class RoomServiceImpl implements RoomService {
	private RoomDao roomDao;
	public void setRoomDao(RoomDao roomDao) {
		this.roomDao = roomDao;
	}
	
	@Override
	public Room findByRoomId(Serializable roomId) {
		return roomDao.findById(roomId);
	}

}
