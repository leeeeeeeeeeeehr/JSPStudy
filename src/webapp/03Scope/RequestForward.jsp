<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>request 영역</title></head>
<body>
	<h2>포워드로 전달된 페이지</h2>
	<h4>RequestMain 파일의 리퀘스트 영역 속성 읽기</h4>
	<%
	/* 앞 페이지에서 포워드한 페이지이므로 request 영역이 공유되어
	아래 속성값을 문제 없이 가져올 수 있다. */
	Person pPerson = (Person)(request.getAttribute("requestPerson"));
	%>
	<ul>
		<!-- 앞에서 remove 되었으므로 null이 출력된다. -->
		<li>String 객체 : <%= request.getAttribute("requestString") %></li>
		<!-- 가져온 값이므로 정상 출력된다. -->
		<li>Person 객체 : <%= pPerson.getName() %>, <%= pPerson.getAge() %></li>
	</ul>
	
	<h4>매개변수로 전달된 값 출력하기</h4>
	<%
		// 파라미터로 전달되는 값은 getParameter()로 받은 후 출력할 수 있다.
// 		request.setCharacterEncoding("UTF-8");				// 한글 깨짐 방지
		out.println(request.getParameter("paramHan"));
		out.println(request.getParameter("paramEng"));
	%>
</body>
</html>