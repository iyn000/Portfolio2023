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
		return sqlSession.selectList("edu.study.mapper.boardMapper.selectAll",svo); //mybaits ȣ��
	}
	
	//��Ʈ�ѷ����� �޾ƿ� ������...
	//Mapper���� �ְ��ִ� �����Ϳ� �Ķ������ �̸� ���� �Ȱ��ƾ��Ѵ� / bno
	public BoardVO selectByBno(int bno) {
		return sqlSession.selectOne("edu.study.mapper.boardMapper.selectByBno",bno); //������ ����� �ݵ�� �ѹ��̾�� ����Ҽ��ִ�. bno�� �ѱ��
	}
	
	//excuteupdate�� �����ϴ�
	public int update(BoardVO vo) {
		return sqlSession.update("edu.study.mapper.boardMapper.update", vo);
		
	}
	
	public int insert(BoardVO vo) {
		
		return sqlSession.insert("edu.study.mapper.boardMapper.insert", vo); //insert ȣ��
	}

	public int delete(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.delete("edu.study.mapper.boardMapper.delete", bno);
	}
	
	
}
