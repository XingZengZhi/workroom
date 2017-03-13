package edu.gznc.cxcyzx.service.impl;

import java.io.Serializable;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.gznc.cxcyzx.dao.RoomDao;
import edu.gznc.cxcyzx.domain.Room;
import edu.gznc.cxcyzx.service.RoomService;

@Transactional
@Service
public class RoomServiceImpl implements RoomService {
	@Resource
	private RoomDao roomDao;
	
	@Override
	public Room findByRoomId(Serializable roomId) {
		return roomDao.findById(roomId);
	}

}
