<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* request 영역
: 클라이언트가 요청을 할 때마다 새로운 request 객체가 생성되어 같은 요청을 처리하는데
사용되는 모든 JSP 페이지가 영역을 공유한다. 즉, request 영역에 저장된 정보는 현재 페이지와
포워드(forward)된 페이지까지 공유된다. */

// request 영역에 2개의 속성을 저장
request.setAttribute("requestString", "request 영역의 문자열");
request.setAttribute("requestPerson", new Person("안중근", 31));
%>
<!DOCTYPE html>
<html>
<head><title>request 영역</title></head>
<body>
	<h2>request 영역의 속성값 삭제하기</h2>
	<%
		// request 영역에 저장되어있으므로 정상적으로 삭제된다.
		request.removeAttribute("requestString");
		// 없는 속성이므로 삭제되지 않는다. 또한 에러도 발생하지 않는다.
		request.removeAttribute("requestInteger");
	%>
	
	<h2>request 영역의 속성값 읽기</h2>
	<%
	// 동일 페이지에서 저장된 정보이므로 정상적으로 출력된다.
	Person rPerson = (Person)(request.getAttribute("requestPerson"));
	%>
	<ul>
		<!-- 앞에서 삭제되었으므로 null이 출력된다. -->
		<li>String 객체 : <%= request.getAttribute("requestString") %></li>
		<!-- 저장된 정보이므로 정상적으로 출력된다. -->
		<li>Person 객체 : <%= rPerson.getName() %>, <%= rPerson.getAge() %></li>
	</ul>
	
	<h2>포워드된 페이지에서 request 영역 속성값 읽기</h2>
	<%
	/* 포워드
	: 현재 페이지로 들어온 요청을 다음 페이지로 보내는 기능을 말한다.
	즉, 하나의 요청을 둘 이상의 페이지가 공유할 수 있다.
	포워드 명령을 만나기 전까지의 모든 내용은 버퍼에서 삭제되고
	포워드된 페이지의 내용만 화면에 출력하는 특징을 가진다.
	즉, 포워드란 현재 페이지로 들어온 요청을 다른 페이지에서도 공유할 수 있도록 전달하는 것을 말한다.
	그렇기 때문에 주소줄에는 최초 요청을 받은 페이지명이 나오게되고
	실제 출력되는 내용은 요청이 전달된 페이지가 나오게 된다. */
	request
		.getRequestDispatcher("RequestForward.jsp?paramHan=한글&paramEng=English")
		.forward(request, response);
	/* 포워드 시 2개의 파라미터를 전달한다. 또한 request 영역에 저장된 속성도 같이 공유된다. */
	%>
</body>
</html>