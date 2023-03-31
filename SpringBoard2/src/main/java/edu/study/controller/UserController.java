package edu.study.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.study.service.UserService;
import edu.study.vo.UserVO;

@RequestMapping(value="/user")
@Controller
public class UserController {

	@Autowired
	private UserService userService;

	
	
	@RequestMapping(value="join.do", method = RequestMethod.GET)
	public String join() {
		return "user/join";
	}
	
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	@RequestMapping(value="login.do", method = RequestMethod.POST)
	public void login(UserVO vo, HttpServletRequest req, HttpServletResponse rsp)  throws IOException{
		
		//1.�Է��� ���̵�, �н����� ��ġ�ϴ� user ���� ��ȸ
		UserVO loginVO = userService.selectLogin(vo);
		
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		
		if(loginVO != null) {
			//2.������ �����ϴ� ��� session�� login user���� ���
			HttpSession session = req.getSession();
			session.setAttribute("login", loginVO);
			
			//3.�α��� ó�� �� ���������� �̵�
			pw.append("<script>alert('�α��� ����!');location.href='"+req.getContextPath()+"'</script>");
			//return "redirect:/";
			
			
		}else {
			//4.user ������ ���� ��� �ٽ� login �������� �̵�
			pw.append("<script>alert('�α��� ����!');location.href='login.do'</script>");
			//return "redirect:/user/login.do";
			
		}
		
		
	}
	
	
	@RequestMapping(value="join.do", method = RequestMethod.POST)
	public void join(UserVO vo, HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		
		System.out.println("uid : " + vo.getUid());
		System.out.println("upw : " + vo.getUpw());
		System.out.println("uname : " + vo.getUname());
		System.out.println("ugen : " + vo.getUgen());
		
		int result = userService.insert(vo);
		
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		
		if(result > 0) {
			//ȸ������ ����
			pw.append("<script>alert('ȸ������ ����');location.href='"+req.getContextPath()+"'</script>");
		
		}else {
			//ȸ������ ����
			pw.append("<script>alert('ȸ������ ����');location.href='"+req.getContextPath()+"'</script>");
			
		}
		pw.flush();
		
	}
	
	
	
	
}
