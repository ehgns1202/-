package com.kh.jsp.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.board.model.service.BoardService;
import com.kh.jsp.board.model.vo.Board;

/**
 * Servlet implementation class TestBoard
 */
@WebServlet("/boardList")
public class TestBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TestBoard() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int currentPage;	//현재 페이지를 표시할 변수
		int limit; 			//한 페이지게 게시글이 몇 개 보여질 것 인지
		int maxPage;  		//전체 페이지에서 가장 마지막 페이지
		int startPage;		//한 번에 표시될 페이지의 시작페이지
		int endPage;		//한 번에 표시될 페이지의 마지막 페이지
		
		currentPage = 1; 
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//한 페이지에 보여질 목록 갯수
		limit = 10;
		
		//전체 목록 갯수 조회
		int listCount = new BoardService().getListCount();
		
		//총페이지수 계산
		//예를 들면 목록수가 14개이면 페이지가 필요하다.
		//짜투리 목록이 최소 1개이면 1page가 추가되는 로직 작성
		
		//최대 페이지 계산
		maxPage = (int)((double)listCount / limit +0.9);
		
		//시작 페이지 계산
		startPage = (((int)((double) currentPage / limit + 0.9))-1) * 10 + 1;
		
		//목록 아래 쪽에 보여질 마지막 페이지 수 
		endPage = startPage + 10 - 1;
		
		ArrayList<Board> list = new BoardService().selectList();
		
		
		
		
		
		String page = "";
		if(list !=null) {
			page = "views/board/boardList.jsp";
			request.setAttribute("list", list);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시물 조회 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
