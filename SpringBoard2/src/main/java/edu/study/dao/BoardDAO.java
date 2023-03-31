package edu.study.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.BoardVO;
import edu.study.vo.SearchVO;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardVO> list(SearchVO svo){
		return sqlSession.selectList("edu.study.mapper.boardMapper.selectAll",svo); //mybaits 호출
	}
	
	//컨트롤러에서 받아올 데이터...
	//Mapper에서 넣고있는 데이터와 파라미터의 이름 값이 똑같아야한다 / bno
	public BoardVO selectByBno(int bno) {
		return sqlSession.selectOne("edu.study.mapper.boardMapper.selectByBno",bno); //쿼리의 결과가 반드시 한번이어야 사용할수있다. bno를 넘긴다
	}
	
	//excuteupdate와 동일하다
	public int update(BoardVO vo) {
		return sqlSession.update("edu.study.mapper.boardMapper.update", vo);
		
	}
	
	public int insert(BoardVO vo) {
		
		return sqlSession.insert("edu.study.mapper.boardMapper.insert", vo); //insert 호출
	}

	public int delete(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.delete("edu.study.mapper.boardMapper.delete", bno);
	}
	
	
}
