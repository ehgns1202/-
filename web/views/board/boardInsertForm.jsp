<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<style>
.outer {
	margin-left: auto;
	margin-right: auto;
	width: 50%;
}
#button{
	float: right;
}
</style>
<body>
	<div class="outer">
		<div style="height: 100px"></div>
		<div style="font-size: 2em; font-weight: bold; text-align: center;">글 작성하기</div>
		<br> <br>
		<form action="<%=request.getContextPath()%>/insertBoard" method="post">
			<div class="ui form">
				<div class="fields">
					<div class="field" id="text">
						<label>제목</label> <input type="text" placeholder="title"
							name="title">
					</div>
					<div class="field" id="text">
						<label>작성자</label> <input type="text" placeholder="writer"
							name="writer">
					</div>
				</div>
				<div class="field">
					<label>내용</label>
					<textarea rows="15" cols="60" name="content"></textarea>
				</div>	
			</div>
			<br>
			<button class="ui secondary button" id = "button" type="submit">작성완료</button>
			<button class="ui button" id = "button" type="reset" onclick="location.href='/board/boardList'">취소하기</button>
		</form>
	</div>
	<!-- outer end -->
</body>
</html>






