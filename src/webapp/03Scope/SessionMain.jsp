<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* session 영역
: 클라이언트가 웹 브라우저를 최초로 연 후 닫을 때까지 요청되는 모든 페이지는 session 영역을 공유한다.
즉, 세션(session)이란 클라이언트가 서버에 접속해있는 상태 혹은 단위를 말한다. */

// List를 생성한다.
ArrayList<String> lists = new ArrayList<String>();
// 2개의 String을 저장한다.
lists.add("리스트");
lists.add("컬렉션");
// List 인스턴스를 session 영역에 저장한다.
session.setAttribute("lists", lists);
%>
<!DOCTYPE html>
<html>
<head><title>session 영역</title></head>
<body>
	<h2>페이지 이동 후 session 영역의 속성 읽기</h2>
	<a href="SessionLocation.jsp">SessionLocation.jsp 바로가기</a>
</body>
</html>