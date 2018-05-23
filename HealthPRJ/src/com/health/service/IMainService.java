package com.health.service;

import java.util.List;

import com.health.DTO.mainDTO;
import com.health.DTO.parkDTO;

public interface IMainService {

	int insertJoin(mainDTO mDTO);

	mainDTO getUserInfo(mainDTO gDTO);

	mainDTO getUserid(mainDTO uDTO);

	mainDTO getUserInfoOne(String user_no);

	int updateUserInfo(mainDTO pDTO);

	int deleteUserInfo(mainDTO dDTO);

	List<mainDTO> getUserList();

	List<parkDTO> getParkList();

	
}