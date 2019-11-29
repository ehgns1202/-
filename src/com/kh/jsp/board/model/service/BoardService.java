package com.kh.jsp.board.model.service;

import static com.kh.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.board.model.dao.BoardDao;
import com.kh.jsp.board.model.vo.Board;
public class BoardService {

	public ArrayList<Board> selectList() {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(con);
		
		close(con);
		
		return list;
	}
	
	public int insertBoard(Board b) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertBoard(con , b);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}
	//1개 선택
	public Board selectOne(int num) {
		Connection con = getConnection();
		
		int result = 0 ;
		
		Board b = new BoardDao().selectOne(con , num);
		
		if(b !=null) {
			result = new BoardDao().updateCount(con , b.getBno());
			
			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		close(con);
		return b;
	}

	public Board updateReady(int num) {
		Connection con = getConnection();
		
		Board b = new BoardDao().selectOne(con, num);
		
		close(con);
		
		return b;
	}

	public int updateBoard(Board b) {
		Connection con =getConnection();
		int result = 0;
		
		result = new BoardDao().updateBoard(con , b);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	//게시글 삭제
	public int deleteBoard(int bno) {
		Connection con =getConnection();
		
		int result = 0;
		
		result = new BoardDao().deleteBoard(con , bno);
		
		
		if(result > 0 ) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}


	public ArrayList<Board> searchWriter(String select, String search) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().searchWriter(select,search , con);
		
		close(con);
		
		return list;
	}

	public ArrayList<Board> searcTitle(String select, String search) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().searchTitle(select , search , con);
		
		close(con);
		
		return list;
		
	}

	//전체 게시물 갯수 조회
	public int getListCount() {
		Connection con =getConnection();
		
		int result = new BoardDao().getListCount(con);
		
		close(con);
		return result;
	}
	
	
	

}
