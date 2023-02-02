package com.lcomputerstudy.example.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.Comment;
import com.lcomputerstudy.example.domain.Pagination;
import com.lcomputerstudy.example.domain.Search;
import com.lcomputerstudy.example.domain.User;
import com.lcomputerstudy.example.domain.Upload;
import com.lcomputerstudy.example.service.BoardService;
import com.lcomputerstudy.example.service.CommentService;
import com.lcomputerstudy.example.service.UploadService;
import com.lcomputerstudy.example.service.UserService;

@org.springframework.stereotype.Controller
public class Controller {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userservice;
	@Autowired BoardService boardservice;
	@Autowired CommentService commentservice;
	@Autowired PasswordEncoder encoder;
	@Autowired UploadService uploadservice;
	Path uploadPathRelative= Paths.get("src/main/resources/static/image");
	Path uploadPath= uploadPathRelative.toAbsolutePath();
	
	
	public Pagination setPaginationUser(int page) { // 페이지네이션 설정메소드 
		Pagination pagination = new Pagination();
		pagination.setCount(userservice.countUser());
		pagination.setPage(page);
		pagination.init();
		return pagination;
	}
	public Pagination setPaginationBoard(int page,Search search) { // 페이지네이션 설정메소드  // 나중에 합쳐서 객체만넣어서 설정 수정##필수
		Pagination pagination = new Pagination();
		pagination.setCount(boardservice.countBoard(search));
		pagination.setPage(page);
		pagination.init();
		return pagination;
	}
	public Pagination setPaginationComment(int page, Board board) { // 페이지네이션 설정메소드  // 나중에 합쳐서 객체만넣어서 설정 수정##필수
		Pagination pagination = new Pagination();
		pagination.setCount(commentservice.countComment(board));
		pagination.setPage(page);
		pagination.init();
		return pagination;
	}

	
	
