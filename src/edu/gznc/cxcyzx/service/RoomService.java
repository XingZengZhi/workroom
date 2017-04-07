package edu.gznc.cxcyzx.service;

import java.io.Serializable;

import edu.gznc.cxcyzx.domain.Room;

public interface RoomService {
	Room findByRoomId(Serializable roomId);
	Room findRoomByName(String name);
	void updateRoom(Room room);
}
