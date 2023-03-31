package my.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import my.spring.service.BoardService;
import my.spring.vo.BoardVO;
import my.spring.vo.SearchVO;

@RequestMapping(value="/board")
@Controller
public class BoardController {

	@Autowired
	public BoardService boardService;
	
	@RequestMapping(value="/notice_list.do" )
	public String list(Model model, SearchVO svo) {
		
		System.out.println(svo.getSearchType());
		System.out.println(svo.getSearchValue());

		
		List<BoardVO> list = boardService.list(svo);
		model.addAttribute("list", list);
		
		
		
		return "board/notice_list";
	}
	
	
	
	
	
	
}
	
	


