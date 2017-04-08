package edu.gznc.cxcyzx.service.impl;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import edu.gznc.cxcyzx.dao.ImageDao;
import edu.gznc.cxcyzx.domain.Image;
import edu.gznc.cxcyzx.service.ImageService;

@Transactional
public class ImageServiceImpl implements ImageService {
	@Resource
	ImageDao imageDao;

	@Override
	public void save(Image image) {
		imageDao.save(image);
	}

}
