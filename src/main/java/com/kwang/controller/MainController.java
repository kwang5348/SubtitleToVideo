package com.kwang.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kwang.service.VideoTranslateService;

@Controller
public class MainController {

	@Autowired
	VideoTranslateService service;

	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String moveMain() {
		System.out.println("main 호출 성공");
		return "index";//jsp 호출
	}

	@RequestMapping(value = "/fileupload", method = RequestMethod.POST)
	public String uploadFile(HttpServletRequest request, @RequestParam("filename") MultipartFile mfile) throws Exception {
		System.out.println("uploadFile 호출 성공");
		service.uploadFile(mfile);
		System.out.println("uploadFile 완료");
		return "index";//jsp 호출
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String translateTest() {
		System.out.println("test 시작");
		try {
			String path = "gs://saveaudio/resource/output.wav";
			service.asyncRecognizeWords(path);;
		} catch (Exception e){
			System.out.println("파일 번역 실패");
		}
		System.out.println("test 완료");
		
		return "index";//jsp 호출
	}
	
}






