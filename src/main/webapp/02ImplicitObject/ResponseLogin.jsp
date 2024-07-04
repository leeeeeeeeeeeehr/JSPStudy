<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>내장 객체 - response</title></head>
<body>
<%
// request 내장 객체를 통해 전송된 폼값을 받는다.
String id = request.getParameter("user_id");
String pwd = request.getParameter("user_pwd");
/* 문자열을 통한 단순 비교로 로그인 정보를 확인한다.
만약 정보가 일치한다면 Welcome 페이지로 이동한다. */
if (id.equalsIgnoreCase("must") && pwd.equalsIgnoreCase("1234")) {
	/* JS의 location.href와 기능적으로 완전히 동일한 메서드로 인수로 주어진 경로로 이동한다. */
	response.sendRedirect("ResponseWelcome.jsp");
}
else {
	/* 인증에 실패한 경우 메인 페이지로 포워드 한다.
	포워드란 페이지 이동과는 다르게 제어의 흐름을 전달하고자 할 때 사용한다.
	웹 브라우저의 주소줄에는 ResponseLogin.jsp가 보여지지만
	실제 출력되는 내용은 ResponseMain.jsp이다.
	아래 명령을 만나기 전까지의 모든 내용을 버퍼에서 제거한 후
	아래 페이지의 내용을 웹 브라우저에 출력하면서 요청 정보와 응답 정보를 전달한다. */
	request.getRequestDispatcher("ResponseMain.jsp?loginErr=1")
		.forward(request, response);
}
%>
</body>
</html>