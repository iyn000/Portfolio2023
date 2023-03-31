package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.BoardDAO;
import edu.study.vo.BoardVO;
import edu.study.vo.SearchVO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> list(SearchVO svo){
		//�����ȸ
		return boardDAO.list(svo);
	}

	@Override
	public BoardVO selectByBno(int bno) {
		// TODO Auto-generated method stub
		return boardDAO.selectByBno(bno);
	}

	@Override
	public int update(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.update(vo);
	}

	@Override
	public int insert(BoardVO vo) { //��Ʈ�ѷ����� ���� vo
		// TODO Auto-generated method stub
		return boardDAO.insert(vo);
	}

	@Override
	public int delete(int bno) {
		// TODO Auto-generated method stub
		return boardDAO.delete(bno);
	}
	
}
