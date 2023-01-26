package com.lcomputerstudy.example.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.Comment;
import com.lcomputerstudy.example.mapper.CommentMapper;

@Service("CommentServiceImpl")
public class CommentServiceImpl implements CommentService {

	@Autowired CommentMapper commentmapper;
	@Override
	public List<Comment> selectCommentList(Board board,int page) {
		return commentmapper.selectCommentList(board,page);
	}
	@Override
	public void writeComment(Comment comment) {
		commentmapper.writeComment(comment);
		commentmapper.setGroup(comment); // group setting 
	}
	
	@Override
	public int countComment() {
		return commentmapper.countComment();
	}
	@Override
	public void editComment(Comment comment) {
		commentmapper.editComment(comment);
	}
	@Override
	public void deleteComment(Comment comment) {
		commentmapper.deleteComment(comment);
		
	}
	@Override
	public void replyComment(Comment comment) {
		commentmapper.replyComment(comment);
		commentmapper.setReply(comment);
	}
	
	
}

