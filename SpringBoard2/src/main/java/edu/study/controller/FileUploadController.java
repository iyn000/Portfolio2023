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
		
		//��ġ ���� ��������
		
		//������
		String path = "C:\\Users\\714\\Documents\\workspace-sts-3.9.13.RELEASE\\SpringBoard2\\src\\main\\webapp\\resources\\uploadFile";
		
		//��ġ ������ �����ϴ��� Ȯ��, io�� import
		File dir = new File(path);
		if(!dir.exists()) { //������ ���� ���
			dir.mkdirs(); //��������, ���������� �� �����
		}
		
		if(!file1.getOriginalFilename().isEmpty() ) { //�Ķ���� ������ �����ϴ� ���
			file1.transferTo(new File(path, file1.getOriginalFilename()) ); //���� �̸�����
		}
		
		if(!file2.getOriginalFilename().isEmpty() ) { //�Ķ���� ������ �����ϴ� ���
			file1.transferTo(new File(path, file2.getOriginalFilename()) ); //���� �̸�����
			
		}
		
		
		String newFileName = "";
		if(!file3.getOriginalFilename().isEmpty() ) { //�Ķ���� ������ �����ϴ� ���
			
			String FileName = System.currentTimeMillis()+file3.getOriginalFilename();
			file3.transferTo(new File(path, newFileName) ); //�����̸��� �����ϴ� ���
			
			//���ϸ� �ѱ� ���� ���� ���ڵ� ����
			newFileName = new String(FileName.getBytes("UTF-8"),"8859_1");
		}
		
		
		
		return "redirect:/upload/ex01.do?uploadFileName="+file1.getOriginalFilename();
	}

	
	
	
	
}
