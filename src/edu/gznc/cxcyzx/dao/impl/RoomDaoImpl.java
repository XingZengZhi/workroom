package edu.gznc.cxcyzx.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import edu.gznc.cxcyzx.dao.RoomDao;
import edu.gznc.cxcyzx.domain.Room;

@Repository
public class RoomDaoImpl extends BaseDaoImpl<Room> implements RoomDao{

	@Override
	public Room findRoomByName(String name) {
		List<Room> rooms = (List<Room>) this.getHibernateTemplate().find("from Room where roomName = ?", name);
		if(rooms.size() > 0){
			return rooms.get(0);
		}
		return null;
	}
	
}
