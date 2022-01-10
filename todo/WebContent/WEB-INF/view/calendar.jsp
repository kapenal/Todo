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
	<div class="container">
		<div class="jumbotron">
			<h1 style="text-align:center">달력</h1>
		</div>
		<div>
			<h3><span class="text-warning">${loginMember.memberId}</span>님 반갑습니다</h3>
			<a href="${pageContext.request.contextPath}/member/logout" class="btn btn-info">로그아웃</a>
			<a href="${pageContext.request.contextPath}/member/removeMember" class="btn btn-info">회원탈퇴</a>
		</div>
		<!-- 달력 + todo -->
		<div id="calendar">
		<h1>
			<span><a href="${pageContext.request.contextPath}/member/calendar?currentYear=${targetYear}&currentMonth=${targetMonth}&option=pre">◁</a></span>
			${targetYear}년 ${targetMonth}월 입니다 
			<span><a href="${pageContext.request.contextPath}/member/calendar?currentYear=${targetYear}&currentMonth=${targetMonth}&option=next">▷</a></span>
		</h1>
		</div>
		<div>
			이달의 일정 : ${todoList.size()}
		</div>
		<table class="table table-bordered table-sm">
			<tr style="text-align:center">
				<td class="table-danger" width="150">일</td><td width="150">월</td><td width="150">화</td><td width="150">수</td><td width="150">목</td><td width="150">금</td><td class="table-primary" width="150">토</td>
			</tr>
			<tr>
				<!-- JSTL for문 -->
				<c:forEach var="i" begin="1" end="${startBlank+endDay+endBlank}" step="1">
					<c:if test="${i-startBlank >= 1 && i-startBlank <= endDay}">
						<td style="text-align:center"  height="130">
							<div>
							<a href="${pageContext.request.contextPath}/member/todoList?y=${targetYear}&m=${targetMonth}&d=${i-startBlank}">${i-startBlank}</a>
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
						<td style="text-align:center" height="130" class="text-secondary" bgcolor="#EAEAEA">
							<a href="${pageContext.request.contextPath}/member/calendar?currentYear=${targetYear}&currentMonth=${targetMonth}&option=pre">${preEndDay+(i-startBlank)}</a>
						</td>	
					</c:if>
					<c:if test="${i-startBlank > endDay}">
						<td style="text-align:center" height="130" class="text-secondary" bgcolor="#EAEAEA">
							<a href="${pageContext.request.contextPath}/member/calendar?currentYear=${targetYear}&currentMonth=${targetMonth}&option=next">${i-startBlank-endDay}</a>
						</td>	
					</c:if>
					<c:if test="${i%7 == 0}">
						<tr></tr>
					</c:if>
				</c:forEach>
			</tr>
		</table>
	</div>
</body>
</html>