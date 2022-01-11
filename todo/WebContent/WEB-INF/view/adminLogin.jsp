<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminLogin.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
div#login_wrapper {
	display: flex;
	justify-content: center;
	text-align: center;
}
div#noticeTable {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container" style="max-width: 1920px; padding-left: 0px; padding-right: 0px;">
	<div class="row p-4" style="background-color: #8C8C8C; margin-left: 0px; margin-right: 0px;  height: 969px;">
		<div class="col-lg-6 mb-0 align-itehms-left" style="background-color: #ffebb5; text-align: center;  border-style: solid;border-color: #FFC107; border-right-color: black; border-top-left-radius: 20px; border-bottom-left-radius:20px; padding-left: 0px; padding-right: 0px; max-height: 100%">
		<div style="margin: 240px 100px;">
			<h1 style="color: black; font-size: 70pt;">관리자 로그인</h1>
			<br>
			<br>
			<div id="login_wrapper">
				<form method="post" id="loginForm" action="${pageContext.request.contextPath}/notLogin/adminLogin">
					<table class="table table-bordered" style="bgcolor:white; background-color: white;">
						<tr>
							<td style="text-align:center; color: black">아이디</td>
							<td><input type="text" name="adminId" id="adminId" placeholder="아이디를 입력하세요" value="admin"></td>
						</tr>
						<tr>
							<td style="text-align:center; color: black">비밀번호</td>
							<td><input type="password" name="adminPw" id="adminPw" placeholder="패스워드를 입력하세요" value="1234"></td>
						</tr>
						<tr>
							<td style="text-align:center" colspan="2"><button type="button" id="loginBtn" class="btn btn-warning">로그인</button></td>
						</tr>
					</table>
				</form>
			</div>
			<a href="${pageContext.request.contextPath}/notLogin/login"><button class="btn btn-info">회원 로그인</button></a>
		</div>
		
		</div>
		<div class="col-lg-6 mb-0" style="background-color: #FFFFFF; border-style: solid; border-color: #E0B94F; border-left-color: #353535; border-top-right-radius: 20px; border-bottom-right-radius:20px; padding-left: 0px; padding-right: 0px;">
			<!-- 공지사항 -->
			<div id="noticeTable" style="margin: 250px 100px; margin: 200px 50px; background-color: #ffebb5; height: 50%; width: 90%; border-radius: 20px; border-style: solid; border-color: #BDBDBD;">
				<div style="margin-left: 10px; margin-right: 10px;">
				<br>
				<h2 style="margin-left: 35%;">공지사항<a style="margin-left: 50%; color: #8C8C8C;" href="${pageContext.request.contextPath}/notLogin/noticeList">more</a></h2>
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
	</div>
	<script>
		// 버튼을 클릭했을 때
		$('#loginBtn').click(function(){	
			if($('#adminId').val() == '') { // id가 공백이면
				alert('ID를 입력하세요');
				return;
			} 
			if($('#adminPw').val() == '') { // pw가 공백이면
				alert('PW를 입력하세요');
				return;
			}
			$('#loginForm').submit();
		});
	</script>
</body>
</html>