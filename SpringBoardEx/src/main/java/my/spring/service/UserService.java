package my.spring.service;

import my.spring.vo.UserVO;

public interface UserService {
	
	int insert(UserVO vo);
	int selectById(String id);
	
	UserVO selectLogin(UserVO vo);
	
}
