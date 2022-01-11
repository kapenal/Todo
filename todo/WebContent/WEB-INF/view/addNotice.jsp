<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addNotice.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	<div class="row p-5" style="background-color: #8C8C8C; margin-left: 0px; margin-right: 0px; height: 1007px;">
		<div class="col-lg-6 mb-0 align-itehms-left" style="background-color: black; text-align: center;  border-style: solid;border-color: #FFC107; border-right-color: black; border-top-left-radius: 20px; border-bottom-left-radius:20px; padding-left: 0px; padding-right: 0px;">
		<div style="margin: 280px 100px; ">
			<h1 style="color: #FFC107; font-size: 70pt;">공지사항 작성</h1>
			<br>
			<br>
			<h1 class="text-white"><span class="text-warning">${loginAdmin.adminId}</span>님 반갑습니다</h1>
			<br>
			<a style="margin-right: 5%;'" href="${pageContext.request.contextPath}/admin/adminLogout" class="btn btn-warning">로그아웃</a>
		</div>
		
		</div>
		<div class="col-lg-6 mb-0" style="background-color: #FFC107; border-top-right-radius: 20px; border-bottom-right-radius:20px; padding-left: 0px; padding-right: 0px;">
			<form method="post" id="addNoticeForm" action="${pageContext.request.contextPath}/admin/addNotice" style="margin: 130px 100px;">
				<h2 style="text-align: center;">공지사항</h2>
				<br>
				<table class="table table-bordered">
					<tr>
						<td style="text-align:center" style="width:15%;">제목</td>
						<td><input style="width:60%;" type="text" name="noticeTitle" id="noticeTitle" placeholder="제목을 입력하세요"></td>
					</tr>
					<tr>
						<td style="text-align:center" style="width:15%;">내용</td>
						<td>
							<textarea rows="18" cols="80" name="noticeContent" id="noticeContent" placeholder="내용을 입력하세요"></textarea>
						</td>
					</tr>
				</table>
				<button style="text-align:center" type="button" id="addBtn" class="btn btn-outline-primary">저장</button>
			</form>
			</div>
		</div>
	</div>
	<script>
		// 버튼을 클릭했을 때
		$('#addBtn').click(function(){	
			if($('#noticeContent').val() == '') { // id가 공백이면
				alert('제목을 입력하세요');
				return;
			} 
			if($('#noticeContent').val() == '') { // pw가 공백이면
				alert('내용을 입력하세요');
				return;
			}
			$('#addNoticeForm').submit();
		});
	</script>
</body>
</html>