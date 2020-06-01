package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.PhoneDAO;
import com.ssafy.dto.PhonesDTO;
import com.ssafy.dto.UserInfoDTO;

@Service
public class PhoneServiceImpl implements PhoneService {

	@Autowired
	PhoneDAO dao;

	@Override
	public int regist(PhonesDTO dto) {
		int successCnt = dao.regist(dto);
		return successCnt;
	}

	@Override
	public List<PhonesDTO> list() {
		List<PhonesDTO> list = dao.list();
		return list;
	}

	@Override
	public PhonesDTO detail(String num) {
		PhonesDTO dto = dao.detail(num);
		return dto;
	}

	@Override
	public int deleteArr(String[] hid_chk) {
		int successCnt = dao.deleteArr(hid_chk);
		return successCnt;
	}

	@Override
	public int login(UserInfoDTO dto) {
		int loginCnt = dao.login(dto);
		return loginCnt;
	}

}
