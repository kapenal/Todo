<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style>
	a { text-decoration:none !important }
	a:hover { text-decoration:none !important }
div#login_wrapper {
	display: flex;
	justify-content: center;
	text-align: center;
	width: 100%;
	height: 100%;
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
	<div class="container" style="max-width: 1920px; padding-left: 0px; padding-right: 0px;">
	<div class="row p-5" style="background-color: #8C8C8C; margin-left: 0px; margin-right: 0px;  height: 1007px;">
		<div class="col-lg-6 mb-0 align-itehms-left" style="background-color: black; text-align: center;  border-style: solid;border-color: #FFC107; border-right-color: black; border-top-left-radius: 20px; border-bottom-left-radius:20px; padding-left: 0px; padding-right: 0px; max-height: 100%">
		<div style="margin: 240px 100px;">
			<h1 style="color: #FFC107; font-size: 70pt;">일정 관리 달력</h1>
			<br>
			<br>
			<div id="login_wrapper">
				<form method="post" id="loginForm" action="${pageContext.request.contextPath}/notLogin/login">
					<table class="table table-bordered">
						<tr>
							<td style="text-align:center; color: #FFC107">아이디</td>
							<td><input type="text" name="memberId" id="memberId" placeholder="아이디를 입력하세요" value="goodee"></td>
						</tr>
						<tr>
							<td style="text-align:center; color: #FFC107">비밀번호</td>
							<td><input type="password" name="memberPw" id="memberPw" placeholder="패스워드를 입력하세요" value="1234"></td>
						</tr>
						<tr>
							<td style="text-align:center" colspan="2"><button type="button" id="loginBtn" class="btn btn-warning">로그인</button></td>
						</tr>
					</table>
				</form>
			</div>
			<div id="addBtn">
				<a href="${pageContext.request.contextPath}/notLogin/addMember"><button class="btn btn-info" style="margin-right: 12%;">회원가입</button></a>
				<a href="${pageContext.request.contextPath}/notLogin/adminLogin"><button class="btn btn-danger">관리자 로그인</button></a>
			</div>
		</div>
		
		</div>
		<div class="col-lg-6 mb-0" style="background-color: #FFC107; border-top-right-radius: 20px; border-bottom-right-radius:20px; padding-left: 0px; padding-right: 0px;">
			<!-- 공지사항 -->
			<div id="noticeTable" style="margin: 250px 100px;">
				<h2 style="margin-left: 35%;">공지사항<a style="margin-left: 50%; color: white;" href="${pageContext.request.contextPath}/notLogin/noticeList">more</a></h2>
				<br>
				<table border="1" style="border-color: white; width: 100%; height: 250px;" >
					<tr>
						<td style="border-color: white; border-width: 3px;">공지사항</td>
						<td style="border-color: white; border-width: 3px;">작성날짜</td>
					</tr>
					<c:forEach var="n" items="${noticeList}">
						<tr>
							<td width="75%" style="border-color: white; border-width: 3px;"><a href="${pageContext.request.contextPath}/notLogin/noticeOne?noticeNo=${n.noticeNo}">${n.noticeTitle}</a></td>
							<td width="25%" style="border-color: white; border-width: 3px;">${fn:substring(n.createDate,0,16)}</td>
						</tr>
					</c:forEach>
				</table>
			<div>
		</div>
	</div>
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