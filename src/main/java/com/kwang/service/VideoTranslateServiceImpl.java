package com.kwang.service;

import java.io.File;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.api.gax.longrunning.OperationFuture;
import com.google.cloud.speech.v1.LongRunningRecognizeMetadata;
import com.google.cloud.speech.v1.LongRunningRecognizeResponse;
import com.google.cloud.speech.v1.RecognitionAudio;
import com.google.cloud.speech.v1.RecognitionConfig;
import com.google.cloud.speech.v1.RecognitionConfig.AudioEncoding;
import com.google.cloud.speech.v1.SpeechClient;
import com.google.cloud.speech.v1.SpeechRecognitionAlternative;
import com.google.cloud.speech.v1.SpeechRecognitionResult;
import com.google.cloud.speech.v1.WordInfo;


@Service
public class VideoTranslateServiceImpl implements VideoTranslateService {

	@Override
	public void asyncRecognizeWords(String gcsUri) throws Exception {
		// Instantiates a client with GOOGLE_APPLICATION_CREDENTIALS
		try (SpeechClient speech = SpeechClient.create()) {

			// Configure remote file request for FLAC
			RecognitionConfig config = RecognitionConfig.newBuilder().setEncoding(AudioEncoding.LINEAR16)
					.setLanguageCode("en-US").setSampleRateHertz(16000).setEnableWordTimeOffsets(true).build();
			RecognitionAudio audio = RecognitionAudio.newBuilder().setUri(gcsUri).build();

			// Use non-blocking call for getting file transcription
			OperationFuture<LongRunningRecognizeResponse, LongRunningRecognizeMetadata> response = speech
					.longRunningRecognizeAsync(config, audio);
			while (!response.isDone()) {
				System.out.println("Waiting for response...");
				Thread.sleep(10000);
			}

			List<SpeechRecognitionResult> results = response.get().getResultsList();

			for (SpeechRecognitionResult result : results) {
				// There can be several alternative transcripts for a given chunk of speech.
				// Just use the
				// first (most likely) one here.
				SpeechRecognitionAlternative alternative = result.getAlternativesList().get(0);
				System.out.printf("Transcription: %s\n", alternative.getTranscript());
				for (WordInfo wordInfo : alternative.getWordsList()) {
					System.out.println(wordInfo.getWord());
					System.out.printf("\t%s.%s sec - %s.%s sec\n", wordInfo.getStartTime().getSeconds(),
							wordInfo.getStartTime().getNanos() / 100000000, wordInfo.getEndTime().getSeconds(),
							wordInfo.getEndTime().getNanos() / 100000000);
				}
			}
		}
	}

	@Override
	public String uploadFile(MultipartFile uploadFile) throws Exception {
		try {
			//절대경로 저장
			String path = "C:\\Users\\user\\Desktop\\repo\\SubtitleToVideo\\src\\main\\resources\\static\\download\\" + uploadFile.getOriginalFilename();
			
			//상대경로 저장
			//String path = uploadFile.getOriginalFilename();
			System.out.println("upload 성공!");
			System.out.println("download 경로 : " + path);
			uploadFile.transferTo(new File(path));
			return path;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String convertToAudio(String filepath) throws Exception {
		Runtime run = Runtime.getRuntime();
		//뒤에서 .mp4 스트링을 제거하는 코드인데 입력되는 file형식이 많아지면 수정해야함
		String resultFile = filepath.substring(0, filepath.length()-4) + ".wav";
		String command = "ffmpeg -i " + filepath + " " +  resultFile;
		System.out.println(command);
		try{
		    run.exec("cmd.exe chcp 65001");  // cmd에서 한글문제로 썸네일이 만들어지지않을시 cmd창에서 utf-8로 변환하는 명령
		    run.exec(command);
		    
		}catch(Exception e){
		    System.out.println("error : "+e.getMessage());
		    e.printStackTrace();
		}
		return resultFile;
		
	}

	
}
