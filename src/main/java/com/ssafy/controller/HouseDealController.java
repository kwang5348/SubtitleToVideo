package com.ssafy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.dto.HouseDeal;
import com.ssafy.service.HouseDealService;

@Controller
public class HouseDealController {
	
	@Autowired
	HouseDealService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		List<HouseDeal> list = service.list();
		model.addAttribute("house_list", list);
		return "housedeal/list";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam String no) {
		HouseDeal dto = service.detail(no);
		model.addAttribute("house", dto);
		return "housedeal/detail";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(Model model, String key, String word) {
		List<HouseDeal> list = null;
		String result;
		if(key.equals("dong")) {
			list = service.searchDong(word);
			model.addAttribute("house_list", list);
			model.addAttribute("result", word);
		} else if(key.equals("AptName")){
			list = service.searchApt(word);
			model.addAttribute("house_list", list);
			model.addAttribute("result", word);
		}
		
		return "housedeal/list";
	}
	
}
