package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.MemberInfo;

public interface MemberService {
	public List<MemberInfo> searchAll();

	public MemberInfo login(MemberInfo memberDto);
	public int join(MemberInfo memberDto);

	
	public MemberInfo getMember(String userid);

	public int deleteMember(String user_id);


}
