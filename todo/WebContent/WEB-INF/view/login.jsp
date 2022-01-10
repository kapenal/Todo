<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	a { text-decoration:none !important }
	a:hover { text-decoration:none !important }
div#login_wrapper {
	display: flex;
	justify-content: center;
	text-align: center;
}
div#noticeTable {
	text-align: center;
}
div#addBtn {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1 style="text-align:center">로그인</h1>
		</div>
		<div id="login_wrapper">
			<form method="post" id="loginForm" action="${pageContext.request.contextPath}/notLogin/login">
				<table class="table table-bordered">
					<tr>
						<td style="text-align:center">아이디</td>
						<td><input type="text" name="memberId" id="memberId" placeholder="아이디를 입력하세요"></td>
					</tr>
					<tr>
						<td style="text-align:center">비밀번호</td>
						<td><input type="password" name="memberPw" id="memberPw" placeholder="패스워드를 입력하세요"></td>
					</tr>
					<tr>
						<td style="text-align:center" colspan="2"><button type="button" id="loginBtn" class="btn btn-outline-primary">로그인</button></td>
					</tr>
				</table>
			</form>
		</div>
		<div id="addBtn">
			<a href="${pageContext.request.contextPath}/notLogin/addMember"><button class="btn btn-outline-info">회원가입</button></a>
		</div>
		<hr>
		<div id="noticeTable">
			<h2>공지사항<a href="${pageContext.request.contextPath}/noticeList">more</a></h2>
			<table class="table table-bordered">
				<tr>
					<td>공지사항</td>
					<td>작성날짜</td>
				</tr>
				<c:forEach var="n" items="${noticeList}">
					<tr>
						<td width="75%"><a href="${pageContext.request.contextPath}/noticeOne?noticeNo=${n.noticeNo}">${n.noticeTitle}</a></td>
						<td width="25%">${n.createDate}</td>
					</tr>
				</c:forEach>
			</table>
			<div>
				<a href="${pageContext.request.contextPath}/notLogin/adminLogin">[관리자 로그인]</a>
				<!-- 1. /adminLogin, AdminLoginController.doGet() adminLogin.jsp -->
				<!-- 2. /adminLogin, AdminLoginController.doPost() /admin/index, AdminIndexController -->
			</div>
		</div>
	</div>
	<script>
		// 버튼을 클릭했을 때
		$('#loginBtn').click(function(){	
			if($('#memberId').val() == '') { // id가 공백이면
				alert('ID를 입력하세요');
				return;
			} 
			if($('#memberPw').val() == '') { // pw가 공백이면
				alert('PW를 입력하세요');
				return;
			}
			$('#loginForm').submit();
		});
	</script>
</body>
</html>