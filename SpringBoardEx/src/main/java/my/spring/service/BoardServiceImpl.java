package my.spring.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.spring.dao.BoardDAO;
import my.spring.vo.BoardVO;
import my.spring.vo.SearchVO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDAO;


	@Override
	public BoardVO selectByBno(int bno) {
		// TODO Auto-generated method stub
		return boardDAO.selectByBno(bno);
	}


	@Override
	public List<BoardVO> list(SearchVO svo) {
		// 목록조회
		return boardDAO.list(svo);
	}


	@Override
	public List<BoardVO> getBoardList(int pageNum) {
		int start = (pageNum - 1) * 10 + 1; // 시작 인덱스
        int end = start + 9; // 끝 인덱스
        return boardDAO.getBoards(start, end);
	}













}
