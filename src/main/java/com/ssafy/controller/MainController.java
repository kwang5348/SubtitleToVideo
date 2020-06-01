package com.ssafy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.dto.MemberInfo;
import com.ssafy.service.MemberService;

@Controller
public class MainController {

	// test 
	
	@Autowired
	MemberService service;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String moveMain() {
		return "index";//jsp 호출
	}
	
	@RequestMapping(value = "/mvlogin", method = RequestMethod.GET)
	public String moveLogin() {
		return "user/login";//jsp 호출
	}
	
	@RequestMapping(value = "/mvjoin", method = RequestMethod.GET)
	public String moveJoin() {
		return "user/join";//jsp 호출
	}
	
	@RequestMapping(value = "/mvuserinfo", method = RequestMethod.GET)
	public String moveUserInfo() {
		return "user/userinfo";//jsp 호출
	}
	
	@RequestMapping(value = "/mvmodify", method = RequestMethod.GET)
	public String moveModify() {
		return "user/modifyuserinfo";//jsp 호출
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		List<MemberInfo> list = service.searchAll();
		System.out.println(list.size());

		model.addAttribute("userlist", list);
		return "user/userlist";//jsp 호출
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String regist(@ModelAttribute MemberInfo dto) {//@ModelAttribute 생략 가능 : 파라미터 여러개를 한 번에 VO로 받기
		int successCnt = service.join(dto);
		return "index";//jsp 호출
	}

	@RequestMapping(value = "/deleteuser/{id}")
	public String delete(@PathVariable String id) {
		int successCnt = service.deleteMember(id);
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute MemberInfo dto, HttpSession session) {
		MemberInfo login = service.login(dto);
		System.out.println(dto.getUser_id());
		if(login != null) {
			session.setAttribute("userinfo", login);
		}
		return "index";//jsp 호출
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";//jsp 호출
	}
}






