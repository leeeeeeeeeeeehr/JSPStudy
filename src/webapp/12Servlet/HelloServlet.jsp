<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloServlet.jsp</title>
</head>
<body>
	<h2>web.xml에서 매핑 후 JSP에서 출력하기</h2>
	<p>
		<strong><%= request.getAttribute("message") %></strong>
		<br />
		<!-- 서블릿에서는 요청을 JSP로 보내지 않고 컨트롤러로 보내기 위해
		'요청명'을 통한 링크를 사용한다. -->
		<a href="./HelloServlet.do">바로가기</a>
	</p>
</body>
</html>