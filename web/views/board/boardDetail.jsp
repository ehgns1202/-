<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jsp.board.model.vo.*"%>
<%
	Board b = (Board) request.getAttribute("b");
%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/semantic/semantic.min.css">
<script src="<%=request.getContextPath()%>/semantic/semantic.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		margin-left:auto;
		margin-right:auto;
		width: 50%;
	}
	#button{
		float: right;
	}
</style>
</head>

<body>
	<div class="outer">
		<div style="height: 100px"></div>
		<div style="font-size: 2em; font-weight: bold; text-align: center;">게시글 보기</div>
		<br> <br>
			<div class="ui form">
				<div class="fields">
					<div class="field" id="text" style = "width: 33%;">
						<label>제목</label> <input type="text" placeholder="title"
							name="title" value = "<%=b.getBtitle()%>" readonly="readonly">
					</div>
					<div class="field" id="text" style = "width: 33%;">
						<label>작성자</label> <input type="text" placeholder="writer"
							name="writer" value ="<%=b.getBwriter()%>" readonly="readonly">
					</div>
					<div class="field" id="text" style = "width: 33%;">
						<label>작성일</label> <input type="text" placeholder="writer"
							name="writer" value = "<%=b.getBdate()%>" readonly="readonly">
					</div>
				</div>
				<div class="field">
					<label>내용</label>
					<textarea rows="15" cols="60" name="content" readonly="readonly"><%=b.getBcontent() %></textarea>
				</div>
			</div>
			<br>
			<button class="ui secondary button" id="button" type="submit" onclick="location.href='<%=request.getContextPath()%>/updateready?num=<%=b.getBno()%>'">수정하기</button>
			<button class="ui button" id="button" type="reset" onclick="location.href='/board/boardList'">취소하기</button>
	</div>
	<!-- outer end -->
</body>
</html>