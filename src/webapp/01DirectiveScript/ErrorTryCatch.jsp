<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 - errorPage, isErrorPage 속성</title>
</head>
<body>
<%
/* 에러 페이지 처리 방법 1
: try ~ catch 문으로 예외가 발생되는 지점을 감싸준다. */
try {			// 예외 발생 부분을 감싼다.
	int myAge = Integer.parseInt(request.getParameter("age")) + 10;
	out.println("10년 후 당신의 나이는 " + myAge + "입니다.");
}
catch (Exception e) {
	out.println("예외 발생: 매개변수 age가 null입니다.");
}
%>
</body>
</html>