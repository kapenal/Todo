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
	<div class="row p-5" style="background-color: #8C8C8C; margin-left: 0px; margin-right: 0px;  height: 1007px;">
		<div class="col-lg-6 mb-0 align-itehms-left" style="background-color: black; text-align: center;  border-style: solid;border-color: #FFC107; border-right-color: black; border-top-left-radius: 20px; border-bottom-left-radius:20px; padding-left: 0px; padding-right: 0px; max-height: 100%">
			<div style="margin: 280px 100px; ">
			<h1 style="color: #FFC107; font-size: 70pt;">공지사항</h1>
			<br>
			<br>
			<h1 class="text-white"><span class="text-warning">${loginAdmin.adminId}</span>님 반갑습니다</h1>
			<br>
			<a style="margin-right: 5%;'" href="${pageContext.request.contextPath}/admin/adminLogout" class="btn btn-warning">로그아웃</a>
		</div>
			
			</div>
			<div class="col-lg-6 mb-0" style="background-color: #FFC107; border-top-right-radius: 20px; border-bottom-right-radius:20px; padding-left: 0px; padding-right: 0px;">
				<!-- 공지사항 -->
				<div id="noticeTable" style="margin: 200px 100px;">
				<h2 style="text-align: center;">공지사항</h2>
				<br>
				<table class="table table-bordered">
					<tr style="text-align:center">
						<td width="80%" style="border-color: white; border-width: 3px;">${notice.noticeTitle}</td>
						<td width="20%" style="border-color: white; border-width: 3px;">${notice.createDate}</td>
					</tr>
					<tr>
						<td colspan="2" height="300" style="border-color: white; border-width: 3px;">${notice.noticeContent}</td>
					</tr>
				</table>
				<a href="${pageContext.request.contextPath}/admin/adminIndex"><button class="btn btn-light"	>목록</button></a>
				<c:if test="${loginAdmin != null}">
						<a href="${pageContext.request.contextPath}/admin/deleteCheckNotice?noticeNo=${notice.noticeNo}&noticeTitle=${notice.noticeTitle}" id="deleteBtn" class="btn btn-danger">삭제</a>
				</c:if>
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