package my.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import my.spring.vo.BoardVO;
import my.spring.vo.SearchVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardVO> list(SearchVO svo){
		return sqlSession.selectList("my.spring.mapper.boardMapper.selectAll", svo);
	}
	
	public BoardVO selectByBno(int bno) {
		return sqlSession.selectOne("my.spring.mapper.boardMapper.selectByBno", bno);
	}

	
	public List<BoardVO> getBoards(int page) throws Exception {
	    board.setStart((board.getPage() - 1) * board.getPageSize());
	    return sqlSession.getBoardList("my.spring.mapper.boardMapper.getBoardList", board);
	  }
	
	
	
}
