package com.ssafy.dao;

import java.util.List;

import com.ssafy.dto.MemberInfo;

public interface MemberInfoDao {


	public List<MemberInfo> searchAllMemberInfo();
	public int login(MemberInfo memberDto);

	public int join(MemberInfo memberDto);
	public void modifyMember(MemberInfo memberDto);
	public int deleteMember(String user_id);
	public MemberInfo userInfo(String user_id);
	


}
