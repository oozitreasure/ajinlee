package com.health.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.health.DTO.HoDTO;
import com.health.DTO.fiDTO;
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
	public int free_insert_proc(freeDTO fDTO) {
		
		return mainMapper.free_insert_proc(fDTO);
	}

	@Override
	public int park_insert_proc(parkDTO pDTO) {
		
		return mainMapper.park_insert_proc(pDTO);
	}

	@Override
	public List<parkDTO> getparkSearch(parkDTO pDTO) {
		
		return mainMapper.getparkSearch(pDTO);
	}

	@Override
	public List<freeDTO> getfreeSearch(freeDTO fDTO) {

		return mainMapper.getfreeSearch(fDTO);
	}

	@Override
	public List<mainDTO> getuserSearch(mainDTO uDTO) {
		
		return mainMapper.getuserSearch(uDTO);
	}


	@Override
	public void updateFree(freeDTO rDTO) {
		mainMapper.updateFree(rDTO);
	}


	@Override
	public int parkDelete(parkDTO pDTO) {
		return mainMapper.getparkDelete(pDTO);
	}


	@Override
	public int deleteUserInfo(mainDTO uDTO) {
		
		return mainMapper.deleteUserInfo(uDTO);
	}

	@Override
	public int updatePassword(mainDTO uDTO) {

		return mainMapper.updatePassword(uDTO);
	}

	@Override
	public parkDTO getPark(String admin_no) {
		
		return mainMapper.getPark(admin_no);
	}

	@Override
	public freeDTO getFree(String fr_no) {
		
		return mainMapper.getFree(fr_no);
	}

	@Override
	public void getfreeDelete(String fr_no) {
		mainMapper.getfreeDelete(fr_no);
		
	}

	@Override
	public int getfreeDelete(freeDTO pDTO) {

		return mainMapper.getfreeDelete(pDTO);
	}

	@Override
	public void getparkDelete(String admin_no) {
		mainMapper.getparkDelete(admin_no);
		
	}

	@Override
	public int getparkDelete(parkDTO pDTO) {

		return mainMapper.getparkDelete(pDTO);
	}



	@Override
	public void apark_update(parkDTO fDTO) {
		mainMapper.apark_update(fDTO);
		
	}

	@Override
	public void favoriteInsert(HoDTO hDTO) {
		mainMapper.favoriteInsert(hDTO);
		
	}

	@Override
	public int favoriteDelete(HoDTO hDTO) {
		
		return mainMapper.favoriteDelete(hDTO);
	}

	@Override
	public int getUseridCheck(mainDTO uDTO) {

		return mainMapper.getUseridCheck(uDTO);
	}

	@Override
	public HoDTO favoriteSelectList(HoDTO hDTO) {
	
		return mainMapper.favoriteSelectList(hDTO);
	}

	@Override
	public List<fiDTO> list(fiDTO fiDTO) {

		return mainMapper.list(fiDTO);
	}

	@Override
	public int insert(fiDTO fiDTO) {
		
		return mainMapper.insert(fiDTO);
	}


}