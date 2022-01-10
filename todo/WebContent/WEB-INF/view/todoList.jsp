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
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1 style="text-align:center">일정 목록</h1>
		</div>
		<a href="${pageContext.request.contextPath}/member/calendar"><button type="button">달력가기</button></a>
		<hr>
		<div style="text-align:center" ><h2>${todoDate} 일정</h2></div>
		<div id="todoList">
			<table border="1">
				<tr>
					<td style="text-align:center" width="10%">날짜</td>
					<td style="text-align:center" width="60%">내용</td>
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
						<td>${t.todoContent}</td>
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
				<textarea rows="3" cols="100" name="todoContent" id="todoContent" placeholder="일정을 입력하세요"></textarea>
			</div>
			<div>
				색상 선택
				<input type="color" name="fontColor">
			</div>
			<button type="button" id="addBtn" class="btn btn-outline-primary">저장</button>
		</form>
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