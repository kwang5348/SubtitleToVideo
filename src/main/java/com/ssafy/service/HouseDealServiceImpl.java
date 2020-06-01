package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.HouseDealDAO;
import com.ssafy.dto.HouseDeal;

@Service
public class HouseDealServiceImpl implements HouseDealService {

	@Autowired
	HouseDealDAO dao;
	
	@Override
	public List<HouseDeal> list() {
		List<HouseDeal> list = dao.list();
		return list;
	}

	@Override
	public HouseDeal detail(String no) {
		HouseDeal dto = dao.detail(no);
		return dto;
	}

	@Override
	public List<HouseDeal> searchDong(String word) {
		List<HouseDeal> list = dao.searchDong(word);
		return list;
	}

	@Override
	public List<HouseDeal> searchApt(String word) {
		List<HouseDeal> list = dao.searchApt(word);
		return list;
	}



}
