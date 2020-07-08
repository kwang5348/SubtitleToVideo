package com.kwang.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kwang.service.VideoTranslateService;
import com.kwang.stt.InfiniteStreamRecognize;
import com.kwang.stt.Recognize;

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
		String videoPath = null;
		String audioPath = null;
		try {
			System.out.println("upload service 전송 성공");
			videoPath = service.uploadFile(mfile);		
		} catch (Exception e) {
			System.out.println("upload serivce 호출 실패");
			e.printStackTrace();
		}
		
		if(videoPath == null) {
			System.out.println("video 파일을 찾을 수 없습니다.");
			return "index";
		}
		
		try {
			System.out.println("convertToAudio service 호출 성공");
			audioPath = service.convertToAudio(videoPath);
		}catch (Exception e) {
			System.out.println("convertToAudio serivce 호출 실패");
			e.printStackTrace();
		}
		
		System.out.println("uploadFile 완료");
		
		if(audioPath == null) {
			System.out.println("audio 파일을 찾을 수 없습니다.");
			return "index";
		}
		
		try {
			System.out.println("make smi 호출 성공");
			String path = "gs://saveaudio/temp.wav";
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("make smi호출 실패");
			
		}
		return "index";//jsp 호출
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String translateTest() {
		System.out.println("test 시작");
		InfiniteStreamRecognize infrec = new InfiniteStreamRecognize();
		try {
			String path = "gs://saveaudio/resource/output.wav";
			for (int i = 0; i < 10; i++) {				
				infrec.infiniteStreamingRecognize("en-US");
			}
		} catch (Exception e){
			System.out.println("파일 번역 실패");
			e.printStackTrace();
		}
		System.out.println("test 완료");
		
		return "index";//jsp 호출
	}
	
}






