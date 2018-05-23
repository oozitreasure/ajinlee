package com.health.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.health.DTO.mainDTO;
import com.health.DTO.parkDTO;
import com.health.persistence.mapper.MainMapper;
import com.health.service.IMainService;

@Service("MainService")
public class MainService implements IMainService {
		
	@Resource(name="MainMapper")
	private MainMapper mainMapper;

	public int insertJoin(mainDTO mDTO) {
		
		return mainMapper.insertJoin(mDTO);
	}

	@Override
	public mainDTO getUserInfo(mainDTO gDTO) {
		
		return mainMapper.getUserInfo(gDTO);
	}

	@Override
	public mainDTO getUserid(mainDTO uDTO) {
		
		return mainMapper.getUserid(uDTO);
	}

	@Override
	public mainDTO getUserInfoOne(String user_no) {
		
		return mainMapper.getUserInfoOne(user_no);
	}

	@Override
	public int updateUserInfo(mainDTO pDTO) {
		
		return mainMapper.getupdateUserInfo(pDTO);
	}

	@Override
	public int deleteUserInfo(mainDTO dDTO) {
	
		return mainMapper.deleteUserInfo(dDTO);
	}

	@Override
	public List<mainDTO> getUserList() {
		
		return mainMapper.getUserList();
	}

	@Override
	public List<parkDTO> getParkList() {

		return mainMapper.getParkList();
	}


		
}