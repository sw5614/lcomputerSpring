package com.lcomputerstudy.example.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.mapper.BoardMapper;

@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService {

	@Autowired BoardMapper boardmapper;
	@Override
	public List<Board> selectBoardList(int page) {
		return boardmapper.selectBoardList(page);
	}
	@Override
	public void writeBoard(Board board) {
		boardmapper.writeBoard(board);
		boardmapper.setGroup(board); // group setting 
	}
	
	public Board readBoard(Board board) {
		return boardmapper.readBoard(board);
		
	}
	@Override
	public int countBoard() {
		return boardmapper.countBoard();
	}
	@Override
	public void editBoard(Board board) {
		boardmapper.editBoard(board);
	}
	@Override
	public void deleteBoard(Board board) {
		boardmapper.deleteBoard(board);
		
	}
	@Override
	public void replyBoard(Board board) {
		boardmapper.replyBoard(board);
		boardmapper.setReply(board);
	}
	
	
}

