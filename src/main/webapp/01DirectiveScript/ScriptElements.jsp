<%@page import="test.HelloJava"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 선언부 (Declaration)
: 스크립트릿이나 표현식에서 사용할 메서드를 선언할 때 사용한다.
선언부에 선언된 메서드는 해당 JSP가 서블릿으로 변환될 때 멤버메서드 형태로 선언된다. -->
<%!
// 선언부는 !로 시작한다.
// 2개의 정수의 합을 반환하는 메서드를 선언했다.
public int add(int num1, int num2) {
	return num1 + num2;
}
/* Java에서는 메서드 내에 또 다른 메서드를 선언할 수 없다.
JSP는 자바의 문법을 따르므로 선언부에서 !를 제거하는 즉시 에러가 발생한다.
제거하는 순간 _jspService() 내에 메서드를 선언하는 꼴이 되기 때문이다. */
%>
<html>
<head><title>스크립트 요소</title></head>
<body>
<%
/* 스크립트릿 (Scriptlet)
: 주로 JSP 코드를 작성하고 실행할 때 사용한다.
스크립트릿은 <body>, <head> 어디서든 사용할 수 있다.
또한, <script>, <style> 태그 내부에서도 사용할 수 있다.
여기에 기술된 코드는 _jspService() 메서드 내에 포함된다.
그러므로 해당 영역에서는 메서드를 선언할 수 없다. */
int result = add(10, 20);
%>
<!-- 표현식 (Expression)
: 변수를 웹 브라우저 상에 출력할 때 사용한다. JS의 document.write()와 동일하다.
표현식 사용 시 주의할 점은 문장 끝에 ;(세미콜론)을 붙이지 않는다. -->
덧셈 결과 1: <%= result %> <br />
덧셈 결과 2: <%= add(30, 40) %>

<h2>내가 만든 Java 클래스의 메서드 호출하기</h2>
<%
	/* JSP에서 선언부는 빈번하게 사용되지 않는다.
	주로 Java로 클래스를 만든 후 아래와 같이 사용하는 경우가 더 많다. */
	HelloJava helloJava = new HelloJava();
	int sum = helloJava.myFn(1, 100);
	out.println("1~100까지의 합은: " + sum);
%>
</body>
</html>