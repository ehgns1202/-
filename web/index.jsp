<%@page import="com.kh.jsp.board.model.vo.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Board> list =  (ArrayList<Board>) request.getAttribute("list");	
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/semantic/semantic.min.css">
<script src="<%=request.getContextPath()%>/semantic/semantic.min.js"></script>
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

</style>
<body>
	<div style="height: 60px"></div>
	<div class="outer">
		<h1 align="center">LeeDoHoon</h1>
		<br>
		<form style="text-align: center;">
			<div class="ui action input">
				<input type="text" placeholder="Search...">
				<button class="ui button">검색하기</button>
			</div>
		</form>
		<br>
		<table class="ui celled table" style="text-align: center;">
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
			</tbody>
		</table>
		<button class="ui right floated button" onclick="goBoard();">조회하기</button>
		<button class="ui right floated button" onclick="location.href='views/board/boardInsertForm.jsp'">글 쓰기</button>
	</div>
	<!-- outer end -->
	
	<script>
		function goBoard(){
			<%-- location.href = "<%=request.getContextPath()%>/boardList" --%>
			location.href="/board/boardList";
		}
	</script>
</body>
</html>



