<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeOne.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	#deleteBtn, #insertBtn{
		float: right;
	}
</style>
</head>
<body>
	<div class="container" id="container">
		<div class="jumbotron">
			<h1 style="text-align:center">공지사항</h1>
		</div>
		<table class="table table-bordered">
			<tr style="text-align:center">
				<td width="80%" >${notice.noticeTitle}</td>
				<td width="20%">${notice.createDate}</td>
			</tr>
			<tr>
				<td colspan="2" height="300">${notice.noticeContent}</td>
			</tr>
		</table>
		<a href="${pageContext.request.contextPath}/noticeList"><button>목록</button></a>
		<c:if test="${loginAdmin != null}">
			<a href="${pageContext.request.contextPath}/admin/deleteCheckNotice?noticeNo=${notice.noticeNo}&noticeTitle=${notice.noticeTitle}" id="deleteBtn" class="btn btn-outline-danger">삭제</a>
			<a href="${pageContext.request.contextPath}/admin/updateNotice" id="insertBtn" class="btn btn-outline-success">수정</a>
		</c:if>
		
	</div>
</body>
</html>