package edu.study.service;

import java.util.List;

import edu.study.vo.BoardVO;
import edu.study.vo.SearchVO;

public interface BoardService {
	public List<BoardVO> list(SearchVO svo);
	public BoardVO selectByBno(int bno); //추상클래스, 매개변수 선언을하고 구현클래스에서도 선언한다 (impl
	public int update(BoardVO vo);
	public int insert(BoardVO vo);
	public int delete(int bno);
	
}
