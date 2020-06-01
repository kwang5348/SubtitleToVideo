package com.ssafy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.MemberInfo;

@Repository
public class MemberInfoDaoImpl implements MemberInfoDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int join(MemberInfo dto) {
		int successCnt = sqlSession.insert("memberinfo-mapper.join", dto);
		return successCnt;
	}

	@Override
	public List<MemberInfo> searchAllMemberInfo() {
		List<MemberInfo> list = sqlSession.selectList("memberinfo-mapper.list");
		return list;
	}


	@Override
	public int login(MemberInfo dto) {
		System.out.println("!!!!!!!!!!!!"+dto.getUser_id() + " : " + dto.getUser_pw());
		int loginCnt = sqlSession.selectOne("memberinfo-mapper.login", dto);
		return loginCnt;
	}

	@Override
	public void modifyMember(MemberInfo memberDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int deleteMember(String id) {
		int successCnt = sqlSession.delete("memberinfo-mapper.delete", id);
		return successCnt;		
	}

	@Override
	public MemberInfo userInfo(String id) {
		MemberInfo dto = sqlSession.selectOne("memberinfo-mapper.detail", id);
		return dto;
	}

}
