package com.lcomputerstudy.example.service;

import java.util.List;
import com.lcomputerstudy.example.domain.Board;

public interface BoardService {
	public List<Board> selectBoardList();

	//글작성 
	public void writeBoard(Board board);
}

