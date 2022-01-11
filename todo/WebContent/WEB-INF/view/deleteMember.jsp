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
	<div class="row p-4" style="background-color: #8C8C8C; margin-left: 0px; margin-right: 0px;  height: 969px;">
		<div class="col-lg-6 mb-0 align-itehms-left" style="background-color: #ffebb5; text-align: center;  border-style: solid;border-color: #FFC107; border-right-color: black; border-top-left-radius: 20px; border-bottom-left-radius:20px; padding-left: 0px; padding-right: 0px; max-height: 100%">
		<div style="margin: 240px 100px; ">
			<h1 style="color: black; font-size: 70pt;">회원탈퇴</h1>
			<br>
			<h1 style="font-size: 40pt; color: #8C8C8C;"><span style="color: black;">${loginMember.memberId}</span>님 반갑습니다</h1>
			<br>
			<a style="margin-right: 5%;'" href="${pageContext.request.contextPath}/member/logout" class="btn btn-warning">로그아웃</a>
			<a href="${pageContext.request.contextPath}/member/calendar" class="btn btn-warning">취소</a>
		</div>
		
		</div>
		<div class="col-lg-6 mb-0" style="background-color: #FFFFFF; border-style: solid; border-color: #E0B94F; border-left-color: #353535; border-top-right-radius: 20px; border-bottom-right-radius:20px; padding-left: 0px; padding-right: 0px;">
			<div style=" margin: 270px 50px; background-color: #ffebb5; height: 40%; width: 90%; border-radius: 20px; border-style: solid; border-color: #BDBDBD;">
				<div style="text-align: center;">
				<br>
				<br>
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