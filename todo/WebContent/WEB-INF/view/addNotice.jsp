<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addNotice.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1 style="text-align:center">공지사항 작성</h1>
		</div>
	<form method="post" id="addNoticeForm" action="${pageContext.request.contextPath}/admin/addNotice">
		<table class="table table-bordered">
			<tr>
				<td style="text-align:center" style="width:15%;">제목</td>
				<td><input type="text" name="noticeTitle" id="noticeTitle" placeholder="제목을 입력하세요"></td>
			</tr>
			<tr>
				<td style="text-align:center" style="width:15%;">내용</td>
				<td>
					<textarea rows="3" cols="100" name="noticeContent" id="noticeContent" placeholder="내용을 입력하세요"></textarea>
				</td>
			</tr>
		</table>
		<button style="text-align:center" type="button" id="addBtn" class="btn btn-outline-primary">저장</button>
	</form>
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