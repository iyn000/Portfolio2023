package edu.study.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.study.service.BoardService;
import edu.study.vo.BoardVO;
import edu.study.vo.SearchVO;
import edu.study.vo.UserVO;

@RequestMapping(value="/board")
@Controller
public class BoardController {
	
	@Autowired
	public BoardService boardService;
	
	@RequestMapping(value="/list.do")
	public String list(Model model,SearchVO svo) {
		
		List<BoardVO> list = boardService.list(svo);
		model.addAttribute("list", list);
		//request.setAttribute("list", list);과 동일하다
		
		return "board/list";
	}
	
	
	
	@RequestMapping(value="/write.do", method = RequestMethod.GET)
	public String write() {
		
		return "board/write";
	}
	
	@RequestMapping(value="/write.do", method = RequestMethod.POST)
	public String write(BoardVO vo, HttpServletRequest req, String upload) {
		
		HttpSession session = req.getSession();
		UserVO loginUserVO = (UserVO)session.getAttribute("login");
		
		vo.setUno(loginUserVO.getUno()); //매퍼로 전달할 객체에 로그인 정보중 유저 번호를 담는다.
		
		int result = boardService.insert(vo);
		
		System.out.println("등록된 게시글의 bno :" + vo.getBno());
		System.out.println("제목 :" + vo.getBtitle());
		System.out.println("종류 : " + vo.getBkind());
		System.out.println("내용 : " + vo.getBnote());
		
		return "redirect:/board/view.do?bno="+vo.getBno();
	}
	
	
	
	
	@RequestMapping(value="/view.do")
	public String view(int bno, Model model) {
		BoardVO vo = boardService.selectByBno(bno); //화면에 필요한 상세 게시글 조회
		model.addAttribute("vo", vo);
		
		return "board/view";
	}
	
	
	@RequestMapping(value="/modify.do",method=RequestMethod.GET)
	public String modify(int bno, Model model) { //model < 화면으로 넘어온 번호
		
		BoardVO vo = boardService.selectByBno(bno);
		model.addAttribute("vo", vo);
		return "board/modify";
	}
	
	@RequestMapping(value="/modify.do",method=RequestMethod.POST)
	public String modify(BoardVO vo) {
		
		//화면에서 넘어온 데이터를 수정처리(비지니스 로직)
		int result = boardService.update(vo);
		
		if(result > 0) {
			return "redirect:/board/view.do?bno="+vo.getBno();
			
		}else {
			return "redirect:/board/view.do?bno="+vo.getBno()+"&updateYN=N";
			
		}
		
		
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public String delete(int bno) {
		
		int result = boardService.delete(bno);
		
		
		
		
		return "redirect:/board/list.do";			

		
	}
	



	
}

