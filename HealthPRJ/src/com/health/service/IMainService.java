package com.health.service;

import java.util.List;

import com.health.DTO.HoDTO;
import com.health.DTO.fiDTO;
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
	
	List<mainDTO> getUserList();

	List<parkDTO> getParkList();

	List<freeDTO> getFreeList();

	freeDTO getFree(String fr_no);

	int free_insert_proc(freeDTO fDTO);

	int park_insert_proc(parkDTO pDTO);

	void updateFree(freeDTO rDTO);

	List<parkDTO> getparkSearch(parkDTO pDTO);

	List<freeDTO> getfreeSearch(freeDTO fDTO);

	List<mainDTO> getuserSearch(mainDTO uDTO);

	int parkDelete(parkDTO pDTO);

	int deleteUserInfo(mainDTO uDTO);

	int updatePassword(mainDTO uDTO);

	parkDTO getPark(String admin_no);

	void getfreeDelete(String fr_no);

	int getfreeDelete(freeDTO pDTO);

	void getparkDelete(String admin_no);

	int getparkDelete(parkDTO pDTO);


	void apark_update(parkDTO fDTO);

	void favoriteInsert(HoDTO hDTO);

	int favoriteDelete(HoDTO hDTO);

	int getUseridCheck(mainDTO uDTO);

	HoDTO favoriteSelectList(HoDTO hDTO);

	List<fiDTO> list(fiDTO fiDTO);

	int insert(fiDTO fiDTO);

	List<HoDTO> getFavoriteList(String user_no);

	List<freeDTO> freeMoreView(freeDTO fDTO);

	int delete(int frc_no);

	int update(fiDTO fiDTO);

	List<HoDTO> getChart(String user_no);

	void updateFreeCnt(freeDTO rDTO);


	
}