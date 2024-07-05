<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 수정 페이지로 진입 시 로그인을 확인한다. -->
<%@ include file="./IsLoggedIn.jsp"%>  
<%
/* 수정은 기본적으로 내용보기(View)와 로직이 동일하다.
기존의 내용을 인출한 후 작성폼에 설정해야 하기 떄문이다.
파라미터를 받은 후 수정할 게시물을 인출한다. */
String num = request.getParameter("num");
BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.selectView(num);

/* 로그인한 회원이 해당 게시물의 작성자인지 확인한다.
세션 영역에 저장된 회원 아이디를 가져와서 문자열로 변경한 후
게시물의 작성자와 일치하는지 확인한다.*/
String sessionId = session.getAttribute("UserId").toString();
if (!sessionId.equals(dto.getId())) {
	// 작성자가 아니라면 진입할 수 없도록 뒤로 이동시킨다.
	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
	return;
}
/* URL의 패턴을 파악하면 내가 작성한 게시물이 아니어도 얼마든지 수정 페이지로 진입할 수 있다.
따라서 수정 페이지 자체에서도 본인이 맞는지 확인하는 절차가 필요하다. */
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
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
<h2>회원제 게시판 - 수정하기(Edit)</h2>
<!-- 수정 페이지는 일반적으로 쓰기 페이지를 복사해서 제작하게 되므로
action의 속성값을 반드시 수정해야 한다. -->
<form name="writeFrm" method="post" action="EditProcess.jsp"
      onsubmit="return validateForm(this);">
	<!-- 게시물의 일련번호를 서버로 전송하기 위해 hidden 타입의 입력 상자를 반드시 추가해야 한다.
	이 부분이 추가되지 않으면 게시물은 수정되지 않는다. -->
	<input type="hid-den" name="num" value="<%= dto.getNum() %>" />
    <table border="1" width="90%">
    <tr>
        <td>제목</td>
        <td>
        	<input type="text" name="title" style="width: 90%;" value=<%= dto.getTitle() %>/>
        </td>
    </tr>
    <tr>
        <td>내용</td>
        <td>
        	<textarea name="content" style="width: 90%; height: 100px;"><%= dto.getContent() %></textarea>
        </td>
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