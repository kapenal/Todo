<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	a { text-decoration:none !important }
	a:hover { text-decoration:none !important }
div#noticeTable {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1 style="text-align:center">INDEX</h1>
		</div>
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
		</div>
	</div>
</body>
</html>