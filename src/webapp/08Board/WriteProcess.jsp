<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 글쓰기 페이지에 오랫동안 머물러 세션이 삭제되는 경우가 있으므로
처리 시 반드시 로그인을 확인해야 한다. -->
<%@ include file="./IsLoggedIn.jsp" %>
<%
// 클라이언트가 작성한 폼값을 받아온다.
String title = request.getParameter("title");
String content = request.getParameter("content");

// 폼값을 DTO에 저장한다.
BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);
/* 특히 아이디의 경우 로그인 후 작성 페이지에 진입할 수 있으므로
세션 영역에 저장된 회원 아이디를 가져와서 저장한다. */
dto.setId(session.getAttribute("UserId").toString());

// DAO 인스턴스 생성
BoardDAO dao = new BoardDAO(application);
// 메서드 호출해서 insert 쿼리문 실행
int iResult = dao.insertWrite(dto);
// 연결 해제
dao.close();

// 글쓰기에 성공했다면
if (iResult == 1) {
	// 목록으로 이동
	response.sendRedirect("List.jsp");
}
// 글쓰기에 실패했다면
else {
	// 경고창을 띄우고 뒤로 이동한다.
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>