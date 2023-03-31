package my.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import my.spring.service.UserService;
import my.spring.vo.UserVO;

@RequestMapping(value="/user")
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	
	
	@RequestMapping(value="join.do", method = RequestMethod.GET)
	public String join() {
		return "user/join";
	}
	
	@RequestMapping(value="join.do", method = RequestMethod.POST)
	public void join(UserVO vo, HttpServletRequest req, HttpServletResponse rsp) throws IOException{
		
		System.out.println("아이디 : " + vo.getUid());
		System.out.println("비밀번호 : " + vo.getUpw());
		System.out.println("이름 : " + vo.getUname());
		System.out.println("이메일 : " + vo.getUemail());
		System.out.println("전화번호 : " + vo.getUnumber());
		System.out.println("주소 : " + vo.getUaddr());
		
		int result = userService.insert(vo);
		
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		
		if(result > 0) {
			pw.append("<script>alert('회원가입을 환영합니다');location.href='"+req.getContextPath()+"'</script>");
			
			
		}else {
			//회원가입 실패
			pw.append("<script>alert('회원가입에 실패했습니다');location.href='"+req.getContextPath()+"'</script>");
			
		}
		pw.flush();
		
		
		
	}
	
	
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	
	
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public void login(UserVO vo, HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		
		//1.user정보 조회
		UserVO loginVO = userService.selectLogin(vo);
		
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		
		if(loginVO != null) {
			//2. 세션에 로그인 유저의 정보 담기
			HttpSession session = req.getSession();
			session.setAttribute("login", loginVO);
			
			//3. 로그인 처리 후 메인페이지 이동
			pw.append("<script>alert('로그인 성공!');location.href='"+ req.getContextPath() +"'</script>");
		}else {
			//4. 유저의 정보가 없는경우
			pw.append("<script>alert('로그인 실패!');location.href='login.do'</script>");
		}
		
		
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.invalidate();
		}
		
		return "redirect:/user/login.do";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
