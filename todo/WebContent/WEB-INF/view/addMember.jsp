<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addMember.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		if($('#checkmemberId').val() == ''){
			$('#checkmemberId').focus();
		}
			   $('#checkmemberId').blur(function(){
			      if($('#checkmemberId').val() != '') {
			    	  $('#checkMember').submit()
			    	 // 이슈 : 사용 가능 후 아이디 다시 검색이 안됨 버튼 사용이 필요...
			    	  if($('#result').val() == '사용불가') {
			              $('#idCheckMsg').text('이미 사용중인 ID입니다');
			              $('#checkmemberId').focus();
			           } else if($('#result').val() == '사용가능'){
			              $('#idCheckMsg').text('사용가능한 ID입니다');
			              $('#checkmemberId').val(${result});
			           }
			      } else{
			    	  $('#idCheckMsg').text('체크할 ID를 입력하세요');
				      $('#checkmemberId').focus();
			      }
			   });
		 
	   $('#addBtn').click(function(){	
			if($('#memberId').val() == '') { // id가 공백이면
				alert('ID를 입력하세요');
				return;
			} 
			if($('#memberPw').val() == '') { // pw가 공백이면
				alert('PW를 입력하세요');
				return;
			}
			$('#addMemberForm').submit();
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1 style="text-align:center">회원가입</h1>
		</div>
	
		<table class="table table-bordered">
			<tr>
				<td style="text-align:center" width="200px">아이디 중복검사</td>
				<td>
					<form method="post" id="checkMember" action="${pageContext.request.contextPath}/notLogin/checkMember">
							<input type="text" name="memberId" id="checkmemberId" placeholder="아이디를 입력하세요" value="${memberId}">
						<span id="idCheckMsg">${result}</span>
						
					</form>
				</td>
			</tr>
			<tr>
				<form method="post" id="addMemberForm" action="${pageContext.request.contextPath}/notLogin/addMember">
				<td style="text-align:center" style="width:15%;">아이디</td>
				<td><input type="text" name="memberId" id="memberId" placeholder="아이디를 입력하세요" value="${memberId}" readonly/></td>
			</tr>
			<tr>
				<td style="text-align:center" style="width:15%;">비밀번호</td>
				<td><input type="password" name="memberPw" id="memberPw" placeholder="패스워드를 입력하세요"></td>
			</tr>
			<tr>
				<td style="text-align:center" colspan="2" width="120"><button type="button" id="addBtn" class="btn btn-outline-primary">회원가입</button></td>
			</tr>
				</form>
		</table>
	</div>
</body>
</html>