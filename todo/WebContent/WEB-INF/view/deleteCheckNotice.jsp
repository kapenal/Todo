<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteCheckNotice.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	a { text-decoration:none !important }
	a:hover { text-decoration:none !important }
</style>
</head>
<body>
	<div class="container" style="max-width: 1920px; padding-left: 0px; padding-right: 0px;">
	<div class="row p-4" style="background-color: #8C8C8C; margin-left: 0px; margin-right: 0px;  height: 969px;">
		<div class="col-lg-6 mb-0 align-itehms-left" style="background-color: #ffebb5; text-align: center;  border-style: solid;border-color: #FFC107; border-right-color: black; border-top-left-radius: 20px; border-bottom-left-radius:20px; padding-left: 0px; padding-right: 0px; max-height: 100%">
			<div style="margin: 280px 100px; ">
			<h1 style="color: black; font-size: 70pt;">공지사항 삭제</h1>
			<br>
			<br>
			<h1 style="font-size: 40pt; color: #8C8C8C;"><span style="color: black;">${loginAdmin.adminId}</span>님 반갑습니다</h1>
			<br>
			<a style="margin-right: 5%;'" href="${pageContext.request.contextPath}/admin/adminLogout" class="btn btn-warning">로그아웃</a>
		</div>
			</div>
			<div class="col-lg-6 mb-0" style="background-color: #FFFFFF; border-style: solid; border-color: #E0B94F; border-left-color: #353535; border-top-right-radius: 20px; border-bottom-right-radius:20px; padding-left: 0px; padding-right: 0px;">
				<!-- 공지사항 -->
				<div id="noticeTable" style="margin: 250px 50px; background-color: #ffebb5; height: 40%; width: 90%; border-radius: 20px; border-style: solid; border-color: #BDBDBD;">
				<div style="margin-left: 10px; margin-right: 10px;">
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 style="text-align:center">공지사항 게시글 ${noticeTitle} 를 삭제하겠습니까?</h2>
					<br>
					<div style="text-align:center">
						<a href="${pageContext.request.contextPath}/admin/deleteNotice?noticeNo=${noticeNo}" id="deleteBtn" class="btn btn-danger">삭제</a>
						<a href="${pageContext.request.contextPath}/admin/adminNoticeOne?noticeNo=${noticeNo}" id="insertBtn" class="btn btn-success">취소</a>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
</body>
</html>