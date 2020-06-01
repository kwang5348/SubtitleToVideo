package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.HouseDeal;

public interface HouseDealService {
	
	public List<HouseDeal> list();

	public HouseDeal detail(String no);

	public List<HouseDeal> searchDong(String word);

	public List<HouseDeal> searchApt(String word);

}
