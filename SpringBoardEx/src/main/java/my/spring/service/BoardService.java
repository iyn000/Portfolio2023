package my.spring.service;

import java.util.List;

import my.spring.vo.BoardVO;
import my.spring.vo.SearchVO;

public interface BoardService {
	public List<BoardVO> list(SearchVO svo);
	public BoardVO selectByBno(int bno);

	List<BoardVO> getBoardList(int pageNum);
}
