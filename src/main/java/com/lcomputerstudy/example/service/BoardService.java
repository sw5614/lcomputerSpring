package com.lcomputerstudy.example.service;

import java.util.List;
import com.lcomputerstudy.example.domain.Board;

public interface BoardService {
	public List<Board> selectBoardList(int page);

	//글작성 
	public void writeBoard(Board board);
	
	//글조회
	public Board readBoard(Board board);

	//글카운트
	public int countBoard();
	
	//글수정
	public void editBoard(Board board);
	
	//글삭제 
	public void deleteBoard(Board board);
	
	//답글
	public void replyBoard(Board board);

	public Board readReply(Board board);
}

