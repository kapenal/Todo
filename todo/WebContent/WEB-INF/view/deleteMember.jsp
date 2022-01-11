<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteMemberForm.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style type="text/css"> 
	a { text-decoration:none !important }
	a:hover { text-decoration:none !important }
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
			<h1 style="color: #FFC107; font-size: 70pt;">회원탈퇴</h1>
			<br>
			<h1 class="text-white" style="font-size: 40pt;"><span class="text-warning">${loginMember.memberId}</span>님 반갑습니다</h1>
			<br>
			<a style="margin-right: 5%;'" href="${pageContext.request.contextPath}/member/logout" class="btn btn-warning">로그아웃</a>
			<a href="${pageContext.request.contextPath}/member/calendar" class="btn btn-warning">취소</a>
		</div>
		
		</div>
		<div class="col-lg-6 mb-0" style="background-color: #FFC107; border-top-right-radius: 20px; border-bottom-right-radius:20px; padding-left: 0px; padding-right: 0px;">
			<div style=" margin: 300px 50px;">
				<div style="text-align: center;">
				<span><h2 style="font-size: 40pt;">회원탈퇴하겠습니까?</h2></span>
				<br>
				<form method="post" id="deleteForm" action="${pageContext.request.contextPath}/member/removeMember">
					<table style="margin-left: 50px;">
						<tr style="width: 800px;">
							<td style="text-align:center; font-size:24pt;" width="400">비밀번호를 입력해주세요</td>
							<td><input type="password" name="memberPw" id="memberPw" style="width: 300px;"></td>
						</tr>
					</table>
					<br>
					<button class="btn btn-danger" type="button" id="deleteBtn" class="btn btn-outline-primary">회원탈퇴</button>
				</form>
				</div>
			</div>
		</div>
	</div>
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