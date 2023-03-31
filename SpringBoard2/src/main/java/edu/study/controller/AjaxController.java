package edu.study.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.study.service.BoardService;
import edu.study.service.UserService;
import edu.study.vo.BoardVO;
import edu.study.vo.UserVO;

@RequestMapping(value="/ajax")
@Controller
public class AjaxController {

	@Autowired
	BoardService boardService;
	
	@Autowired
	UserService userService;
	
	
	
	
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String main() {
		
		return "ajax/main";
	}
	
	@ResponseBody //���䵥���ͷ� ������
	@RequestMapping(value="/ex01.do", method=RequestMethod.GET)
	public String ex01() {

		return "1";
	}
	
	@ResponseBody
	@RequestMapping(value="/ex02.do",method=RequestMethod.GET)
	public String ex02(int data1) {
		
		return data1+10+"";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/ex03.do")
	public List<HashMap<String, String>> ex03() {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("data", "sample1");
		
		HashMap<String, String> map2 = new HashMap<String, String>();
		map2.put("data", "sample2");
		
		List<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		list.add(map);
		list.add(map2);
		
		return list; //[{"data":"sample1"}, {"data":"sample2"}]
	}
	
	
	@ResponseBody
	@RequestMapping(value="/findBoard.do",method=RequestMethod.GET)
	public BoardVO findBoard(int bno) {
		
		return boardService.selectByBno(bno); //{bno:1,btitle:����,bkind:����}
	}
	
	
	@ResponseBody
	@RequestMapping(value="/findUid.do",method=RequestMethod.GET)
	public UserVO findUid(UserVO vo) {
		
		return userService.selectLogin(vo);
	}
	
	@ResponseBody
	@RequestMapping(value="/checkID.do", method=RequestMethod.GET)
	public String checkID(String id) {
		System.out.println("id::"+id);
		//database���� �Ķ���Ϳ� �ߺ��Ǵ� id�� �����ϴ��� Ȯ��
		int result = userService.selectById(id);
		
		
		if(result > 0)
		{
			//���̵� �ߺ�
			return "0";
		}else {
			//�ߺ�X
			return "1";
		}
	}
	
	
}
