package com.health.persistence.mapper;

import java.util.List;

import com.health.DTO.mainDTO;
import com.health.DTO.parkDTO;
import com.health.config.Mapper;


@Mapper("MainMapper")
public interface MainMapper {

	int insertJoin(mainDTO mDTO);

	mainDTO getUserInfo(mainDTO gDTO);

	mainDTO getUserid(mainDTO uDTO);

	mainDTO getUserInfoOne(String user_no);

	int getupdateUserInfo(mainDTO pDTO);

	int deleteUserInfo(mainDTO dDTO);

	List<mainDTO> getUserList();

	List<parkDTO> getParkList();
	

}