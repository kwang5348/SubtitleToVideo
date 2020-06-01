package com.ssafy.dao;

import java.util.List;

import com.ssafy.dto.HouseDeal;

public interface HouseDealDAO {

	public List<HouseDeal> list();

	public HouseDeal detail(String no);

	public List<HouseDeal> searchDong(String word);

	public List<HouseDeal> searchApt(String word);

	
}
