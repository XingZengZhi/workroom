package edu.gznc.cxcyzx.service;

import java.io.Serializable;

import edu.gznc.cxcyzx.domain.Room;

public interface RoomService {
	public Room findByRoomId(Serializable roomId);
}
