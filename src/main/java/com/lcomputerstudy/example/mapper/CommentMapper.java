package com.lcomputerstudy.example.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.lcomputerstudy.example.domain.Comment;

@Mapper
public interface CommentMapper {
	public List<Comment> selectCommentList(int page);

	public void writeComment(Comment comment);

	public void setGroup(Comment comment);

	public Comment readComment(Comment comment);

	public int countComment();

	public void editComment(Comment comment);

	public void deleteComment(Comment comment);

	public void replyComment(Comment comment);

	public void setReply(Comment comment); 
	
	public Comment readReply(Comment comment);

	
}

