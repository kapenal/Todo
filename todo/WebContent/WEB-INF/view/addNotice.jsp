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
	<div class="row p-4" style="background-color: #8C8C8C; margin-left: 0px; margin-right: 0px;  height: 969px;">
		<div class="col-lg-6 mb-0 align-itehms-left" style="background-color: #ffebb5; text-align: center;  border-style: solid;border-color: #FFC107; border-right-color: black; border-top-left-radius: 20px; border-bottom-left-radius:20px; padding-left: 0px; padding-right: 0px; max-height: 100%;">
		<div style="margin: 280px 100px; ">
			<h1 style="color: black; font-size: 70pt;">공지사항 작성</h1>
			<br>
			<br>
			<h1 style="font-size: 40pt; color: #8C8C8C;"><span style="color: black;">${loginAdmin.adminId}</span>님 반갑습니다</h1>
			<br>
			<a style="margin-right: 5%;'" href="${pageContext.request.contextPath}/admin/adminLogout" class="btn btn-warning">로그아웃</a>
		</div>
		
		</div>
		<div class="col-lg-6 mb-0" style="background-color: #FFFFFF; border-style: solid; border-color: #E0B94F; border-left-color: #353535; border-top-right-radius: 20px; border-bottom-right-radius:20px; padding-left: 0px; padding-right: 0px;">
			<div style="margin: 110px 50px; background-color: #ffebb5; height: 80%; width: 90%; border-radius: 20px; border-style: solid; border-color: #BDBDBD;">
			<div  style="margin-left: 10px; margin-right: 10px;">
			<br>
			<form method="post" id="addNoticeForm" action="${pageContext.request.contextPath}/admin/addNotice">
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
				<button style="text-align:center" type="button" id="addBtn" class="btn btn-primary">저장</button>
			</form>
			</div>
			</div>
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