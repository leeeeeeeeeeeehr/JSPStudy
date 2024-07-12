<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%
/* 하루동안 열지 않음 체크박스를 체크한 후
닫기 버튼을 누르면 값 1이 파라미터로 전송된다. */
String chkVal =request.getParameter("inactiveToday");

// 파라미터가 1이라면
if (chkVal != null && chkVal.equals("1")) {
	// 생성자를 통해 쿠키를 생성한다.
	Cookie cookie = new Cookie("PopupClose", "off");
	// 경로(= 컨텍스트 루트)와 유지시간(= 하루) 설정
	cookie.setPath(request.getContextPath());
	cookie.setMaxAge(60 * 60 * 24);
	// 응답 헤더를 통해 생성된 쿠키를 클라이언트로 전송
	response.addCookie(cookie);
	// 콜백 데이터를 웹 브라우저에 출력한다.
	out.println("쿠키 : 하루동안 열지 않음");
}
%>