package edu.gznc.cxcyzx.dao;

import edu.gznc.cxcyzx.domain.Room;


public interface RoomDao extends BaseDao<Room> {
	Room findRoomByName(String name);
}
