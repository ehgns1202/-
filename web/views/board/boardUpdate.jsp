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
		<div style="font-size: 2em; font-weight: bold; text-align: center;">게시글 수정하기</div>
		<br> <br>
		<form id = "updateForm" method="post">
			<div class="ui form">
				<div class="fields">
					<div class="field" id="text" style = "width: 33%;">
						<label>제목</label> <input type="text" placeholder="title"
							name="title" value = "<%=b.getBtitle()%>">
						<input type="hidden" name ="bno" value="<%=b.getBno() %>">
					</div>
					<div class="field" id="text" style = "width: 33%;">
						<label>작성자</label> <input type="text" placeholder="writer"
							name="writer" value ="<%=b.getBwriter()%>" readonly="readonly" style="background:darkgray">
					</div>
					<div class="field" id="text" style = "width: 33%;">
						<label>작성일</label> <input type="text" placeholder="writer"
							name="writer" value = "<%=b.getBdate()%>" readonly="readonly" style = "background:darkgray">
					</div>
				</div>
				<div class="field">
					<label>내용</label>
					<textarea rows="15" cols="60" name="content"><%=b.getBcontent() %></textarea>
				</div>
			</div>
			<br>
			<button class="ui secondary button" id="button" onclick = "complete()">작성완료</button>
			<button class="ui button" id="button"  onclick= "deleteBoard()">삭제하기</button>
		</form>
	</div>
	<script>
		function complete(){
			$("#updateForm").attr("action" , "<%=request.getContextPath()%>/updateBoard");
		}
		function deleteBoard(){
			$("#updateForm").attr("action","<%=request.getContextPath()%>/deleteBoard");
		}
	</script>
	<!-- outer end -->
</body>
</html>