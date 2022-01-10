<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteMemberForm.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1 style="text-align:center">회원 탈퇴</h1>
		</div>
		<a href="${pageContext.request.contextPath}/member/calendar"><button type="button">달력가기</button></a>
		<hr>
		<span><h2>회원탈퇴하겠습니까?</h2></span>
		<br>
		<form method="post" id="deleteForm" action="${pageContext.request.contextPath}/member/removeMember">
			<table border="1">
				<tr>
					<td style="text-align:center" width="200">비밀번호를 입력해주세요</td>
					<td><input type="password" name="memberPw" id="memberPw"></td>
				</tr>
			</table>
			<br>
				<button class="btn btn-danger" type="button" id="deleteBtn" class="btn btn-outline-primary">회원탈퇴</button>
		</form>
	</div>
	<script>
		// 버튼을 클릭했을 때
		$('#deleteBtn').click(function(){	
			if($('#memberPw').val() == '') { // pw가 공백이면
				alert('PW를 입력하세요');
				return;
			}
			$('#deleteForm').submit();
		});
	</script>
</body>
</html>