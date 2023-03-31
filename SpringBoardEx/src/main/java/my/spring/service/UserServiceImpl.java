package my.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.spring.dao.UserDAO;
import my.spring.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public int insert(UserVO vo) {
		return userDAO.insert(vo);
	}
	
	@Override 
	public int selectById(String id) {
		return userDAO.selectById(id);
	}

	@Override
	public UserVO selectLogin(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.selectLogin(vo);
	}
	
	
}
