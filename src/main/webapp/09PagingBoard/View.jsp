<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 파라미터로 전달된 게시물의 일련번호를 받아온다.
String num = request.getParameter("num");
// DAO 인스턴스 생성
BoardDAO dao = new BoardDAO(application);
// 게시물 조회수 증가
dao.updateVisitCount(num);
// 출력할 게시물 인출
BoardDTO dto = dao.selectView(num);
// DB 연결 해제
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script>
// 게시물 삭제를 위해 정의한 함수
function deletePost() {
	// 경고창에서 예 또는 아니오를 선택할 수 있는 대화 상자
    var confirmed = confirm("정말로 삭제하겠습니까?"); 
    if (confirmed) {
    	// 폼 태그의 DOM을 얻어온 후
        var form = document.writeFrm;
    	// 전송 방식과 전송할 URL을 설정한다.
        form.method = "post"; 
        form.action = "DeleteProcess.jsp"; 
		// submit() 함수를 호출하여 폼값을 서버로 전송한다.
        form.submit();
		// 그러면 <form> 태그에 설정해둔 일련번호(num)가 서버로 전송된다.
    }
}
</script>
</head>

<body>
<jsp:include page="../Common/Link.jsp" />
<h2>회원제 게시판 - 상세 보기(View)</h2>

<!-- 게시물을 삭제할 때 Javascript를 통해 submit(전송)하기 위해
<form> 태그를 기술한다. 이 게시물의 일련번호를 hidden 입력 상자에 설정해놓는다. -->
<form name="writeFrm">
	<input type="hid-den" name="num" value="<%= num %>" />
</form>

<!-- DTO에 저장된 내용을 getter를 통해 웹 브라우저에 출력한다. -->
<table border="1" width="90%">
	<tr>
	    <td>번호</td>
	    <td><%= dto.getNum() %></td>
	    <td>작성자</td>
	    <td><%= dto.getName() %></td>
	</tr>
	<tr>
	    <td>작성일</td>
	    <td><%= dto.getPostdate() %></td>
	    <td>조회수</td>
	    <td><%= dto.getVisitcount() %></td>
	</tr>
	<tr>
	    <td>제목</td>
	    <td colspan="3"><%= dto.getTitle() %></td>
	</tr>
	<tr>
	    <td>내용</td>
	    <td colspan="3" height="100">
	    	<!-- 입력 시 줄바꿈을 위한 엔터는 \r\n으로 입력되므로
	    	웹 브라우저에 출력할 때에는 <br> 태그로 변경해야 한다. -->
	    	<%= dto.getContent().replace("\r\n", "<br />") %></td> 
	</tr>
	<tr>
	    <td colspan="4" align="center">
<%
/* 로그인이 된 상태에서 세션 영역에 저장된 아이디가 해당 게시물을 작성한 아이디와 일치하면
수정/삭제 버튼을 보이게 처리한다. 즉, 작성자 본인이 해당 게시물을 조회했을 때만 버튼이 보이게 된다.
로그인하지 않은 사용자가 진입하는 경우 첫 번째 조건에 만족하지 않으므로 두 번째 조건은 검사할 필요가 없다. (SCE) */
if (session.getAttribute("UserId") != null
			// 로그인한 사람의 아이디가 작성한 사람의 아이디와 같을 때
			&& session.getAttribute("UserId").toString().equals(dto.getId())) {
%>
		<button type="button" onclick="location.href='Edit.jsp?num=<%= dto.getNum() %>';">
			수정하기</button>
		<button type="button" onclick="deletePost();">삭제하기</button> 
<%
}
%>		
		<button type="button" onclick="location.href='List.jsp';">목록 보기</button>
	    </td>
	</tr>
</table>
</body>
</html>
