package edu.gznc.cxcyzx.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.gznc.cxcyzx.dao.VideoDao;
import edu.gznc.cxcyzx.domain.Video;
import edu.gznc.cxcyzx.service.VideoService;
import edu.gznc.cxcyzx.utils.JedisUtils;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import redis.clients.jedis.Jedis;

@Transactional
@Service
public class VideoServiceImpl implements VideoService {
	@Resource
	private VideoDao videoDao;
	
	@Override
	public String findAllVideo() {
		Jedis jedis = JedisUtils.getJedis();
		if(jedis.get("videos") == null){
			List<Video> videos = videoDao.findAll();
			JsonConfig config = new JsonConfig();
			config.setExcludes(new String[]{"room"});
			jedis.set("videos", JSONArray.fromObject(videos,config).toString());
		}
		return jedis.get("videos");
	}

}
