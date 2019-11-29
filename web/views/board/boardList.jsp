<%@page import="com.kh.jsp.board.model.vo.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/semantic/semantic.min.css">
<script src="<%=request.getContextPath()%>/semantic/semantic.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tablesort.js"></script>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<style>
.outer {
	margin-left: auto;
	margin-right: auto;
	width: 70%;
}

table {
	border: 1px solid black;
	text-align: center;
}

select {
	width: 200px;
	padding: .8em .5em;
	border: 1px solid #999;
	font-family: inherit;
	background: url('images/select.png') no-repeat 95% 50%;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}
</style>
<body>
	<div style="height: 60px"></div>
	<div class="outer">
		<h1 align="center" onclick="goIndex()">LeeDoHoon</h1>
		<br>
		<form style="text-align: center;" action="<%=request.getContextPath()%>/searchBoard" method="post" action="">
			<select id = "selectbox" name = "selectbox">
				<option id = "first" value ="title">글 제목</option>
				<option id = "second" value ="writer">작성자</option>
			</select> 
			<div class="ui action input">
				<input type="text" name="search" placeholder="Search...">
				<button class="ui button" type="submit" >검색하기</button>
			</div>
		</form>
		<br>
		<table id="listArea" class="ui sortable celled table"
			style="text-align: center;">
			<thead>
				<tr>
					<th>글번호</th>
					<th>글제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (Board b : list) {
				%>
				<tr>
					<td><%=b.getBno()%></td>
					<td><%=b.getBtitle()%></td>
					<td><%=b.getBwriter()%></td>
					<td><%=b.getBcount()%></td>
					<td><%=b.getBdate()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table> <!-- tableArea end -->
		<div class="pageingArea" align="center">
			<button onclick="location.href ='<%=request.getContextPath()%>/boardList?currentPage=1'"><<</button>
			<!-- 현재 페이지가 1보다 작거나 같을때 -->
			<% if(currentPage <= 1){ %>
				<!-- 버튼 비활성화 -->
				<button disabled="disabled"><</button>
			<% }else { %>
				<button onclick ="location.href='<%=request.getContextPath()%>/boardList?currentPage=<%=currentPage-1%>'"><</button>
			<% } %>
			
			<!-- 페이지에 따른 페이지 수 작성 -->
			<% for(int p = startPage; p <= endPage; p++){ 
				if(p == currentPage){
			%>
				<button disabled="disabled"><%=p %></button>
			<%}else {%>
				<button onclick="location.href='<%=request.getContextPath()%>/boardList?currentPage=<%=p%>'"><%=p %></button>
			<% } 
			} %>
			<!-- 현재 페이지가 maxPage보다 크거나 같을때 -->
			<% if(currentPage >= maxPage){ %>
				<button disabled="disabled">></button>
			<%} else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/boardList?currentPage<%=currentPage+1%>'">></button>
			<% } %>	
			<!-- maxPage로 이동 -->
			<button onclick="location.href='<%=request.getContextPath()%>/boardList?currentPage=<%=maxPage%>'">>></button>
		</div>
		<button class="ui right floated button"
			onclick="location.href='views/board/boardInsertForm.jsp'">글 쓰기</button>
	</div>
	<!-- outer end -->
	<script>
	
		
		function goIndex(){
			location.href="index.jsp";
		}
		
		$(function(){
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"darkgray" , "cursor" : "pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background" : "white"});
			}).click(function(){
				var num = $(this).parent().children().eq(0).text();
				
				location.href ="<%=request.getContextPath()%>/selectOne?num="+ num;
			});
		});
		
		
	</script>
</body>
</html>