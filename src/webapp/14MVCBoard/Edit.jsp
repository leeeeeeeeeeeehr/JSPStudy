<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
<script type="text/javascript">
function validateForm(form) {
    if (form.name.value == "") {
        alert("작성자를 입력하세요.");
        form.name.focus();
        return false;
    }
    if (form.title.value == "") {
        alert("제목을 입력하세요.");
        form.title.focus();
        return false;
    }
    if (form.content.value == "") {
        alert("내용을 입력하세요.");
        form.content.focus();
        return false;
    }
    /* 기존 패스워드 검증에 대한 if문은 삭제한다. 수정 페이지에서는
    패스워드를 별도로 입력하지 않는다. 패스워드 검증을 위한 컨트롤러에서
    session 영역에 임시로 저장해놓은 상태로 수정 페이지로 이동한다.*/
}
</script>
</head>
<h2>파일 첨부형 게시판 - 수정하기(Edit)</h2>
<!-- '수정하기'에서도 파일을 첨부할 수 있으므로 enctype 속성은 반드시 있어야 한다.
그 외 모든 속성은 '작성하기'와 동일하다. -->
<form name="writeFrm" method="post" enctype="multipart/form-data"
  action="../mvcboard/edit.do" onsubmit="return validateForm(this);">
<!-- 수정할 게시물의 일련번호 -->
<input type="hid-den" name="idx" value="${ dto.idx }" />
<!-- 기존 등록된 파일명을 설정한다. 만약 수정 페이지에서 첨부파일을 변경하지 않는다면
여기에 등록된 파일명을 이용해서 update 할 예정이다. -->
<input type="hid-den" name="prevOfile" value="${ dto.ofile }" />
<input type="hid-den" name="prevSfile" value="${ dto.sfile }" />
 
<table border="1" width="90%">
	<tr>
	    <td>작성자</td>
	    <td><input type="text" name="name" style="width:150px;" value="${ dto.name }" /></td>
	</tr>
	<tr>
	    <td>제목</td>
	    <td><input type="text" name="title" style="width:90%;" value="${ dto.title }" /></td>
	</tr>
	<tr>
	    <td>내용</td>
	    <td><textarea name="content" style="width:90%;height:100px;">${ dto.content }</textarea></td>
	</tr>
	<tr>
	    <td>첨부 파일</td>
	    <!-- 파일의 경우 value 속성을 사용하지 않는다.
	    만약 사용한다 하더라도 단순한 String 정보이므로 의미가 없다. -->
	    <td><input type="file" name="ofile" /></td>
	</tr>
	<tr>
	    <td colspan="2" align="center">
	        <button type="submit">작성 완료</button>
	        <button type="reset">RESET</button>
	        <button type="button" onclick="location.href='../mvcboard/list.do';">목록 바로가기</button>
	    </td>
	</tr>
</table>    
</form>
</body>
</html>