	@RequestMapping("/")
	public String home(Model model) { //Model은 스프링 기능, key와 value로 이루어져있는 HashMap
										// Model 객체 (request.setAttribute() 와 비슷한역할)
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
   public String boardList(Model model,Search search,@RequestParam(value="page", required=false, defaultValue="1") int page){ // 게시물 목록 
	  List<Board> list = boardservice.searchBoardList(search,(page-1)*5);  
	  model.addAttribute("list", list);  
	  model.addAttribute("pagination",setPaginationBoard(page,search));
	  return "/board_list";
   }

   @RequestMapping(value="/user/list")
   public String userList(Model model,@RequestParam(value="page", required=false, defaultValue="1") int page){ // 유저 목록 
	  List<User> list = userservice.selectUserList((page-1)*5);  
	  model.addAttribute("list", list);  
	  model.addAttribute("pagination",setPaginationUser(page));
	  return "/user_list";
	   }
   
   @RequestMapping(value="/user/authEdit") 
   public String editUserAuth(Model model,User user,@RequestParam(value="page", required=false, defaultValue="1") int page){ // 사용자 권한 설정  
	  userservice.editAuthorities(user);
	  List<User> list = userservice.selectUserList((page-1)*5); // ajax 때문에 list 보내줘야함   
	  model.addAttribute("pagination",setPaginationUser(page));
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
	   return "redirect:/user/list";
   }
   
   @RequestMapping(value="/user/edit")
   public String editUser(Model model, User user) {
       String encodedPassword = encoder.encode(user.getPassword()); //비밀번호 암호화 
       user.setPassword(encodedPassword); 
	   userservice.editUser(user);
	   model.addAttribute("user",userservice.readUser(user.getUsername()) );
	   return "/user_info";
   }
   
   @RequestMapping(value="/user/beforeedit") // 수정전 화면 
   public String editUserbefore(Model model, String username ) {
	   model.addAttribute("user",userservice.readUser(username));
	   return "/user_edit";
   }
   
   @RequestMapping(value="/board/beforewrite")
   public String writeBoardbefore(Model model) {
	   return "/board_write";
   }
   
   @RequestMapping(value="/board/write")
   public String writeBoard(Model model,Board board,Upload upload)
		   throws IllegalStateException, IOException {
	   boardservice.writeBoard(board);
	   upload.setbIdx(board.getbId());
		for(MultipartFile file : board.getFiles()) {
			if(!file.isEmpty()) {
				String originalName=file.getOriginalFilename();
				String fileExtension=originalName.substring(originalName.lastIndexOf("."));
				String uuid = UUID.randomUUID().toString();
				String uploadName = uuid +  fileExtension;
				String savefileName= uploadPath + File.separator + uuid + fileExtension;
				upload.settUpload(uploadName);
				upload.settFileName(originalName);
				uploadservice.uploadInsert(upload);
				
				Path savePath= Paths.get(savefileName);
				try {
					file.transferTo(savePath);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	   upload.setbIdx(board.getbId());
	   model.addAttribute("board",boardservice.readBoard(board));
	   //return "/board_info"; // board_insert result로 보내기
	   return "redirect:/board/info?bId="+board.getbId();  // 리다이렉트는 주소값넣기  파일이름XX
   }
   
   @RequestMapping(value="/board/info")
   public String readBoard(Model model, Board board,Upload upload,
		   @RequestParam(value="page", required=false, defaultValue="1") int page) {
	   upload.setbIdx(board.getbId());
	   board.setUploadfiles(uploadservice.uploadRead(upload));
	   model.addAttribute("board",boardservice.readBoard(board));
	   model.addAttribute("file",board);
	   List<Comment> list = commentservice.selectCommentList(board,(page-1)*5);  
	   model.addAttribute("list", list);  
	   model.addAttribute("pagination",setPaginationComment(page,board));
	   return "/board_info";
   }
   
   @RequestMapping(value="/board/edit")
   public String editBoard(Model model, Board board) {
	   boardservice.editBoard(board);
	   model.addAttribute("board",boardservice.readBoard(board));
	   return "/board_info";
   }
   
   @RequestMapping(value="/board/beforeedit") // 수정전 화면 
   public String editBoardbefore(Model model, Board board ) {
	   model.addAttribute("board",boardservice.readBoard(board));
	   return "/board_edit";
   }
   
   @RequestMapping(value="/board/delete") // 삭제 
   public String deleteBoard(Model model, Board board ) {
	   boardservice.deleteBoard(board);
	   return "redirect:/board/list";  //  이전화면으로 리다이렉트 
   }
   
   @RequestMapping(value="/board/beforereply") // 답글  
   public String replyBoardbefore(Model model, Board board ) {
	   model.addAttribute("board",boardservice.readBoard(board));
	   return "/board_reply";  //  이전화면으로 리다이렉트 
   }
   
   @RequestMapping(value="/board/reply") // 답글  
   public String replyBoard(Model model, Board board ) {
	   boardservice.replyBoard(board);
	   return "redirect:/board/list";  //  이전화면으로 리다이렉트 
   }
   
   @RequestMapping(value="/comment/comment_list")
   public String commentList(Model model,Board board,@RequestParam(value="page", required=false, defaultValue="1") int page){ // 유저 목록 
	  List<Comment> list = commentservice.selectCommentList(board,(page-1)*5);  
	  model.addAttribute("list", list);  
	  model.addAttribute("pagination",setPaginationComment(page,board));
	  return "/aj_comment_list";
	   }
   
   @RequestMapping(value="/comment/write")
   public String commentWrite(Model model,Comment comment,Board board,@RequestParam(value="page", required=false, defaultValue="1") int page) {
	   commentservice.writeComment(comment);
	   List<Comment> list = commentservice.selectCommentList(board,(page-1)*5);  
	   model.addAttribute("list", list);  
	   model.addAttribute("pagination",setPaginationComment(page,board));
	   return "/aj_comment_list";
   }
   
   @RequestMapping(value="/comment/edit")
   public String commentEdit(Model model,Comment comment,Board board,@RequestParam(value="page", required=false, defaultValue="1") int page) {
	   commentservice.editComment(comment);
	   List<Comment> list = commentservice.selectCommentList(board,(page-1)*5);  
	   model.addAttribute("list", list);  
	   model.addAttribute("pagination",setPaginationComment(page,board));
	   return "/aj_comment_list";
   }
   
   @RequestMapping(value="/comment/delete")
   public String commentDelete(Model model,Comment comment,Board board,@RequestParam(value="page", required=false, defaultValue="1") int page) {
	   commentservice.deleteComment(comment);
	   List<Comment> list = commentservice.selectCommentList(board,(page-1)*5);  
	   model.addAttribute("list", list);  
	   model.addAttribute("pagination",setPaginationComment(page,board));
	   return "/aj_comment_list";
   }
   
   @RequestMapping(value="/comment/reply")
   public String commentReply(Model model,Comment comment,Board board,@RequestParam(value="page", required=false, defaultValue="1") int page) {
	   commentservice.replyComment(comment);
	   List<Comment> list = commentservice.selectCommentList(board,(page-1)*5);  
	   model.addAttribute("list", list);  
	   model.addAttribute("pagination",setPaginationComment(page,board));
	   return "/aj_comment_list";
   }
   
   
}

