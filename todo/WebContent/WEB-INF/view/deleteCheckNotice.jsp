<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteCheckNotice.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1 style="text-align:center">공지사항 삭제</h1>
		</div>
		<h2 style="text-align:center">${noticeTitle} 를 삭제하겠습니까?</h2>
	</div>
	<!-- 버튼들 주소값 구하기부터...  -->
	<div style="text-align:center">
		<a href="${pageContext.request.contextPath}/admin/deleteNotice?noticeNo=${noticeNo}" id="deleteBtn" class="btn btn-outline-danger">삭제</a>
		<a href="${pageContext.request.contextPath}/noticeOne?noticeNo=${noticeNo}" id="insertBtn" class="btn btn-outline-success">취소</a>
	</div>
</body>
</html>