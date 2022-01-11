<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div class="container" style="max-width: 1920px; padding-left: 0px; padding-right: 0px;">
	<div class="row p-4" style="background-color: #8C8C8C; margin-left: 0px; margin-right: 0px;  height: 969px;">
		<div class="col-lg-6 mb-0 align-itehms-left" style="background-color: #ffebb5; text-align: center;  border-style: solid;border-color: #FFC107; border-right-color: black; border-top-left-radius: 20px; border-bottom-left-radius:20px; padding-left: 0px; padding-right: 0px; max-height: 100%">
		<div style="margin: 350px 100px; ">
			<h1 style="font-size: 40pt; color: #8C8C8C;"><span style="color: black;">${loginAdmin.adminId}</span>님 반갑습니다</h1>
			<br>
			<a style="margin-right: 5%;'" href="${pageContext.request.contextPath}/admin/adminLogout" class="btn btn-warning">로그아웃</a>
		</div>
		
		</div>
		<div class="col-lg-6 mb-0" style="background-color: #FFFFFF; border-style: solid; border-color: #E0B94F; border-left-color: #353535; border-top-right-radius: 20px; border-bottom-right-radius:20px; padding-left: 0px; padding-right: 0px;">
			<div id="noticeTable" style="margin: 150px 50px; background-color: #ffebb5; height: 70%; width: 90%; border-radius: 20px; border-style: solid; border-color: #BDBDBD;">
				<div style="margin-left: 10px; margin-right: 10px;">
				<br>
				<h2 style="text-align: center;">공지사항</h2>
				<br>
				<table border="1" style="border-color: white; border-width:3px;  width: 100%; height: 250px;">
					<tr>
						<td style="border-color: white; border-width: 3px;">공지사항</td>
						<td style="border-color: white; border-width: 3px;">작성날짜</td>
					</tr>
					<c:forEach var="n" items="${noticeList}">
						<tr>
							<td width="75%" style="border-color: white; border-width: 3px;"><a href="${pageContext.request.contextPath}/admin/adminNoticeOne?noticeNo=${n.noticeNo}">${n.noticeTitle}</a></td>
							<td width="25%" style="border-color: white; border-width: 3px;">${fn:substring(n.createDate,0,16)}</td>
						</tr>
					</c:forEach>
				</table>
				<br>
				<c:if test="${loginAdmin != null}">
				<a href="${pageContext.request.contextPath}/admin/addNotice" id="addNoticeBtn" class="btn btn-primary">글작성</a>
			</c:if>
			<div>
				<c:if test="${startPage > 1}">
					<a href="${pageContext.request.contextPath}/admin/adminIndex?currentPage=${startPage-1}" class="btn btn-outline-light text-dark">◁</a>
				</c:if>
				<c:forEach begin="${startPage}" end="${lastPage}" var="i">
					<c:choose>
						<c:when test="${i == currentPage}">
							<a href="${pageContext.request.contextPath}/admin/adminIndex?currentPage=${i}" class="btn btn-secondary">${i}</a>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/admin/adminIndex?currentPage=${i}" class="btn btn-outline-light text-dark">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${lastPage != totalPage}">
					<a href="${pageContext.request.contextPath}/admin/adminIndex?currentPage=${lastPage+1}" class="btn btn-outline-light text-dark">▷</a>
				</c:if>
			</div>
			</div>
			</div>
			</div>
		</div>
	</div>
</body>
</html>