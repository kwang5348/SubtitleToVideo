package com.kwang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

//	@Autowired
//	MemberService service;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String moveMain() {
		System.out.println("main 호출 성공");
		return "index";//jsp 호출
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String moveLogin() {
		return "upload";//jsp 호출
	}
	
}






