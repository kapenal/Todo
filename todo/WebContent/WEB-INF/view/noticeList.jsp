<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
	<div class="row p-4" style="background-color: #8C8C8C; margin-left: 0px; margin-right: 0px;  height: 969px;">
		<div class="col-lg-6 mb-0 align-itehms-left" style="background-color: #ffebb5; text-align: center;  border-style: solid;border-color: #FFC107; border-right-color: black; border-top-left-radius: 20px; border-bottom-left-radius:20px; padding-left: 0px; padding-right: 0px; max-height: 100%">
			<div style="margin: 240px 100px;">
				<h1 style="color: black; font-size: 70pt;">공지사항</h1>
				<br>
				<br>
				<div id="login_wrapper">
					<form method="post" id="loginForm" action="${pageContext.request.contextPath}/notLogin/login">
						<table class="table table-bordered" style="bgcolor:white; background-color: white;">
							<tr>
								<td style="text-align:center; color: black">아이디</td>
								<td><input type="text" name="memberId" id="memberId" placeholder="아이디를 입력하세요" value="goodee"></td>
							</tr>
							<tr>
								<td style="text-align:center; color: black">비밀번호</td>
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
			<div class="col-lg-6 mb-0" style="background-color: #FFFFFF; border-style: solid; border-color: #E0B94F; border-left-color: #353535; border-top-right-radius: 20px; border-bottom-right-radius:20px; padding-left: 0px; padding-right: 0px;">
				<!-- 공지사항 -->
				<div id="noticeTable" style="margin: 150px 50px; background-color: #ffebb5; height: 70%; width: 90%; border-radius: 20px; border-style: solid; border-color: #BDBDBD;">
				<div style="margin-left: 10px; margin-right: 10px;">
				<br>
				<h2 style="text-align: center;">공지사항</h2>
				<br>
				<table border="1" style="border-color: black; width: 100%; height: 250px;">
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
				<br>
				<div>
					<c:if test="${startPage > 1}">
						<a href="${pageContext.request.contextPath}/notLogin/noticeList?currentPage=${startPage-1}" class="btn btn-outline-light text-dark">◁</a>
					</c:if>
					<c:forEach begin="${startPage}" end="${lastPage}" var="i">
						<c:choose>
							<c:when test="${i == currentPage}">
								<a href="${pageContext.request.contextPath}/notLogin/noticeList?currentPage=${i}" class="btn btn-secondary">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/notLogin/noticeList?currentPage=${i}" class="btn btn-outline-light text-dark">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${lastPage != totalPage}">
						<a href="${pageContext.request.contextPath}/notLogin/noticeList?currentPage=${lastPage+1}" class="btn btn-outline-light text-dark">▷</a>
					</c:if>
				</div>
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