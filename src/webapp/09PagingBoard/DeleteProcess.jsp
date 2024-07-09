<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 삭제 시 로그인이 되어있는지 확인 -->
<%
// 폼값 받기
String num = request.getParameter("num");

// DB 연결 및 기존 게시물 인출
BoardDTO dto = new BoardDTO();
BoardDAO dao = new BoardDAO(application);
dto = dao.selectView(num);

// 세션 영역의 속성을 얻어와서 문자열로 변경, 즉 로그인 아이디를 가져온다.
String sessionId = session.getAttribute("UserId").toString();

int delResult = 0;
// 작성자와 일치하는지 확인한 후
if (sessionId.equals(dto.getId())) {
	// 일치하면 게시물 삭제
	dto.setNum(num);
	delResult = dao.deletePost(dto);
	dao.close();
	
	if (delResult == 1) {
		// 삭제에 성공하면 목록으로 이동한다.
		JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out);
	}
	else {
		// 삭제에 실패하면 뒤로 이동한다.
		JSFunction.alertBack("삭제에 실패하였습니다", out);
	}
}
else {
	// 작성자 본인이 아니면 삭제할 수 없다.
	JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);
	return;
}
%>