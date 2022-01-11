<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todoList.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style type="text/css"> 
	table {
    margin-left:auto; 
    margin-right:auto;
}
</style>
<style type="text/css"> 
	a { text-decoration:none !important }
	a:hover { text-decoration:none !important }
</style> 
</head>
<body>
	<div class="container" style="max-width: 1920px; padding-left: 0px; padding-right: 0px;">
	<div class="row p-4" style="background-color: #8C8C8C; margin-left: 0px; margin-right: 0px; height: 969px; padding: 1rem;">
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
				<p style="font-size: 20pt; color: black;">일정 개수</p> 
				<p style="font-size: 40pt; color: black;">${todoSize}</p>
				<br>
			</div>
		</div>
		
		</div>
		<div class="col-lg-6 mb-0" style="background-color: #FFFFFF; border-style: solid; border-color: #E0B94F; border-left-color: #353535; border-top-right-radius: 20px; border-bottom-right-radius:20px; padding-left: 0px; padding-right: 0px;">
			<!-- TodoList -->
			<div style="margin: 40px 50px; background-color: #ffebb5; height: 90%; width: 90%; border-radius: 20px; border-style: solid; border-color: #BDBDBD;">
			<div style="margin-left: 10px; margin-top: 20px;">
				<br>
				<h1 style="text-align:center">일정 목록</h1>
				
				<a href="${pageContext.request.contextPath}/member/calendar"><button type="button">달력가기</button></a>
				<hr>
				<div style="text-align:center" ><h2>${todoDate} 일정</h2></div>
				<div id="todoList">
					<table border="1" style="background-color: white;">
						<tr>
							<td style="text-align:center" width="10%">날짜</td>
							<td style="text-align:center" width="50%">내용</td>
							<td style="text-align:center" width="10%">입력 날짜</td>
							<td style="text-align:center" width="10%">수정 날짜</td>
							<td style="text-align:center" width="5%">수정</td>
							<td style="text-align:center" width="5%">삭제</td>
						</tr>
						<c:if test="${todoList.size() == 0}">
								<tr>
									<td colspan="7" style="text-align:center">일정이 없습니다</td>
								</tr>
							</c:if>
						<c:forEach var="t" items="${todoList}">
							<tr>
								<td style="text-align:center">${todoDate}</td>
								<td style="text-align:center">${t.todoContent}</td>
								<td style="text-align:center">${t.createDate}</td>
								<td style="text-align:center">${t.updateDate}</td>
								<td style="text-align:center"><a href="${pageContext.request.contextPath}/member/updateTodo?todoNo=${t.todoNo}&todoDate=${todoDate}"><img src="${pageContext.request.contextPath}/image/update_icon.png" width="40" height="40"></a></td>
								<td style="text-align:center"><a href="${pageContext.request.contextPath}/member/removeTodo?todoNo=${t.todoNo}&todoDate=${todoDate}"><img src="${pageContext.request.contextPath}/image/delete_icon.png" width="40" height="40"></a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<hr>
				<h1 style="text-align:center" >일정 추가</h1>
				<form method="post" id="addListForm" action="${pageContext.request.contextPath}/member/addTodo">
					<!-- AddTodoController.class -->
					<div>
						오늘 날짜 : <input type="text" name="todoDate" value="${todoDate}" readonly="readonly">
					</div>
					<div>
						일정 내용   
						<textarea rows="3" cols="106" name="todoContent" id="todoContent" placeholder="일정을 입력하세요"></textarea>
					</div>
					<div>
						색상 선택
						<input type="color" name="fontColor">
					</div>
					<button  style="float: right; margin-right: 2%;" type="button" id="addBtn" class="btn btn-primary">저장</button>
				</form>
			</div>
			</div>
		</div>
	</div>
	</div>
	<script>
		// 버튼을 클릭했을 때
		$('#addBtn').click(function(){	
			if($('#todoContent').val() == '') { // textarea가 공백이면
				alert('내용을 입력하세요');
				return;
			}
			$('#addListForm').submit();
		});
	</script>
</body>
</html>