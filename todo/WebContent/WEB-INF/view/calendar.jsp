<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style type="text/css"> 
	a { text-decoration:none !important }
	a:hover { text-decoration:none !important }
	
	div#calendar{
		text-align: center;
	}
</style> 
</head>
<body>
	<div class="container" style="max-width: 1920px; padding-left: 0px; padding-right: 0px;">
	<div class="row p-5" style="background-color: #8C8C8C; margin-left: 0px; margin-right: 0px; height: 1007px;">
<!-- 		<div class="jumbotron"> -->
<!-- 			<h1 style="text-align:center">달력</h1> -->
<!-- 		</div> -->
		<div class="col-lg-6 mb-0 align-itehms-left" style="background-color: black; text-align: center;  border-style: solid;border-color: #FFC107; border-right-color: black; border-top-left-radius: 20px; border-bottom-left-radius:20px; padding-left: 0px; padding-right: 0px;">
		<div style="margin: 240px 100px; ">
			<h1 class="text-white" style="font-size: 40pt;"><span class="text-warning">${loginMember.memberId}</span>님 반갑습니다</h1>
			<br>
			<a style="margin-right: 5%;'" href="${pageContext.request.contextPath}/member/logout" class="btn btn-warning">로그아웃</a>
			<a href="${pageContext.request.contextPath}/member/removeMember" class="btn btn-warning">회원탈퇴</a>
			<br>
			<br>
			<br>
			<br>
			<div class="text-white" style="text-align: center;  border-radius: 50%; background-color: #FFC107; margin-left: 33%; margin-right: 33%;">
				<br>
				<br>
				<p style="font-size: 20pt; color: black;">이달의 일정</p> 
				<p style="font-size: 40pt;"> ${todoList.size()}</p>
				<br>
			</div>
		</div>
		
		</div>
		<div class="col-lg-6 mb-0" style="background-color: #FFC107; border-top-right-radius: 20px; border-bottom-right-radius:20px; padding-left: 0px; padding-right: 0px;">
			<!-- 달력 + todo -->
		<div id="calendar" style=" margin-top: 70px;">
		<h1 style=" margin-bottom:60px;">
			<span style="margin-right: 100px;">
				<a style="color: white;" href="${pageContext.request.contextPath}/member/calendar?currentYear=${targetYear-1}&currentMonth=${targetMonth}">◁</a>
				<a style="color: white;" href="${pageContext.request.contextPath}/member/calendar?currentYear=${targetYear}&currentMonth=${targetMonth}&option=pre">◀</a>
			</span>
			${targetYear}년 ${targetMonth}월 
			<span style="margin-left: 100px;">
				<a style="color: white;" href="${pageContext.request.contextPath}/member/calendar?currentYear=${targetYear}&currentMonth=${targetMonth}&option=next">▶</a>
				<a style="color: white;" href="${pageContext.request.contextPath}/member/calendar?currentYear=${targetYear+1}&currentMonth=${targetMonth}">▷</a>
			</span>
		</h1>
		</div>
		
		<table style="width: 100%;">
			<tr style="text-align:center">
				<tr style="text-align:center">
				<td class="table-danger" width="150">일</td>
				<td width="150" class="table-light">월</td>
				<td width="150" class="table-light">화</td>
				<td width="150" class="table-light">수</td>
				<td width="150" class="table-light">목</td>
				<td width="150" class="table-light">금</td>
				<td class="table-primary" width="150">토</td>
			</tr>
			</tr>
			<tr>
				<!-- JSTL for문 -->
				<c:forEach var="i" begin="1" end="${startBlank+endDay+endBlank}" step="1">
					<c:if test="${i-startBlank >= 1 && i-startBlank <= endDay}">
						<td style="text-align:center" height="110" onClick="location.href='${pageContext.request.contextPath}/member/todoList?y=${targetYear}&m=${targetMonth}&d=${i-startBlank}'">
							<div>
							<a style="color: black;" href="${pageContext.request.contextPath}/member/todoList?y=${targetYear}&m=${targetMonth}&d=${i-startBlank}">${i-startBlank}</a>
								<!-- 날짜별 일정 -->
								<c:forEach var="todo" items="${todoList}">
									<!-- el에서는 숫자를 자동으로 문자로 바꿔줌 -->
									<c:if test="${(i-startBlank) == todo.todoDate.substring(8)}">
										<div style="color:${todo.fontColor};">${todo.todoContent}</div>
									</c:if>
								</c:forEach>
							</div>
						</td>	
					</c:if>
					<c:if test="${i-startBlank < 1}">
						<td style="text-align:center" height="110" class="text-white" bgcolor="black" onClick="location.href='${pageContext.request.contextPath}/member/calendar?currentYear=${targetYear}&currentMonth=${targetMonth}&option=pre'">
							<a>${preEndDay+(i-startBlank)}</a>
						</td>	
					</c:if>
					<c:if test="${i-startBlank > endDay}">
						<td style="text-align:center" height="110" class="text-white" bgcolor="#8C8C8C" onClick="location.href='${pageContext.request.contextPath}/member/calendar?currentYear=${targetYear}&currentMonth=${targetMonth}&option=next'">
							<a>${i-startBlank-endDay}</a>
						</td>	
					</c:if>
					<c:if test="${i%7 == 0}">
						<tr></tr>
					</c:if>
				</c:forEach>
			</tr>
		</table>
		</div>
	</div>
	</div>
</body>
</html>