package my.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import my.spring.vo.UserVO;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insert(UserVO vo) {
		return sqlSession.insert("my.spring.mepper.userMapper.insert", vo);
	
	}
	
	public int selectById(String id) {
		return sqlSession.selectOne("my.spring.mepper.userMapper.selectById", id);
	}
	
	public UserVO selectLogin(UserVO vo) {
		return sqlSession.selectOne("my.spring.mepper.userMapper.selectLogin", vo);
	}
	
	
}
