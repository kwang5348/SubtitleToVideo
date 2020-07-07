package com.kwang.service;

import org.springframework.web.multipart.MultipartFile;

public interface VideoTranslateService {
	public void uploadFile(MultipartFile uploadFile) throws Exception;
	public void asyncRecognizeWords(String gcsUri) throws Exception;
}
