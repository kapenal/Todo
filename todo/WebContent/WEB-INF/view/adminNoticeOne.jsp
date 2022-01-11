<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminNoticeOne.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	#deleteBtn, #insertBtn{
		float: right;
	}
</style>
<style>
	a { text-decoration:none !important }
	a:hover { text-decoration:none !important }
</style>
</head>
<body>
	<div class="container" style="max-width: 1920px; padding-left: 0px; padding-right: 0px;">
	<div class="row p-4" style="background-color: #8C8C8C; margin-left: 0px; margin-right: 0px;  height: 969px;">
		<div class="col-lg-6 mb-0 align-itehms-left" style="background-color: #ffebb5; text-align: center;  border-style: solid;border-color: #FFC107; border-right-color: black; border-top-left-radius: 20px; border-bottom-left-radius:20px; padding-left: 0px; padding-right: 0px; max-height: 100%;">
			<div style="margin: 280px 100px; ">
			<h1 style="color: black; font-size: 70pt;">공지사항</h1>
			<br>
			<br>
			<h1 style="font-size: 40pt; color: #8C8C8C;"><span style="color: black;">${loginAdmin.adminId}</span>님 반갑습니다</h1>
			<br>
			<a style="margin-right: 5%;'" href="${pageContext.request.contextPath}/admin/adminLogout" class="btn btn-warning">로그아웃</a>
		</div>
			
			</div>
			<div class="col-lg-6 mb-0" style="background-color: #FFFFFF; border-style: solid; border-color: #E0B94F; border-left-color: #353535; border-top-right-radius: 20px; border-bottom-right-radius:20px; padding-left: 0px; padding-right: 0px;">
				<!-- 공지사항 -->
				<div id="noticeTable" style="margin: 150px 50px; background-color: #ffebb5; height: 70%; width: 90%; border-radius: 20px; border-style: solid; border-color: #BDBDBD;">
				<div style="margin-left: 10px; margin-right: 10px;">
				<br>
				<h2 style="text-align: center;">공지사항</h2>
				<br>
				<table border="1" style="border-color: white; border-width:3px; background-color: white;">
					<tr style="text-align:center">
						<td width="80%" style="border-color: white; border-width: 3px;">${notice.noticeTitle}</td>
						<td width="20%" style="border-color: white; border-width: 3px;">${notice.createDate}</td>
					</tr>
					<tr>
						<td colspan="2" height="300" style="border-color: white; border-width: 3px;">${notice.noticeContent}</td>
					</tr>
				</table>
				<br>
				<a href="${pageContext.request.contextPath}/admin/adminIndex"><button class="btn btn-light"	>목록</button></a>
				<c:if test="${loginAdmin != null}">
						<a href="${pageContext.request.contextPath}/admin/deleteCheckNotice?noticeNo=${notice.noticeNo}&noticeTitle=${notice.noticeTitle}" id="deleteBtn" class="btn btn-danger">삭제</a>
				</c:if>
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