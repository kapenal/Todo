<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateTodo.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1 style="text-align:center">일정 수정</h1>
		</div>
		<a href="${pageContext.request.contextPath}/member/calendar"><button type="button">달력가기</button></a>
		<hr>
		<form method="post" id="updateTodoForm" action="${pageContext.request.contextPath}/member/updateTodo">
			<div>
				오늘 날짜 : <input type="text" name="todoDate" value="${todoDate}" readonly="readonly">
			</div>
			<div>
				일정 내용
				<textarea rows="3" cols="50" name="todoContent" id="todoContent">${todoContent}</textarea>
			</div>
			<input type="hidden" name="todoNo" value="${todoNo}">
			<button type="button" id="updateBtn" class="btn btn-outline-primary">저장</button>
		</form>
	</div>
	<script>
		// 버튼을 클릭했을 때
		$('#updateBtn').click(function(){	
			if($('#todoContent').val() == '') { // textarea가 공백이면
				alert('내용을 입력하세요');
				return;
			}
			$('#updateTodoForm').submit();
		});
	</script>
</body>
</html>