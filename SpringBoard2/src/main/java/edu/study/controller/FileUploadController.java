package edu.study.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping(value="/upload")
@Controller
public class FileUploadController {
	
	@RequestMapping(value="/ex01.do")
	public String ex01() {
		
		
		return "upload/uploadEx";
		
		
	}
	
	@RequestMapping(value="/upload.do",method=RequestMethod.POST)
	public String upload(MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IllegalStateException, IOException{
		
		//위치 정보 가져오기
		
		//절대경로
		String path = "C:\\Users\\714\\Documents\\workspace-sts-3.9.13.RELEASE\\SpringBoard2\\src\\main\\webapp\\resources\\uploadFile";
		
		//위치 폴더가 존재하는지 확인, io로 import
		File dir = new File(path);
		if(!dir.exists()) { //폴더가 없을 경우
			dir.mkdirs(); //폴더생성, 순차적으로 다 만든다
		}
		
		if(!file1.getOriginalFilename().isEmpty() ) { //파라미터 파일이 존재하는 경우
			file1.transferTo(new File(path, file1.getOriginalFilename()) ); //파일 이름변경
		}
		
		if(!file2.getOriginalFilename().isEmpty() ) { //파라미터 파일이 존재하는 경우
			file1.transferTo(new File(path, file2.getOriginalFilename()) ); //파일 이름변경
			
		}
		
		
		String newFileName = "";
		if(!file3.getOriginalFilename().isEmpty() ) { //파라미터 파일이 존재하는 경우
			
			String FileName = System.currentTimeMillis()+file3.getOriginalFilename();
			file3.transferTo(new File(path, newFileName) ); //파일이름을 변경하는 경우
			
			//파일명 한글 오류 관련 인코딩 변경
			newFileName = new String(FileName.getBytes("UTF-8"),"8859_1");
		}
		
		
		
		return "redirect:/upload/ex01.do?uploadFileName="+file1.getOriginalFilename();
	}

	
	
	
	
}
