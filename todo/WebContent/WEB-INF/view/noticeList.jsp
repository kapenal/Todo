<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	div#noticeTable {
		text-align: center;
	}
	#addNoticeBtn{
		float: right;
	}
</style>
</head>
<body>
	<div class="container" id="container">
		<div class="jumbotron">
			<h1 style="text-align:center">공지사항</h1>
		</div>
		<div id="noticeTable">
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
		</div>
		<c:if test="${loginAdmin != null}">
			<a href="${pageContext.request.contextPath}/admin/addNotice" id="addNoticeBtn" class="btn btn-outline-primary">글작성</a>
		</c:if>
		<div>
			<c:if test="${startPage > 1}">
				<a href="${pageContext.request.contextPath}/noticeList?currentPage=${startPage-1}" class="btn btn-outline-light text-dark">◁</a>
			</c:if>
			<c:forEach begin="${startPage}" end="${lastPage}" var="i">
				<c:choose>
					<c:when test="${i == currentPage}">
						<a href="${pageContext.request.contextPath}/noticeList?currentPage=${i}" class="btn btn-secondary">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/noticeList?currentPage=${i}" class="btn btn-outline-light text-dark">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPage != totalPage}">
				<a href="${pageContext.request.contextPath}/noticeList?currentPage=${lastPage+1}" class="btn btn-outline-light text-dark">▷</a>
			</c:if>
		</div>
	</div>
</body>
</html>