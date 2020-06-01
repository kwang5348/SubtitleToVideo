package com.ssafy.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.HouseDeal;

@Repository
public class HouseDealDAOImpl implements HouseDealDAO {

	@Autowired
	SqlSession sqlSession;
	
	RowBounds bounds = new RowBounds(0, 50);
	
	@Override
	public List<HouseDeal> list() {
		List<HouseDeal> list = sqlSession.selectList("HouseDealMapper.list", null, bounds);
		return list;
	}

	@Override
	public HouseDeal detail(String no) {
		HouseDeal dto = sqlSession.selectOne("HouseDealMapper.detail", no);
		return dto;
	}

	@Override
	public List<HouseDeal> searchDong(String word) {
		List<HouseDeal> list = sqlSession.selectList("HouseDealMapper.searchDong", word, bounds);
		return list;
	}

	@Override
	public List<HouseDeal> searchApt(String word) {
		List<HouseDeal> list = sqlSession.selectList("HouseDealMapper.searchApt", word, bounds);
		return list;
	}


}
