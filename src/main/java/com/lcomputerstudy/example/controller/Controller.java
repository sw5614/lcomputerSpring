package com.lcomputerstudy.example.controller;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.Pagination;
import com.lcomputerstudy.example.domain.User;
import com.lcomputerstudy.example.service.BoardService;
import com.lcomputerstudy.example.service.UserService;

@org.springframework.stereotype.Controller
public class Controller {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userservice;
	@Autowired BoardService boardservice;
	@Autowired PasswordEncoder encoder;
	
	public Pagination setPagination(int page) { // 페이지네이션 설정메소드 
		Pagination pagination = new Pagination();
		pagination.setCount(userservice.countUser());
		pagination.setPage(page);
		pagination.init();
		return pagination;
	}
	int defaultPage=1; // 기폰페이지 1 로 

	
	
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
   
   @Secured({"ROLE_USER"}) //현재 로그인 유저 정보 
   @RequestMapping(value="/user/login_info") 
   public String loginUserInfo(Model model) {
      return "/login_user_info";
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
   public String userList(Model model,@RequestParam(value="page", required=false, defaultValue="1") int page){ // 유저 목록 
	  List<User> list = userservice.selectUserList(page);  
	  model.addAttribute("list", list);  
	  model.addAttribute("pagination",setPagination(page));
	  return "/user_list";
	   }
   
   @RequestMapping(value="/user/authEdit") 
   public String editUserAuth(Model model,User user,@RequestParam(value="page", required=false, defaultValue="1") int page){ // 사용자 권한 설정  
	  userservice.editAuthorities(user);
	  List<User> list = userservice.selectUserList(page); // ajax 때문에 list 보내줘야함   
	  model.addAttribute("pagination",setPagination(page));
	  model.addAttribute("list", list);  
	  return "/aj_user_list";
	   }
   @RequestMapping(value="/user/info") 
   public String UserInfo(Model model, String username) {
      model.addAttribute("user",userservice.readUser(username) );
	  return "/user_info";
   }
   @RequestMapping(value="/user/delete")
   public String deleteUser(Model model, User user) {
	   userservice.deleteUser(user);
	   List<User> list = userservice.selectUserList(defaultPage);
	   model.addAttribute("list", list);  
	   model.addAttribute("pagination",setPagination(defaultPage));
	   return "/user_list";
   }
   
   @RequestMapping(value="/user/edit")
   public String editUser(Model model, User user) {
	   userservice.editUser(user);
	   model.addAttribute("user",userservice.readUser(user.getUsername()) );
	   return "/user_info";
   }
   
   @RequestMapping(value="/user/beforeedit")
   public String editUserbefore(Model model, String username ) {
	   model.addAttribute("user",userservice.readUser(username));
	   return "/user_edit";
   }
   
}

