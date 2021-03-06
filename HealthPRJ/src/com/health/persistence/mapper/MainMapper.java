package com.health.persistence.mapper;

import java.util.List;

import com.health.DTO.HoDTO;
import com.health.DTO.fiDTO;
import com.health.DTO.freeDTO;
import com.health.DTO.mainDTO;
import com.health.DTO.parkDTO;
import com.health.DTO.piDTO;
import com.health.config.Mapper;


@Mapper("MainMapper")
public interface MainMapper {

	int insertJoin(mainDTO mDTO);

	mainDTO getUserInfo(mainDTO gDTO);

	mainDTO getUserid(mainDTO uDTO);

	mainDTO getUserInfoOne(String user_no);

	int getupdateUserInfo(mainDTO pDTO);

	List<mainDTO> getUserList();

	List<parkDTO> getParkList();

	List<freeDTO> getFreeList();

	mainDTO getPassword(mainDTO kDTO);

	freeDTO getFree(String fr_no);

	parkDTO getPark(String admin_no);

	int free_insert_proc(freeDTO fDTO);

	int park_insert_proc(parkDTO pDTO);

	List<parkDTO> getparkSearch(parkDTO pDTO);

	List<freeDTO> getfreeSearch(freeDTO fDTO);

	List<mainDTO> getuserSearch(mainDTO uDTO);

	void updateFree(freeDTO rDTO);

	int deleteUserInfo(mainDTO uDTO);

	int updatePassword(mainDTO uDTO);

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

	List<piDTO> plist(piDTO piDTO);

	int pinsert(piDTO piDTO);

	int pupdate(piDTO piDTO);

	int pdelete(int prc_no);





}