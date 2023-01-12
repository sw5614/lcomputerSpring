package com.lcomputerstudy.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.User;
import com.lcomputerstudy.example.service.BoardService;
import com.lcomputerstudy.example.service.UserService;

@org.springframework.stereotype.Controller
public class Controller {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userservice;
	@Autowired BoardService boardservice;
	@Autowired PasswordEncoder encoder;
	
	
	@RequestMapping("/")
	public String home(Model model) { //Model은 스프링 기능, key와 value로 이루어져있는 HashMap
		
		List<Board> list = boardservice.selectBoardList();  
		model.addAttribute("list", list);  // Model 객체 (request.setAttribute() 와 비슷한역할)
		logger.debug("debug");
	     logger.info("info");
	     logger.error("error");
		return "/index";
	}
	
	@RequestMapping("/beforeSignUp") 
	public String beforeSignUp() {
		return "/signup";
	}
	
	@RequestMapping("/signup")
	   public String signup(User user) {
	      //비밀번호 암호화
	      String encodedPassword = encoder.encode(user.getPassword());
	      
	      //유저 데이터 세팅
	      user.setPassword(encodedPassword);
	      user.setAccountNonExpired(true);
	      user.setEnabled(true);
	      user.setAccountNonLocked(true);
	      user.setCredentialsNonExpired(true);
	      user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER")); // 유저 권한세팅 ROLE_USER lc_auth에 저장    
	      
	      //유저 생성
	      userservice.createUser(user);
	      //유저 권한 생성
	      userservice.createAuthorities(user);
	      
	      return "/login";
	     
	   }
    @RequestMapping(value="/login")      
    public String beforeLogin(Model model) {
    	return "/login";
    }
       @Secured({"ROLE_ADMIN"})
	   @RequestMapping(value="/admin")
	   public String admin(Model model) {
	      return "/admin";
	   }
	   
	   @Secured({"ROLE_USER"})
	   @RequestMapping(value="/user/info") 
	   public String userInfo(Model model) {
	      return "/user_info";
	   }
	   
	   @RequestMapping(value="/denied") 
	   public String denied(Model model) {
	      return "/denied";
	   }
	   
	   @RequestMapping(value="/board/list")
	   public String boardList(Model model){ // 게시물 목록 
		  List<Board> list = boardservice.selectBoardList();  
		  model.addAttribute("list", list);  
		  return "/board_list";
	   }
	   @RequestMapping(value="/user/list")
	   public String userList(Model model){ // 게시물 목록 
		  List<User> list = userservice.selectUserList();  
		  model.addAttribute("list", list);  
		  return "/user_list";
		   }
	   
	   @RequestMapping(value="/user/authEdit") 
	   public String editUserAuth(Model model,User user){ // 사용자 권한 설정  
		  userservice.editAuthorities(user);
		  List<User> list = userservice.selectUserList();  
		  model.addAttribute("list", list);  
		  return "/aj_user_list";
		   }
}

