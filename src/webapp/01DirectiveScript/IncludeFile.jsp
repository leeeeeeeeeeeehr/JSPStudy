<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- HTML 주석 ('페이지 소스 보기'하면 화면에 출력됨)
: 보통의 경우 인클루드 되는 JSP 파일은 HTML 태그 없이 순수한 JSP 코드만 작성하는 것이 좋다.
포함되었을 때 HTML 태그가 중복되기 때문이다. -->

<%-- JSP 주석 ('페이지 소스 보기'해도 화면에 출력되지 않음)
: 포함되는 페이지를 만들 때에도 page 지시어는 반드시 있어야 된다.
page 지시어가 없는 JSP 파일은 500 에러가 발생한다. --%>
<%
LocalDate today = LocalDate.now();								// 오늘 날짜
LocalDateTime tomorrow = LocalDateTime.now().plusDays(1);		// 내일 날짜
%>