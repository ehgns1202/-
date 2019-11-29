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
 * Servlet implementation class SearchBoard
 */
@WebServlet("/searchBoard")
public class SearchBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String select = request.getParameter("selectbox");
		String search = request.getParameter("search");
		
		System.out.println(select);
		System.out.println(search);
		
		//작성자일경우
		if(select.equals("writer")) {
			ArrayList<Board> list = new BoardService().searchWriter(select ,search);
			String page = "";
			if(list != null) {
				page ="views/board/boardList.jsp";
				request.setAttribute("list", list);
			}else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "게시물 상세검색(작성자) 실패");
			}
			request.getRequestDispatcher(page).forward(request, response);
		
			
			//제목일 경우
		}else{
			ArrayList<Board> list = new BoardService().searcTitle(select , search);
			String page = "";
			if(list !=null) {
				page = "views/board/boardList.jsp";
				request.setAttribute("list", list);
			}else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "게시물 상세검색(제목) 실패");
			}
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
