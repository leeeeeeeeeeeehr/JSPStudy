<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSP 최상단에 인클루드하여 로그인 정보가 없다면 즉시 로그인 페이지로 이동시킨다. -->
<%@ include file="./IsLoggedIn.jsp"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<!-- 글쓰기 페이지에서 폼값 전송 시 제목과 내용이 입력되었는지 검증하는 JS 함수 선언 -->
<script type="text/javascript">
function validateForm(form) {  // 폼 내용 검증
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
}
</script>
</head>

<body>
<jsp:include page="../Common/Link.jsp" />
<h2>회원제 게시판 - 글쓰기(Write)</h2>
<!-- 글쓰기 폼은 반드시 post 방식으로 제작해야 한다.
get 방식은 파일을 첨부할 수 없고 전송령도 4Kb로 제한되어 있다.
하지만 post 방식은 전송량의 제한이 없고 이미지, 음원 등의 파일도 전송할 수 있기 때문이다. -->
<form name="writeFrm" method="post" action="WriteProcess.jsp"
      onsubmit="return validateForm(this);">
    <table border="1" width="90%">
       <tr>
           <td>제목</td>
           <td><input type="text" name="title" style="width: 90%;" /></td>
       </tr>
       <tr>
           <td>내용</td>
           <td><textarea name="content" style="width: 90%; height: 100px;"></textarea></td>
       </tr>
       <tr>
           <td colspan="2" align="center">
               <button type="submit">작성 완료</button>
               <button type="reset">다시 입력</button>
               <button type="button" onclick="location.href='List.jsp';">목록 보기</button>
           </td>
       </tr>
    </table>
</form>
</body>
</html>