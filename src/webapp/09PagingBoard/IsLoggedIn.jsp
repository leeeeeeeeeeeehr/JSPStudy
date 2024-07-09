<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
/* 로그인 체크를 위한 파일로 session 영역에 UserId라는 속성값이 없으면
JS로 경고창(alert)을 띄운 후 로그인 페이지로 이동(location)한다.
로그인이 필요한 모든 페이지 상단에 include 지시어를 통해 포함시킬 예정이다. */
if (session.getAttribute("UserId") == null) {
	JSFunction.alertLocation("로그인 후 이용해주십시오.", "../06Session/LoginForm.jsp", out);
	/* JSP가 Tomcat에서 Java로 변환되면 스크립트릿에 작성된 코드는
	_jspService() 메서드 내부에 기술된다.
	따라서 return은 해당 메서드의 실행을 종료한다는 의미로 사용된다.
	return 이후의 문장은 실행되지 않는다. */
	return;
}
%>