package com.health.persistence.mapper;

import com.health.DTO.mainDTO;
import com.health.config.Mapper;


@Mapper("MainMapper")
public interface MainMapper {

	int insertJoin(mainDTO mDTO);

	mainDTO getUserInfo(mainDTO gDTO);

	mainDTO getUserid(mainDTO uDTO);

	mainDTO getUserInfoOne(String user_no);
	

}