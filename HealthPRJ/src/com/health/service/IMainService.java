package com.health.service;

import java.util.List;

import com.health.DTO.freeDTO;
import com.health.DTO.mainDTO;
import com.health.DTO.parkDTO;

public interface IMainService {

	int insertJoin(mainDTO mDTO);

	mainDTO getUserInfo(mainDTO gDTO);

	mainDTO getUserid(mainDTO uDTO);
	
	mainDTO getPassword(mainDTO kDTO);

	mainDTO getUserInfoOne(String user_no);

	int updateUserInfo(mainDTO pDTO);

	int deleteUserInfo(mainDTO dDTO);

	List<mainDTO> getUserList();

	List<parkDTO> getParkList();

	List<freeDTO> getFreeList();

	freeDTO getFree(String fr_no);

	parkDTO getPark(String admin_no);

	int free_insert_proc(freeDTO fDTO);

	int park_insert_proc(parkDTO pDTO);

	int updatePassword(mainDTO uDTO);

	void updateFree(freeDTO rDTO);

	List<parkDTO> getparkSearch(parkDTO pDTO);

	List<freeDTO> getfreeSearch(freeDTO fDTO);

	List<mainDTO> getuserSearch(mainDTO uDTO);

	void delete_user(mainDTO uDTO);

	void apark_update(parkDTO fDTO);

	
}