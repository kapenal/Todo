<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminLogin.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
div#login_wrapper {
	display: flex;
	justify-content: center;
	text-align: center;
}
</style>
</head>
<body>
	<div class="container" id="container">
		<div class="jumbotron">
			<h1 style="text-align:center">관리자 로그인</h1>
		</div>
	</div>
	<div id="login_wrapper">
			<form method="post" id="loginForm" action="${pageContext.request.contextPath}/notLogin/adminLogin">
				<table class="table table-bordered">
					<tr>
						<td style="text-align:center">아이디</td>
						<td><input type="text" name="adminId" id="adminId" placeholder="아이디를 입력하세요"></td>
					</tr>
					<tr>
						<td style="text-align:center">비밀번호</td>
						<td><input type="password" name="adminPw" id="adminPw" placeholder="패스워드를 입력하세요"></td>
					</tr>
					<tr>
						<td style="text-align:center" colspan="2"><button type="button" id="loginBtn" class="btn btn-outline-primary">로그인</button></td>
					</tr>
				</table>
			</form>
		</div>
	<script>
		// 버튼을 클릭했을 때
		$('#loginBtn').click(function(){	
			if($('#adminId').val() == '') { // id가 공백이면
				alert('ID를 입력하세요');
				return;
			} 
			if($('#adminPw').val() == '') { // pw가 공백이면
				alert('PW를 입력하세요');
				return;
			}
			$('#loginForm').submit();
		});
	</script>
</body>
</html>