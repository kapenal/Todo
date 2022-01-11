<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateTodo.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style type="text/css"> 
	a { text-decoration:none !important }
	a:hover { text-decoration:none !important }
</style> 
</head>
<body>
	<div class="container" style="max-width: 1920px; padding-left: 0px; padding-right: 0px;">
	<div class="row p-4" style="background-color: #8C8C8C; margin-left: 0px; margin-right: 0px; height: 969px;">
		<div class="col-lg-6 mb-0 align-itehms-left" style="background-color: #ffebb5; text-align: center;  border-style: solid;border-color: #FFC107; border-right-color: black; border-top-left-radius: 20px; border-bottom-left-radius:20px; padding-left: 0px; padding-right: 0px;">
		<div style="margin: 240px 100px; ">
			<h1 style="font-size: 40pt; color: #8C8C8C;"><span style="color: black;">${loginMember.memberId}</span>님 반갑습니다</h1>
			<br>
			<a style="margin-right: 5%;'" href="${pageContext.request.contextPath}/member/logout" class="btn btn-warning">로그아웃</a>
			<a href="${pageContext.request.contextPath}/member/removeMember" class="btn btn-warning">회원탈퇴</a>
			<br>
			<br>
			<br>
			<br>
			<div class="text-white" style="text-align: center;  border-radius: 50%; background-color: #FFFFFF; margin-left: 33%; margin-right: 33%; border-style: solid; border-color: #BDBDBD;">
				<br>
				<br>
				<p style="font-size: 20pt; color: black;">일정 날짜</p> 
				<p style="font-size: 24pt; color: black;">${todoDate}</p>
				<br>
				<br>
			</div>
		</div>
		
		</div>
		<div class="col-lg-6 mb-0" style="background-color: #FFFFFF;border-style: solid; border-color: #E0B94F; border-left-color: #353535; border-top-right-radius: 20px; border-bottom-right-radius:20px; padding-left: 0px; padding-right: 0px; ">
			<!-- TodoList -->
			<div style="margin: 160px 50px; background-color: #ffebb5; height: 70%; width: 90%; border-radius: 20px; border-style: solid; border-color: #BDBDBD;">
				<div style="margin-left: 10px;" >
				<br>
				<h1 style="text-align:center">일정 수정</h1>
				<a href="${pageContext.request.contextPath}/member/calendar"><button type="button">달력가기</button></a>
				<hr>
				<form method="post" id="updateTodoForm" action="${pageContext.request.contextPath}/member/updateTodo">
					<div>
						일정 날짜 : <input type="text" name="todoDate" value="${todoDate}" readonly="readonly">
					</div>
					<div>
						일정 내용
						<textarea rows="9" cols="107" name="todoContent" id="todoContent">${todoContent}</textarea>
					</div>
					<input type="hidden" name="todoNo" value="${todoNo}">
					<button style="float: right; margin-right: 2%;" type="button" id="updateBtn" class="btn btn-primary">저장</button>
				</form>
			</div>
			</div>
		</div>
	</div>
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