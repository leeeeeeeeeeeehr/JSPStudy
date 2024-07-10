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
	<h3>파일 업로드 (multiple 속성 추가)</h3>
	<span style="color: red;">${ errorMessage }</span>
	<form name="fileForm" method="post" enctype="multipart/form-data"
				action="MultiProcess.do" onsubmit="return validateForm(this);">
		제목 : <input type="text" name="title" /><br />
		<!-- file 타입의 태그에 multiple 속성을 부여하면 2개 이상의 파일을 선택할 수 있다.
		Ctrl키 혹은 Drag&Drop으로 선택한다. -->
		첨부파일 : <input type="file" name="ofile" multiple /><br />
		<input type="submit" value="전송하기" />
	</form>
</body>
</html>