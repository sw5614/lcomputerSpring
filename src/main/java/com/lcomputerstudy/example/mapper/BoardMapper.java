package com.lcomputerstudy.example.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.Comment;

@Mapper
public interface BoardMapper {
	public List<Board> selectBoardList(int page);

	public void writeBoard(Board board);

	public void setGroup(Board board);

	public Board readBoard(Board board);

	public int countBoard();

	public void editBoard(Board board);

	public void deleteBoard(Board board);

	public void replyBoard(Board board);

	public void setReply(Board board); 
	
	public Board readReply(Board board);

	public List<Comment> selectCommentList(int page);
	
	
}

