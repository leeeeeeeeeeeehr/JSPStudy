<%@page import="el.MyELClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 정적 메서드가 아닌 일반적인 메서드는 인스턴스를 통해 호출해야 하므로
생성 후 EL에서 접근할 수 있도록 영역에 저장한다.
영역은 어디를 선택하던 상관 없다. 보통 page나 request에 저장한다. */
MyELClass myClass = new MyELClass();			// 객체 생성
pageContext.setAttribute("myClass", myClass); 	// page 영역에 저장
%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head><title>표현언어(EL) - 메서드 호출</title></head>
<body>
	<!-- 일반적인 메서드 호출 -->
	<h3>영역에 저장 후 메서드 호출하기</h3>
	001225-3000000 => ${ myClass.getGender("001225-3000000") }<br />
	001225-2000000 => ${ myClass.getGender("001225-2000000") }

	<!-- 정적 메서드의 경우 인스턴스 생성 없이 클래스명으로 직접 호출할 수 있다. -->
	<h3>클래스명을 통해 정적 메서드 호출하기</h3>
	${ MyELClass.showGugudan(7) }
</body>
</html>