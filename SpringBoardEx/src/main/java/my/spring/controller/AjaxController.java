package my.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import my.spring.service.BoardService;
import my.spring.service.UserService;
import my.spring.vo.BoardVO;

@RequestMapping(value="/ajax")
@Controller
public class AjaxController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	BoardService boardService;
	
	
	//아이디 중복체크
	@ResponseBody
	@RequestMapping(value="/checkID.do", method=RequestMethod.GET)
	public String checkID(String id) 
	{
		System.out.println(" 아이디 : " + id);
		int result = userService.selectById(id);
		
		if(result > 0)
		{	
			return "0"; //아이디 중복
		}else 
		{
			return "1";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="/findBoard.do", method=RequestMethod.GET)
	public BoardVO findBoard(int bno) {
		
		return boardService.selectByBno(bno);
	}

	
	//페이징
	

	 @ResponseBody
	 @RequestMapping(value="/listPaging")
	 public List<BoardVO> getPosts(@RequestParam("page") int page) {
	   int pageSize = 10; // 페이지 당 포스트 수
	   int start = (page - 1) * pageSize; // 가져올 포스트의 시작 인덱스
	   return boardService.getPosts(start, pageSize);
	 }
	
	
	
	
}//E
	

	

