package com.lcomputerstudy.example.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.Search;

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

	public List<Board> searchBoardList(@Param("search")Search search,@Param("pageNum")int page);

}

