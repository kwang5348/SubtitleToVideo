package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.MemberInfoDao;
import com.ssafy.dto.MemberInfo;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberInfoDao dao;

	@Override
	public int join(MemberInfo dto) {
		int successCnt = dao.join(dto);
		return successCnt;
	}

	@Override
	public List<MemberInfo> searchAll() {
		List<MemberInfo> list = dao.searchAllMemberInfo();
		return list;
	}

	@Override
	public MemberInfo getMember(String userid) {
		MemberInfo dto = dao.userInfo(userid);
		return dto;
	}

	@Override
	public int deleteMember(String userid) {
		int successCnt = dao.deleteMember(userid);
		return successCnt;
	}


	@Override
	public MemberInfo login(MemberInfo dto) {
		dao.login(dto);
		return dto;
	}

}
