package com.ssafy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.dto.PhonesDTO;
import com.ssafy.dto.UserInfoDTO;
import com.ssafy.service.PhoneService;

@Controller
public class MainController {

	@Autowired
	PhoneService service;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String moveMain() {
		return "index";//jsp 호출
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		List<PhonesDTO> list = service.list();
		model.addAttribute("hpList", list);
		return "PhoneList";//jsp 호출
	}

	@RequestMapping(value = "/mvRegist", method = RequestMethod.GET)
	public String moveRegist() {
		return "PhoneReg";//jsp 호출
	}

	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String regist(@ModelAttribute PhonesDTO dto) {//@ModelAttribute 생략 가능 : 파라미터 여러개를 한 번에 VO로 받기
		int successCnt = service.regist(dto);
		return "Result";//jsp 호출
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam String num) {//@RequestParam 생략 가능 : 한번에 파라미터 하나 받기.
		PhonesDTO dto = service.detail(num);
		model.addAttribute("hpDTO", dto);
		return "PhoneView";//jsp 호출
	}

	@RequestMapping(value = "/deleteArr", method = RequestMethod.POST)
	public String deleteArr(String [] hid_chk) {
		int successCnt = service.deleteArr(hid_chk);
		return "redirect:/list";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute UserInfoDTO dto, HttpSession session) {
		int loginCnt = service.login(dto);
		if(loginCnt > 0) {
			session.setAttribute("userid", dto.getId());
		}
		return "index";//jsp 호출
	}

}






