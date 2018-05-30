package com.health.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.health.DTO.freeDTO;
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

	@Override
	public List<freeDTO> getFreeList() {
		
		return mainMapper.getFreeList();
	}

	@Override
	public mainDTO getPassword(mainDTO kDTO) {
		
		return mainMapper.getPassword(kDTO);
	}

	@Override
	public freeDTO getFree(String fr_no) {
		
		return mainMapper.getFree(fr_no);
	}

	@Override
	public parkDTO getPark(String admin_no) {
		
		return mainMapper.getPark(admin_no);
	}

	@Override
	public int free_insert_proc(freeDTO fDTO) {
		
		return mainMapper.free_insert_proc(fDTO);
	}

	@Override
	public String park_insert_proc(parkDTO pDTO) {
		
		return mainMapper.park_insert_proc(pDTO);
	}

	@Override
	public int updatePassword(mainDTO uDTO) {

		return mainMapper.updatePassword(uDTO);
	}
		
}