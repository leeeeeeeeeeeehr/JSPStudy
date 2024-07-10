<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>FileUpload</title></head>
<script>
	/* 폼값을 submit(전송)할 때 빈 값에 대한 검증을 진행한다.
	만약 빈 값이 발견되면 리스너쪽으로 false를 반환한다. */
	function validateForm(form) {
		if (form.title.value == "") {
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;			
		}
		if (form.ofile.value == "") {
			alert("첨부파일은 필수입니다.");
			return false;
		}
	}
</script>
<body>
	<h3>파일 업로드</h3>
	<span style="color: red;">${ errorMessage }</span>
	<!-- 파일 첨부를 위한 <form> 태그 구성 시 2가지 필수사항
	1. method(= 전송방식)는 반드시 post로 지정한다.
	2. enctype 속성은 'multipart/form-data'로 지정한다.
	만약, get 방식으로 지정하면 파일이 전송되는게 아니라 파일명만 전송된다. -->
	<form name="fileForm" method="post" enctype="multipart/form-data"
				action="UploadProcess.do" onsubmit="return validateForm(this);">
		<!-- text 타입은 일반적인 한 줄 입력상자이다. -->
		제목 : <input type="text" name="title" /><br />
		<!-- 파일 첨부를 위한 file 타입 지정, 파일 선택을 위한 버튼이 출력된다. -->
		첨부파일 : <input type="file" name="ofile" /><br />
		<input type="submit" value="전송하기" />
	</form>
</body>
</html>