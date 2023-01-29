package com.lcomputerstudy.example.service;

import java.util.List;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.Comment;

public interface CommentService {
	public List<Comment> selectCommentList(Board board, int page);

	//댓글작성 
	public void writeComment(Comment comment);

	//댓글카운트
	public int countComment(Board board);
	
	//댓글수정
	public void editComment(Comment comment);
	
	//댓글삭제 
	public void deleteComment(Comment comment);
	
	//답댓글
	public void replyComment(Comment comment);



}

