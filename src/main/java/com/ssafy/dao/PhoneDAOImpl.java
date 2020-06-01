package com.ssafy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.PhonesDTO;
import com.ssafy.dto.UserInfoDTO;

@Repository
public class PhoneDAOImpl implements PhoneDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int regist(PhonesDTO dto) {
		int successCnt = sqlSession.insert("PhoneMapper.regist", dto);
		return successCnt;
	}

	@Override
	public List<PhonesDTO> list() {
		List<PhonesDTO> list = sqlSession.selectList("PhoneMapper.list");
		return list;
	}

	@Override
	public PhonesDTO detail(String num) {
		PhonesDTO dto = sqlSession.selectOne("PhoneMapper.detail", num);
		return dto;
	}

	@Override
	public int deleteArr(String[] hid_chk) {
		int successCnt = sqlSession.delete("PhoneMapper.deleteArr", hid_chk);
		return successCnt;
	}

	@Override
	public int login(UserInfoDTO dto) {
		System.out.println("!!!!!!!!!!!!"+dto.getId() + " : " + dto.getPw());
		int loginCnt = sqlSession.selectOne("UserInfoMapper.login", dto);
		return loginCnt;
	}

}
