package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.PhonesDTO;
import com.ssafy.dto.UserInfoDTO;

public interface PhoneService {

	public int regist(PhonesDTO dto);

	public List<PhonesDTO> list();

	public PhonesDTO detail(String num);

	public int deleteArr(String[] hid_chk);

	public int login(UserInfoDTO dto);

}
